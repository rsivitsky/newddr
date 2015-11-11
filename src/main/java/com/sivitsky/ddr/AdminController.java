package com.sivitsky.ddr;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String startPage(Model model) {
        return "admin";
    }
}
