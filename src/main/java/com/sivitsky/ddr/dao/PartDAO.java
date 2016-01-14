package com.sivitsky.ddr.dao;

import com.sivitsky.ddr.model.Part;

import java.util.List;

public interface PartDAO {

    List<Part> listPart();

    List<Part> listPartWithDetail();

    List<Part> listPartWithManufactursFilter(Long[] mas_id);

    List<Part> listPartByManufactIdAndPrice(Long[] mas_id, Float price_from, Float price_to);

    Part savePart(Part part);

    Part getPartById(Long id);

    void removePart(Long id);
}
