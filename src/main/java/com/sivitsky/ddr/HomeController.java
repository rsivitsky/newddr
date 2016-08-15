package com.sivitsky.ddr;

import com.sivitsky.ddr.model.*;
import com.sivitsky.ddr.repository.UserRepository;
import com.sivitsky.ddr.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
@SessionAttributes({"manufacturFilterList", "offerFilterList", "cartInfo", "user", "cart", "listPart", "listOrders"})
public class HomeController {

    @Autowired
    private OfferService offerService;

    @Autowired
    private PartService partService;

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CartService cartService;

    @Autowired
    private UserRepository userRepository;

    private List<ManufacturFilterService> manufacturFilterList = new ArrayList<>();

    void setUsageAsFalse() {
        for (ManufacturFilterService manufacturFilter : manufacturFilterList) {
            manufacturFilter.setUsage(false);
        }
    }

    void setUsageAsTrue(Long[] array_manufacturs) {
        for (Long select_id : array_manufacturs) {
            for (ManufacturFilterService manufacturFilter : manufacturFilterList) {
                if (manufacturFilter.getManufactur().getManufactur_id().equals(select_id)) {
                    manufacturFilter.setUsage(true);
                }
            }
        }
    }

    @Autowired
    public void setManufacturService(ManufacturService manufacturService) {
        if (manufacturService.listManufactur().size() > 0) {
            for (Manufactur manufactur : manufacturService.listManufactur()) {
                ManufacturFilterService manufacturFilterService = new ManufacturFilterService();
                manufacturFilterService.setManufactur(manufactur);
                manufacturFilterService.setUsage(false);
                manufacturFilterList.add(manufacturFilterService);
            }
        }
    }

    @RequestMapping("/givemeuser")
    public String listUsers() {
        Iterable<User> users = userRepository.findAll();
        System.out.println(users);
        return "index";
    }

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String startPage(@RequestParam(value = "page", required = false) Integer page,
                            @RequestParam(value = "manufacturs", required = false) String[] array_manufacturs,
                            @RequestParam(value = "price_from", required = false) String price_from,
                            @RequestParam(value = "price_to", required = false) String price_to,
                            Model model, Principal principal, HttpServletRequest httpRequest,
                            Cart cart, User user) {

        HttpSession session = httpRequest.getSession(true);
        session.setAttribute("price_from", (price_from == null || price_from.equals("")) ? 0 : Float.parseFloat(price_from));
        session.setAttribute("price_to", (price_to == null || price_to.equals("")) ? 0 : Float.parseFloat(price_to));

        Cart new_cart;

        if (session.getAttribute("anonym") == null) {
            session.setAttribute("anonym", userService.saveUser(new User()));
        }

        if (principal != null) {
            if (user.getUser_id() == null) {
                user = userService.getUserByEmail(principal.getName());
            }
            new_cart = cartService.getCartByUser(user);
            if (new_cart == null) {
                Random random = new Random();
                new_cart = new Cart();
                int cart_id = random.nextInt(Integer.MAX_VALUE);
                new_cart.setCart_id((long) cart_id);
                new_cart.setUser(user);
                cartService.saveCart(new_cart);
            }
            if (orderService.getOrdersByUserId((User) session.getAttribute("anonym")).size() > 0) {
                for (Order or : orderService.getOrdersByUserId((User) session.getAttribute("anonym"))) {
                    or.setCart(new_cart);
                    or.setUser(user);
                    orderService.saveOrder(or);
                }
            }

            if (session.getAttribute("anonym") != null) {
                cartService.removeCart(cartService.getCartByUser((User) session.getAttribute("anonym")));
                userService.removeUser((User) session.getAttribute("anonym"));
                session.removeAttribute("anonym");
            }

            cart = new_cart;
            Object cartInfo = orderService.getOrderTotalByUserId(user);
            if (cartInfo != null) {
                model.addAttribute("cartInfo", cartInfo);
            } else {
                int[] cartIsNull = {0, 0};
                model.addAttribute("cartInfo", cartIsNull);
            }

        } else {
            if (cart.getCart_id() == null) {
                if (!model.containsAttribute("listOrders")) {
                    model.addAttribute("listOrders", new ArrayList<Order>());
                }
                Random random = new Random();
                int cart_id = random.nextInt(Integer.MAX_VALUE);
                cart.setUser((User) session.getAttribute("anonym"));
                cart.setCart_id((long) cart_id);
                cartService.saveCart(cart);
            }
            Object cartInfo = orderService.getOrderTotalByUserId((User) session.getAttribute("anonym"));
            if (cartInfo != null) {
                model.addAttribute("cartInfo", cartInfo);
            } else {
                int[] cartIsNull = {0, 0};
                model.addAttribute("cartInfo", cartIsNull);
            }
        }
        setUsageAsFalse();
        Integer recordsPerPage = 2;
        if (page == null) {
            page = 1;
        }

        Long[] l_array_manufacturs;
        int noOfRecords = 0;
        List listPart;
        if (array_manufacturs != null && array_manufacturs.length > 0 || Float.parseFloat(session.getAttribute("price_from").toString()) != 0 || Float.parseFloat(session.getAttribute("price_to").toString()) != 0) {
            if (array_manufacturs != null) {
                l_array_manufacturs = new Long[array_manufacturs.length];
                for (int i = 0; i < array_manufacturs.length; i++) {
                    l_array_manufacturs[i] = Long.parseLong(array_manufacturs[i]);
                }
                setUsageAsTrue(l_array_manufacturs);
            } else {
                l_array_manufacturs = new Long[0];
            }
            listPart = offerService.listOffersByManufactIdAndPrice(l_array_manufacturs, Float.parseFloat(session.getAttribute("price_from").toString()), Float.parseFloat(session.getAttribute("price_to").toString()), (page - 1) * recordsPerPage, recordsPerPage);
            model.addAttribute("listPart", listPart);
            Object countOfRec = offerService.getCountOffers(l_array_manufacturs, Float.parseFloat(session.getAttribute("price_from").toString()), Float.parseFloat(session.getAttribute("price_to").toString()));
            noOfRecords = Integer.parseInt((countOfRec == null) ? "1" : countOfRec.toString());
        } else {
            listPart = partService.listPartWithDetail((page - 1) * recordsPerPage, recordsPerPage);
            model.addAttribute("listPart", listPart);
            noOfRecords = partService.getCountOfPart();
        }
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        model.addAttribute("noOfPages", noOfPages);
        model.addAttribute("page", page);
        model.addAttribute("manufacturFilterList", manufacturFilterList);
        model.addAttribute("user", user);
        model.addAttribute("cart", cart);
        return "index";
    }

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.POST)
    public String startPagePost(Model model, HttpServletRequest httpServletRequest) {
        Integer page = 1;
        Integer recordsPerPage = 2;
        if (httpServletRequest.getParameter("page") != null)
            page = Integer.parseInt(httpServletRequest.getParameter("page"));

        model.addAttribute("listPart", partService.listPartWithDetail((page - 1) * recordsPerPage, recordsPerPage));
        model.addAttribute("manufacturFilterList", manufacturFilterList);
        return "index";
    }

    @RequestMapping(value = "/part/photo/{part_id}", method = RequestMethod.GET)
    @ResponseBody
    public void downloadPhoto(@PathVariable("part_id") Long part_id, HttpServletResponse httpServletResponse) throws IOException {
        Part part = partService.getPartById(part_id);
        byte[] imageBytes = part.getPhoto();
        httpServletResponse.setContentType("image/jpeg");
        httpServletResponse.setContentLength(imageBytes.length);
        httpServletResponse.getOutputStream().write(imageBytes);
    }
}