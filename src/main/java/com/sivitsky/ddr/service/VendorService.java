package com.sivitsky.ddr.service;

import com.sivitsky.ddr.model.Vendor;

import java.util.List;

public interface VendorService {

    Vendor saveVendor(Vendor vendor);

    List<Vendor> listVendor();

    void removeVendor(Integer id);

    Vendor getVendorById(Integer id);

}
