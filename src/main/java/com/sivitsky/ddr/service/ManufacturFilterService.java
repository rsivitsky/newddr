package com.sivitsky.ddr.service;

import com.sivitsky.ddr.model.Manufactur;

public class ManufacturFilterService {

    private Manufactur manufactur;

    private Boolean usage;

    public Manufactur getManufactur() {
        return manufactur;
    }

    public void setManufactur(Manufactur manufactur) {
        this.manufactur = manufactur;
    }

    public Boolean getUsage() {
        return usage;
    }

    public void setUsage(Boolean usage) {
        this.usage = usage;
    }
}
