package com.sivitsky.ddr.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "manufactur")
public class Manufactur {

    private Long manufactur_id;
    private String manufactur_name;
    private Set<Offer> offers = new HashSet<Offer>();

    @Id
    @Column(name = "manufactur_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getManufactur_id() {
        return manufactur_id;
    }

    public void setManufactur_id(Long manufactur_id) {
        this.manufactur_id = manufactur_id;
    }

    @Column(name = "manufactur_name")
    public String getManufactur_name() {
        return manufactur_name;
    }

    public void setManufactur_name(String manufactur_name) {
        this.manufactur_name = manufactur_name;
    }

    @OneToMany(mappedBy = "offer", cascade = CascadeType.ALL, orphanRemoval = true)
    public Set<Offer> getOffers() {
        return offers;
    }

    public void setOffers(Set<Offer> offers) {
        this.offers = offers;
    }
}
