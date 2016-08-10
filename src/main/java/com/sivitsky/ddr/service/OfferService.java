package com.sivitsky.ddr.service;

import com.sivitsky.ddr.model.Offer;

import java.util.List;

public interface OfferService {

    Offer saveOffer(Offer offer);

    List<Offer> listOffer();

    List<Offer> getOffersByVendorId(Long vendor_id);

    List<Offer> getOffersByPartId(Long part_id, Float price_from, Float price_to);

    List<Offer> listOffersByManufactIdAndPrice(Long[] mas_id, Float price_from, Float price_to, Integer firstResult, Integer maxResult);

    Object getCountOffers(Long[] mas_id, Float price_from, Float price_to);

    void removeOffer(Long id);

    Offer getOfferById(Long id);

    Object getOffersMaxAndMinPrice(Long part_id, Float price_from, Float price_to);

}
