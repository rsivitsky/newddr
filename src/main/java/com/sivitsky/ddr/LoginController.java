package com.sivitsky.ddr;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
    @RequestMapping(value="/j_spring_security_check", method = RequestMethod.POST)
    public String loginPagePost(Model model){
        return "redirect:/";
    }
}
