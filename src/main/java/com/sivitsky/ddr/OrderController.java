package com.sivitsky.ddr;

import com.sivitsky.ddr.model.Order;
import com.sivitsky.ddr.model.OrderStatus;
import com.sivitsky.ddr.model.User;
import com.sivitsky.ddr.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@SessionAttributes({"order", "user", "cartInfo", "booking"})
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private PartService partService;
    @Autowired
    private UserService userService;
    @Autowired
    private OfferService offerService;
    @Autowired
    private IMailService mailService;

    @RequestMapping("/order/list")
    public String orderList(Model model) {
        model.addAttribute("order", new Order());
        model.addAttribute("orderList", orderService.listOrder());
        model.addAttribute("listOffers", offerService.listOffer());
        model.addAttribute("listUser", userService.listUsers());
        model.addAttribute("listPart", partService.listPart());
        model.addAttribute("status", OrderStatus.values());
        return "order";
    }

    @RequestMapping("/order/remove/{order_id}")
    public String removeOrder(@PathVariable("order_id") Long order_id) {
        this.orderService.removeOrder(order_id);
        return "redirect:/order/list";
    }

    @RequestMapping(value = "/order/add", method = RequestMethod.POST)
    public String addOrderPost(@ModelAttribute("order") Order order, BindingResult result) {
        this.orderService.saveOrder(order);
        return "redirect:/order/list";
    }

    @RequestMapping("/order/edit/{order_id}")
    public String editOrder(@PathVariable("order_id") Long order_id, Model model) {
        model.addAttribute("order", this.orderService.getOrderById(order_id));
        model.addAttribute("orderList", orderService.listOrder());
        model.addAttribute("listOffers", offerService.listOffer());
        model.addAttribute("listUser", userService.listUsers());
        model.addAttribute("listPart", partService.listPart());
        model.addAttribute("status", OrderStatus.values());
        return "order";
    }

    @RequestMapping(value = "/order/place/{order_id}", method = RequestMethod.GET)
    public String placeOrder(@PathVariable("order_id") Long booking_id, Model model, Principal principal, User user) {
        if (principal != null) {
            orderService.changeOrderStatus(booking_id, OrderStatus.ORDERED.toString());
            this.mailService.sendMail("rsivitsky@gmail.com", user.getEmail(), "Your new order on http://pansivitsky.net",
                    "Hi, " + user.getEmail() + ",\n you have ordered: " + orderService.getOrderById(booking_id).getPart().getPart_name());
            Object cartInfo = orderService.getOrderTotalByUserId(user);
            if (cartInfo != null) {
                model.addAttribute("cartInfo", cartInfo);
            } else {
                int[] cartIsNull = {0, 0};
                model.addAttribute("cartInfo", cartIsNull);
            }
        }
        return "redirect:/cart/info";
    }

    @RequestMapping("/order/place/all")
    public String placeAllOrders(Model model, User user, Principal principal) {
        if (principal != null) {
            if (user.getUser_id() == null) {
                user = userService.getUserByEmail(principal.getName());
            }
            List<Order> listOrders = orderService.getNewOrdersByUserId(user);
            List<String> listPartNames = new ArrayList();
            if (listOrders != null) {
                for (Order order : listOrders) {
                    orderService.changeOrderStatus(order.getBooking_id(), OrderStatus.ORDERED.toString());
                    listPartNames.add(order.getPart().getPart_name());
                }
            }
            this.mailService.sendMail("rsivitsky@gmail.com", user.getEmail(), "Your new order on http://pansivitsky.net",
                    "Hi, " + user.getEmail() + ",\n you have ordered: " + listPartNames.toString());
            Object cartInfo = orderService.getOrderTotalByUserId(user);
            if (cartInfo != null) {
                model.addAttribute("cartInfo", cartInfo);
            } else {
                int[] cartIsNull = {0, 0};
                model.addAttribute("cartInfo", cartIsNull);
            }
        }
        return "redirect:/cart/info";
    }

    @RequestMapping(value = "/order/print_pdf/{order_id}", method = RequestMethod.GET)
    public ModelAndView printPdfOrder(@PathVariable("order_id") Long booking_id, HttpServletRequest httpRequest) {
        HttpSession session = httpRequest.getSession(true);
        session.setAttribute("booking", orderService.getOrderById(booking_id));
        return new ModelAndView("pdfView");
    }

    @RequestMapping(value = "/order/cancel/{order_id}", method = RequestMethod.GET)
    public String cancelCart(@PathVariable("order_id") Long booking_id, Model model, User user, HttpServletRequest httpRequest) {
        orderService.changeOrderStatus(booking_id, OrderStatus.CANCELED.toString());
        if (user.getUser_id() == null) {
            HttpSession session = httpRequest.getSession(true);
            Object cartInfo = orderService.getOrderTotalByUserId((User) session.getAttribute("anonym"));
            if (cartInfo != null) {
                model.addAttribute("cartInfo", cartInfo);
            } else {
                int[] cartIsNull = {0, 0};
                model.addAttribute("cartInfo", cartIsNull);
            }
            model.addAttribute("orderListByUser", orderService.getOrdersByUserId((User) session.getAttribute("anonym")));
        } else {
            Object cartInfo = orderService.getOrderTotalByUserId(user);
            if (cartInfo != null) {
                model.addAttribute("cartInfo", cartInfo);
            } else {
                int[] cartIsNull = {0, 0};
                model.addAttribute("cartInfo", cartIsNull);
            }
            model.addAttribute("orderListByUser", orderService.getOrdersByUserId(user));
        }
        return "cart";
    }
}
