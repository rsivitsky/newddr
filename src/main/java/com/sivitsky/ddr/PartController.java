package com.sivitsky.ddr;

import com.sivitsky.ddr.model.Part;
import com.sivitsky.ddr.service.DescriptionService;
import com.sivitsky.ddr.service.PartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@SessionAttributes({"part"})
public class PartController {
    private PartService partService;
    private DescriptionService descriptionService;

    @Autowired(required=true)
    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @Autowired(required=true)
    public void setDescriptionService(DescriptionService descriptionService) {
        this.descriptionService = descriptionService;
    }

    @RequestMapping("/part/list")
    public String startPart(Model model)
    {
        model.addAttribute("listPart", partService.listPartWithDetail());
        return "part";
    }

    @RequestMapping(value="/part/add", method = RequestMethod.GET)
    public String addUserGet(Model model){
        model.addAttribute("part", new Part());
        return "add_part";
    }

    @RequestMapping(value= "/part/add", method = RequestMethod.POST)
    public String addUserPost(@ModelAttribute("part") Part part, BindingResult result){
        part = this.partService.savePart(part);
        return "redirect:/part/list";
    }

    @RequestMapping("/part/remove/{part_id}")
    public String removeUser(@PathVariable("part_id") Long id){
        this.partService.removePart(id);
        return "redirect:/part/list";
    }

    @RequestMapping("/part/edit/{part_id}")
    public String editUser(@PathVariable("part_id") Long id, Model model){
        model.addAttribute("part", this.partService.getPartById(id));
       // model.addAttribute("listPart", this.partService.listPart());
        return "add_part";
    }
}
