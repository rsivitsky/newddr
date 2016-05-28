package com.sivitsky.ddr;

import com.sivitsky.ddr.model.Offer;
import com.sivitsky.ddr.model.User;
import com.sivitsky.ddr.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.math.BigDecimal;

@Controller
@SessionAttributes({"offer", "listOffers", "vendor_id", "user", "part", "listPartsOffers"})
public class OfferController {

    @Autowired
    private OfferService offerService;
    @Autowired
    private PartService partService;
    @Autowired
    private VendorService vendorService;
    @Autowired
    private ExcelReaderService excelReaderService;
    @Autowired
    private UserService userService;
    @Autowired
    private CurrencyService currencyService;

    @RequestMapping(value = "/offers", method = RequestMethod.GET)
    public String listOffers(HttpServletRequest request, @ModelAttribute("user") User user, Model model) {
        Offer offer = new Offer();
        SecurityContextHolderAwareRequestWrapper securityContextHolderAwareRequestWrapper = new SecurityContextHolderAwareRequestWrapper(request, "");
        if (securityContextHolderAwareRequestWrapper.isUserInRole("ROLE_ADMIN")) {
            model.addAttribute("listOffers", this.offerService.listOffer());
        } else if (securityContextHolderAwareRequestWrapper.isUserInRole("ROLE_VENDOR")) {
            offer.setVendor(user.getVendor());
            model.addAttribute("listOffers", this.offerService.getOffersByVendorId(user.getVendor().getVendor_id()));
        }
        model.addAttribute("offer", offer);
        model.addAttribute("listCurrency", this.currencyService.getCurrencies());
        model.addAttribute("listPart", this.partService.listPart());
        model.addAttribute("listVendor", this.vendorService.listVendor());
        return "offer";
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
        model.addAttribute("listCurrency", this.currencyService.getCurrencies());
        model.addAttribute("listPart", this.partService.listPart());
        return "offer";
    }

    @RequestMapping(value = "/offers/add", method = RequestMethod.POST)
    public String addOffer(@ModelAttribute("offer") Offer offer, BindingResult result) {
        offer.setOffer_sum(offer.getOffer_price().multiply(BigDecimal.valueOf(offer.getOffer_num())));
        this.offerService.saveOffer(offer);
        return "redirect:/offers";
    }

    @RequestMapping(value = "/offers/load", method = RequestMethod.POST)
    public String loadOffer(@ModelAttribute("offer") Offer offer, User user, @RequestParam(value = "offers_file", required = false) javax.servlet.http.Part offers_file) {
        if (offers_file != null) {
            try {
                if (user.getVendor() != null) {
                    excelReaderService.readBooksFromExcelFile(offers_file, user.getVendor());
                } else {
                    return "redirect:/offers";
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "redirect:/offers";
    }

    @RequestMapping(value = "/offers/partinfo/{part_id}", method = RequestMethod.GET)
    public String PartsOffers(HttpServletRequest request, Model model, @RequestParam(value = "price_from", required = false) Float price_from, @RequestParam(value = "price_to", required = false) Float price_to, @PathVariable("part_id") Long part_id) {
        Float max_price = Float.parseFloat(request.getSession().getAttribute("price_to").toString());
        Float min_price = Float.parseFloat(request.getSession().getAttribute("price_from").toString());
        model.addAttribute("part", this.offerService.getOffersMaxAndMinPrice(part_id, min_price, max_price));
        model.addAttribute("listPartsOffers", this.offerService.getOffersByPartId(part_id, min_price, max_price));
        return "partsOffers";
    }
}
