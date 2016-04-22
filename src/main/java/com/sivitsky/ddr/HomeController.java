package com.sivitsky.ddr;

import com.sivitsky.ddr.model.*;
import com.sivitsky.ddr.repository.UserRepository;
import com.sivitsky.ddr.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
@SessionAttributes({"manufacturFilterList", "price_from", "price_to", "offerFilterList", "cartInfo", "user", "cart", "listPart", "listOrders"})
public class HomeController {

    @Autowired
    private ManufacturService manufacturService;
    @Autowired
    private PartService partService;
    @Autowired
    private OfferService offerService;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private CartService cartService;

    @Autowired
    private UserRepository userRepository;

    private List<ManufacturFilterService> manufacturFilterList = new ArrayList<ManufacturFilterService>();

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

    @Autowired(required = true)
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
                            Cart cart, User user, ArrayList<Order> listOrders) {

        HttpSession session = httpRequest.getSession(true);
        session.setAttribute("price_from", (price_from == null) ? 0 : Float.parseFloat(price_from));
        session.setAttribute("price_to", (price_to == null) ? 0 : Float.parseFloat(price_to));
        Cart new_cart = new Cart();
        Float price_froom = Float.parseFloat(session.getAttribute("price_from").toString());
        Float price_too = Float.parseFloat(session.getAttribute("price_to").toString());

        if (principal != null) {
            user = userService.getUserByEmail(principal.getName());
            if (user.getUser_id() != null) {
                if (cartService.getCartByUser(user) == null) {
                    Random random = new Random();
                    int cart_id = random.nextInt(Integer.MAX_VALUE);
                    new_cart.setCart_id((long) cart_id);
                    new_cart.setUser(user);
                    cartService.saveCart(new_cart);
                }
                if (listOrders != null) {
                    if (listOrders.size() > 0) {
                        for (Order or : listOrders) {
                            or.setUser(user);
                            orderService.saveOrder(or);
                        }
                    }
                }

                if (orderService.getOrdersByCartId(cart.getCart_id()) != null) {
                    cartService.replaceCartInOrder(cart, new_cart);
                }
                cart = new_cart;
                Object cartInfo = orderService.getOrderTotalByUserId(user.getUser_id());
                if (cartInfo != null) {
                    model.addAttribute("cartInfo", cartInfo);
                }
            }
        } else {
            if (cart.getCart_id() == null) {
                Random random = new Random();
                int cart_id = random.nextInt(Integer.MAX_VALUE);
                cart.setCart_id((long) cart_id);
            }
        }
        setUsageAsFalse();
        Integer recordsPerPage = 2;
        if (page == null) {
            page = 1;
        }

        Long[] l_array_manufacturs;
        if (array_manufacturs != null && array_manufacturs.length > 0 || price_froom != 0 || price_too != 0) {
            if (array_manufacturs != null) {
                l_array_manufacturs = new Long[array_manufacturs.length];
                for (int i = 0; i < array_manufacturs.length; i++) {
                    l_array_manufacturs[i] = Long.parseLong(array_manufacturs[i]);
                }
                setUsageAsTrue(l_array_manufacturs);
            } else {
                l_array_manufacturs = new Long[0];
            }
            model.addAttribute("listPart", offerService.listOffersByManufactIdAndPrice(l_array_manufacturs, price_froom, price_too));
        } else {
            model.addAttribute("listPart", partService.listPartWithDetail((page - 1) * recordsPerPage, recordsPerPage));
        }

        int noOfRecords = partService.getCountOfPart();
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
        Integer recordsPerPage = 5;
        if (httpServletRequest.getParameter("page") != null)
            page = Integer.parseInt(httpServletRequest.getParameter("page"));

        model.addAttribute("listPart", partService.listPartWithDetail((page - 1) * recordsPerPage, recordsPerPage));
        model.addAttribute("manufacturFilterList", manufacturFilterList);
        return "index";
    }

    @RequestMapping(value = "/part/photo/{part_id}", method = RequestMethod.GET)
    @ResponseBody
    public byte[] downloadPhoto(@PathVariable("part_id") Long part_id) {
        Part part = partService.getPartById(part_id);
        return part.getPhoto();
    }
}
