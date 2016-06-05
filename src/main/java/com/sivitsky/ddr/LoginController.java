package com.sivitsky.ddr;

import com.sivitsky.ddr.model.ListRole;
import com.sivitsky.ddr.model.User;
import com.sivitsky.ddr.service.MailService;
import com.sivitsky.ddr.service.RoleService;
import com.sivitsky.ddr.service.UserService;
import com.sivitsky.ddr.service.VendorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@SessionAttributes({"listRolesWithoutAdmin", "listVendors"})
public class LoginController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private VendorService vendorService;
    @Autowired
    private MailService mailService;
    @Autowired
    private AuthenticationManager authenticationManager;

    @RequestMapping(value = "/j_spring_security_check", method = RequestMethod.POST)
    public String loginPagePost(Model model) {
        return "redirect:/";
    }

    @RequestMapping(value = "/registration")
    public String addUser(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("listRolesWithoutAdmin", roleService.getRolesWithoutAdmin());
        //return "quick_registration";
        return "registration";
    }

    @RequestMapping(value = "/registration/save", method = RequestMethod.POST)
    public String saveUser(@Valid User user, BindingResult result, HttpServletRequest request) {

        if (result.hasErrors()) {
            return "quick_registration";
        }
        if (userService.getUserByEmail(user.getEmail()) != null) {
            request.setAttribute("user_already_exist", true);
            return "quick_registration";
        }
        if (user.getRole() == null) {
            user.setRole(ListRole.ROLE_USER.toString());
        }
        this.userService.saveUser(user);
        this.mailService.sendMail("rsivitsky@gmail.com", user.getEmail(), "registration on http://pansivitsky.net",
                "Hi, " + user.getEmail() + ",\n your login is: " + user.getEmail() + " \n and your password is: " + user.getPassword());
        autoLogin(user.getEmail(), user.getPassword(), request);
        request.getSession().setAttribute("user_id", user.getUser_id());
        return "redirect:/index";

    }

    public void autoLogin(String email, String password, HttpServletRequest request) {

        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(email, password);
        Authentication authentication = authenticationManager.authenticate(token);
        SecurityContextHolder.getContext().setAuthentication(authentication);
        request.getSession().setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, SecurityContextHolder.getContext());

    }
}
