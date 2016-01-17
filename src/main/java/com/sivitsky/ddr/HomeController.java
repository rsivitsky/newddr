package com.sivitsky.ddr;

import com.sivitsky.ddr.model.Manufactur;
import com.sivitsky.ddr.model.Part;
import com.sivitsky.ddr.service.ManufacturFilterService;
import com.sivitsky.ddr.service.ManufacturService;
import com.sivitsky.ddr.service.PartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@SessionAttributes({"manufacturFilterList", "price_from", "price_to"})
public class HomeController {
    private PartService partService;
    private ManufacturService manufacturService;
    private List<ManufacturFilterService> manufacturFilterList = new ArrayList<ManufacturFilterService>();
    private Float price_from;
    private Float price_to;

    public Float getPrice_from() {
        return price_from;
    }

    public void setPrice_from(String price_from) {
        this.price_from = Float.parseFloat(price_from);
    }

    public Float getPrice_to() {
        return price_to;
    }

    public void setPrice_to(String price_to) {
        this.price_to = Float.parseFloat(price_to);
    }

    void setUsageAsFalse() {
        for (ManufacturFilterService manufacturFilter : manufacturFilterList) {
            manufacturFilter.setUsage(false);
        }
    }

    void setUsageAsTrue(Long[] array_manufacturs) {
        for (Long select_id : array_manufacturs) {
            for (ManufacturFilterService manufacturFilter : manufacturFilterList) {
                if (manufacturFilter.getManufactur().getManufactur_id().equals(select_id)) {
                    manufacturFilter.setUsage(true);
                }
            }
        }
    }

    @Autowired(required = true)
    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @Autowired(required = true)
    public void setManufacturService(ManufacturService manufacturService) {
        this.manufacturService = manufacturService;
        if (manufacturService.listManufactur().size() > 0) {
            for (Manufactur manufactur : manufacturService.listManufactur()) {
                ManufacturFilterService manufacturFilterService = new ManufacturFilterService();
                manufacturFilterService.setManufactur(manufactur);
                manufacturFilterService.setUsage(false);
                manufacturFilterList.add(manufacturFilterService);
            }
        }
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String startPage(@RequestParam(value = "manufacturs", required = false) String[] array_manufacturs,
                            @RequestParam(value = "price_from", required = false) String price_from,
                            @RequestParam(value = "price_to", required = false) String price_to,
                            Model model) {
        setUsageAsFalse();
        this.setPrice_from((price_from != null) ? price_from:"0");
        this.setPrice_to((price_to != null) ? price_to:"0");
        if (array_manufacturs != null && array_manufacturs.length > 0) {
            Long[] l_array_manufacturs = new Long[array_manufacturs.length];
            for (int i = 0; i < array_manufacturs.length; i++) {
                l_array_manufacturs[i] = Long.parseLong(array_manufacturs[i]);
            }
            setUsageAsTrue(l_array_manufacturs);
           // model.addAttribute("listPart", partService.listPartWithManufactursFilter(l_array_manufacturs));
            model.addAttribute("listPart", partService.listPartByManufactIdAndPrice(l_array_manufacturs, this.getPrice_from(), this.getPrice_to()));
        } else {
            model.addAttribute("listPart", partService.listPartWithDetail());
        }
        model.addAttribute("price_from", this.getPrice_from());
        model.addAttribute("price_to", this.getPrice_to());
        model.addAttribute("manufacturFilterList", manufacturFilterList);
        return "index";
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String startPagePost(Model model) {
        model.addAttribute("listPart", partService.listPartWithDetail());
        model.addAttribute("manufacturFilterList", manufacturFilterList);
        return "index";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String startPageIdx() {
        return "redirect:/";
    }

    @RequestMapping(value = "/part/photo/{part_id}", method = RequestMethod.GET)
    @ResponseBody
    public byte [] downloadPhoto (@PathVariable ("part_id") Long part_id) {
        Part part = partService.getPartById(part_id);
        return part.getPhoto();
    }
}