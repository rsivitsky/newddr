package com.sivitsky.ddr.dao;

import com.sivitsky.ddr.model.Part;

import java.util.List;

public interface PartDAO {

    List<Part> listPart();

    List<Object[]> listPartWithDetail(Integer firstResult, Integer maxResult);

    List<Part> listPartWithManufactursFilter(Long[] mas_id);

    List<Part> listPartByManufactIdAndPrice(Long[] mas_id, Float price_from, Float price_to);

    Part savePart(Part part);

    Part getPartById(Long id);

    Part getPartByName(String name);

    void removePart(Long id);

    Integer getCountOfPart();

}
