package com.sivitsky.ddr;

import com.sivitsky.ddr.model.Description;
import com.sivitsky.ddr.model.Specification;
import com.sivitsky.ddr.service.DescriptionService;
import com.sivitsky.ddr.service.DescriptionWrapper;
import com.sivitsky.ddr.service.PartService;
import com.sivitsky.ddr.service.SpecificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@SessionAttributes({"descriptionWrapper"})
public class DescriptionController {

    @Autowired
    private DescriptionService descriptionService;
    @Autowired
    private PartService partService;
    @Autowired
    private SpecificationService specificationService;

    private List<Description> descriptionList;

    @RequestMapping("/part/description")
    public Model startDescription(Model model) {
        model.addAttribute("description", new Description());
        return model;
    }

    @RequestMapping("/part/{part_id}/descript/remove/{descript_id}")
    public String removeUser(@PathVariable("descript_id") Long id, @PathVariable("part_id") Long part_id) {
        this.descriptionService.removeDescription(id);
        return "redirect:/part/descript/edit/" + part_id.toString();
    }

    @RequestMapping(value = "/part/descript/edit/{part_id}", method = RequestMethod.GET)
    public String addDescriptionGet(@PathVariable("part_id") Long part_id, Model model) {
        descriptionList = new ArrayList<Description>();
        descriptionList = descriptionService.listDescriptionByPartId(part_id);
        if (descriptionList.size() != 0) {
        } else {
            for (Specification specification : specificationService.listSpecification()) {
                Description description = new Description();
                description.setPart(partService.getPartById(part_id));
                description.setSpecification(specification);
                description.setDescript_name(specification.getSpec_name());
                descriptionList.add(description);
            }
        }
        DescriptionWrapper descriptionWrapper = new DescriptionWrapper(descriptionList);
        model.addAttribute("part", partService.getPartById(part_id));
        model.addAttribute("descriptionWrapper", descriptionWrapper);
        return "description";
    }

    @RequestMapping(value = "/part/descript/save", method = RequestMethod.POST)
    public String addDescriptionPost(@ModelAttribute("descriptionWrapper") DescriptionWrapper descriptionWrapper) {
        for (Description description : descriptionWrapper.getDescriptionList()) {
            descriptionService.saveDescription(description);
        }
        return "redirect:/part/list";
    }
}
