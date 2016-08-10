package com.sivitsky.ddr.service;

import com.sivitsky.ddr.dao.OfferDAO;
import com.sivitsky.ddr.model.Offer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OfferServiceImpl implements OfferService {

    @Autowired
    private OfferDAO offerDAO;

    @Transactional
    public Offer saveOffer(Offer offer) {
        return offerDAO.saveOffer(offer);
    }

    @Transactional
    public List<Offer> listOffer() {
        return offerDAO.listOffer();
    }

    @Transactional
    public void removeOffer(Long id) {
        offerDAO.removeOffer(id);
    }

    @Transactional
    public Offer getOfferById(Long id) {
        return this.offerDAO.getOfferById(id);
    }

    @Transactional
    public List<Offer> getOffersByVendorId(Long vendor_id) {
        return this.offerDAO.getOffersByVendorId(vendor_id);
    }

    @Transactional
    public List<Offer> getOffersByPartId(Long part_id, Float price_from, Float price_to) {
        return this.offerDAO.getOffersByPartId(part_id, price_from, price_to);
    }

    @Transactional
    public Object getOffersMaxAndMinPrice(Long part_id, Float price_from, Float price_to) {
        return this.offerDAO.getOffersMaxAndMinPrice(part_id, price_from, price_to);
    }

    @Transactional
    public List<Offer> listOffersByManufactIdAndPrice(Long[] mas_id, Float price_from, Float price_to, Integer firstResult, Integer maxResult) {
        return this.offerDAO.getOffersByManufactIdAndPrice(mas_id, price_from, price_to, firstResult, maxResult);
    }

    @Transactional
    public Object getCountOffers(Long[] mas_id, Float price_from, Float price_to) {
        return this.offerDAO.getCountOffers(mas_id, price_from, price_to);
    }

}
