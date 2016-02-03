package com.sivitsky.ddr;

import com.sivitsky.ddr.model.Measure;
import com.sivitsky.ddr.model.Offer;
import com.sivitsky.ddr.model.User;
import com.sivitsky.ddr.model.Vendor;
import com.sivitsky.ddr.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.security.Principal;

@Controller
@SessionAttributes({"offer", "listOffers", "vendor_id"})
public class OfferController {

    private OfferService offerService;
    private CurrencyService currencyService;
    private PartService partService;
    private VendorService vendorService;
    private ExcelReaderService excelReaderService;
    private UserService userService;

    @Autowired(required = true)
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired(required = true)
    public void setExcelReaderService(ExcelReaderService excelReaderService) {
        this.excelReaderService = excelReaderService;
    }

    @Autowired(required = true)
    public void setOfferService(OfferService offerService) {
        this.offerService = offerService;
    }

    @Autowired(required = true)
    public void setCurrencyService(CurrencyService currencyService) {
        this.currencyService = currencyService;
    }

    @Autowired(required = true)
    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @Autowired(required = true)
    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    @RequestMapping(value = "/offers", method = RequestMethod.GET)
    public String listOffers(HttpServletRequest request, Model model, Principal principal) {
        Offer offer = new Offer();
        SecurityContextHolderAwareRequestWrapper securityContextHolderAwareRequestWrapper = new SecurityContextHolderAwareRequestWrapper(request, "");
        if (securityContextHolderAwareRequestWrapper.isUserInRole("ROLE_ADMIN")) {
            model.addAttribute("listOffers", this.offerService.listOffer());
        } else if (securityContextHolderAwareRequestWrapper.isUserInRole("ROLE_VENDOR")) {
            User user = userService.getUserByName(principal.getName());
            offer.setVendor(user.getVendor());
            model.addAttribute("listOffers", this.offerService.getOffersByVendorId(user.getVendor().getVendor_id()));
        }
        model.addAttribute("offer", offer);
        model.addAttribute("listCurrency", this.currencyService.listCurrency());
        model.addAttribute("listPart", this.partService.listPart());
        model.addAttribute("listVendor", this.vendorService.listVendor());
        return "offers";
    }

    @RequestMapping("/offers/remove/{offer_id}")
    public String removeOffer(@PathVariable("offer_id") Long offer_id) {
        this.offerService.removeOffer(offer_id);
        return "redirect:/offers";
    }

    @RequestMapping("/offers/edit/{offer_id}")
    public String editOffer(@PathVariable("offer_id") Long offer_id, Model model) {
        model.addAttribute("offer", this.offerService.getOfferById(offer_id));
        model.addAttribute("listOffers", this.offerService.listOffer());
        model.addAttribute("listVendor", this.vendorService.listVendor());
        model.addAttribute("listCurrency", this.currencyService.listCurrency());
        model.addAttribute("listPart", this.partService.listPart());
        return "offers";
    }

    @RequestMapping(value = "/offers/add", method = RequestMethod.POST)
    public String addOffer(@ModelAttribute("offer") Offer offer, BindingResult result) {
        this.offerService.saveOffer(offer);
        return "redirect:/offers";
    }

    @RequestMapping(value = "/offers/load", method = RequestMethod.POST)
    public String loadOffer(@ModelAttribute("offer") Offer offer, @RequestParam(value = "offers_file", required = false) javax.servlet.http.Part offers_file, Principal principal, BindingResult result) {
        if (offers_file != null) {
            try {
                User user = userService.getUserByName(principal.getName());
                excelReaderService.readBooksFromExcelFile(offers_file, user.getVendor());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "redirect:/offers";
    }

    @RequestMapping(value="/offers/{part_id}", method = RequestMethod.GET)
    public String PartsOffers(HttpServletRequest request, Model model, @RequestParam(value = "price_from", required = false) Float price_from, @RequestParam(value = "price_to", required = false) Float price_to, @PathVariable("part_id") Long part_id){
        model.addAttribute("listPartsOffers", this.offerService.getOffersByPartId(part_id, Float.parseFloat(request.getSession().getAttribute("price_from").toString()), Float.parseFloat(request.getSession().getAttribute("price_to").toString())));
        return "partsOffers";
    }
}
