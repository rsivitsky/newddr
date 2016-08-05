package com.sivitsky.ddr;

import com.sivitsky.ddr.model.Manufactur;
import com.sivitsky.ddr.service.ManufacturService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@SessionAttributes({"manufactur"})
public class ManufacturController {

    @Autowired
    private ManufacturService manufacturService;

    @RequestMapping(value = "/manufactur", method = RequestMethod.GET)
    public String startPage(Model model) {
        model.addAttribute("manufactur", new Manufactur());
        model.addAttribute("listManufacturs", manufacturService.listManufactur());
        return "manufactur";
    }

    @RequestMapping(value = "/manufactur/add", method = RequestMethod.POST)
    public String addManufactur(@ModelAttribute("manufactur") Manufactur manufactur, BindingResult result) {
        manufacturService.saveManufactur(manufactur);
        return "redirect:/manufactur";
    }

    @RequestMapping("/manufactur/remove/{manufactur_id}")
    public String removeManufactur(@PathVariable("manufactur_id") Long id) {
        this.manufacturService.removeManufactur(id);
        return "redirect:/manufactur";
    }

    @RequestMapping("/manufactur/edit/{manufactur_id}")
    public String editManufactur(@PathVariable("manufactur_id") Long id, Model model) {
        model.addAttribute("manufactur", this.manufacturService.getManufacturById(id));
        model.addAttribute("listManufacturs", this.manufacturService.listManufactur());
        return "manufactur";
    }
}
