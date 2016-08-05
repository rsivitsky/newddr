package com.sivitsky.ddr;

import com.sivitsky.ddr.model.Specification;
import com.sivitsky.ddr.service.MeasureService;
import com.sivitsky.ddr.service.SpecificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@SessionAttributes({"specification"})
public class SpecificationController {

    @Autowired
    private SpecificationService specificationService;

    @Autowired
    private MeasureService measureService;

    @RequestMapping(value = "/specification", method = RequestMethod.GET)
    public String startPage(Model model) {
        model.addAttribute("specification", new Specification());
        model.addAttribute("listSpec", specificationService.listSpecification());
        model.addAttribute("listMeasure", measureService.listMeasure());
        return "specification";
    }

    //For add and update person both
    @RequestMapping(value = "/specification/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("specification") Specification specification, BindingResult result) {
        specificationService.saveSpecification(specification);
        return "redirect:/specification";
    }

    @RequestMapping("/specification/remove/{spec_id}")
    public String removeUser(@PathVariable("spec_id") Long id) {
        this.specificationService.removeSpecification(id);
        return "redirect:/specification";
    }

    @RequestMapping("/specification/edit/{spec_id}")
    public String editUser(@PathVariable("spec_id") Long id, Model model) {
        model.addAttribute("specification", this.specificationService.getSpecificationById(id));
        model.addAttribute("listSpec", this.specificationService.listSpecification());
        model.addAttribute("listMeasure", this.measureService.listMeasure());
        return "specification";
    }
}
