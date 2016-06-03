package com.sivitsky.ddr;

import com.sivitsky.ddr.model.Part;
import com.sivitsky.ddr.service.DescriptionService;
import com.sivitsky.ddr.service.ManufacturService;
import com.sivitsky.ddr.service.PartService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.InputStream;

@Controller
@SessionAttributes({"part", "listPart"})
public class PartController {

    @Autowired
    private PartService partService;
    @Autowired
    private ManufacturService manufacturService;
    @Autowired
    private DescriptionService descriptionService;

    @RequestMapping(value = "/part/list", method = RequestMethod.GET)
    public String startPart(Model model) {
        model.addAttribute("part", new Part());
        model.addAttribute("listPart", partService.listPart());
        model.addAttribute("listManufactur", manufacturService.listManufactur());
        return "part";
    }

    @RequestMapping(value = "/part/add", method = RequestMethod.GET)
    public String addPartGet(Model model) {
        model.addAttribute("part", new Part());
        return "add_part";
    }

    @RequestMapping(value = "/part/add", method = RequestMethod.POST)
    public String addPartPost(@ModelAttribute("part") Part part, @RequestParam(value = "img_file", required = false) javax.servlet.http.Part img_file, BindingResult result) {
        if (img_file.getSize() != 0) {
            byte[] fileContent = null;
            try {
                InputStream inputStream = img_file.getInputStream();
                fileContent = IOUtils.toByteArray(inputStream);
            } catch (IOException ex) {
                System.out.println();
            }
            if (fileContent != null) {
                part.setPhoto(fileContent);
            }
        }
        this.partService.savePart(part);
        return "redirect:/part/list";
    }

    @RequestMapping("/part/remove/{part_id}")
    public String removePart(@PathVariable("part_id") Long part_id) {
        this.partService.removePart(part_id);
        return "redirect:/part/list";
    }

    @RequestMapping("/part/edit/{part_id}")
    public String editPart(@PathVariable("part_id") Long part_id, Model model) {
        model.addAttribute("part", this.partService.getPartById(part_id));
        model.addAttribute("listPart", partService.listPart());
        model.addAttribute("listManufactur", manufacturService.listManufactur());
        //return "add_part";
        return "part";
    }

    @RequestMapping(value = "/part/description/{part_id}", method = RequestMethod.GET)
    public String partDescription(Model model, @PathVariable("part_id") Long part_id) {
        model.addAttribute("part", this.partService.getPartById(part_id));
        model.addAttribute("descriptions", this.descriptionService.listDescriptionByPartId(part_id));
        return "partDescription";
    }
}
