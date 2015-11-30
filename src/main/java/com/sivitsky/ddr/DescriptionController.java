package com.sivitsky.ddr;

import com.sivitsky.ddr.model.Description;
import com.sivitsky.ddr.model.Specification;
import com.sivitsky.ddr.service.DescriptionService;
import com.sivitsky.ddr.service.PartService;
import com.sivitsky.ddr.service.SpecificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
@SessionAttributes({"descriptionList"})
public class DescriptionController {

    private DescriptionService descriptionService;
    private PartService partService;
    private SpecificationService specificationService;
    private List<Description> descriptionList;

    @Autowired(required=true)
    public void setDescriptionService(DescriptionService descriptionService) {
        this.descriptionService = descriptionService;
    }

    @Autowired(required=true)
    public void setSpecificationService(SpecificationService specificationService) {
        this.specificationService = specificationService;
    }

    @Autowired(required=true)
    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @RequestMapping("/part/description")
    public Model startDescription(Model model){
        model.addAttribute("description", new Description());
        return model;
    }

    @RequestMapping(value = "/part/descript/edit/{part_id}", method = RequestMethod.GET)
    public String addDescriptionGet(@PathVariable("part_id") Long part_id, Model model){
        descriptionList = new ArrayList<Description>();
        descriptionList = descriptionService.listDescriptionByPartId(part_id);
        if (descriptionList != null){
        }
        else{
            for (Specification specification: specificationService.listSpecification()){
                Description description = new Description();
                description.setPart(partService.getPartById(part_id));
                description.setSpecification(specification);
                description.setDescript_name(specification.getSpec_name());
                descriptionList.add(description);
            }
        }
        model.addAttribute("part", partService.getPartById(part_id));
        model.addAttribute("descriptionList", descriptionList);
        return "description";
    }

    @RequestMapping(value = "/part/descript/edit/{part_id}", method = RequestMethod.POST)
    public String addDescriptionPost(@PathVariable("part_id") Long part_id)
    {
        for (Description description: descriptionList){
            descriptionService.saveDescription(description);
        }
        return "part";
    }
}
