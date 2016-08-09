package com.sivitsky.ddr.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "description")
public class Description implements Serializable {

    private Long descript_id;
    private String descript_name;
    private String descript_value;
    private Part part;
    private Specification specification;

    @Id
    @Column(name = "descript_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getDescript_id() {
        return descript_id;
    }

    public void setDescript_id(Long descript_id) {
        this.descript_id = descript_id;
    }

    @Column(name = "descript_name")
    public String getDescript_name() {
        return descript_name;
    }

    public void setDescript_name(String descript_name) {
        this.descript_name = descript_name;
    }

    @Column(name = "descript_value")
    public String getDescript_value() {
        return descript_value;
    }

    public void setDescript_value(String descript_value) {
        this.descript_value = descript_value;
    }

    @ManyToOne(targetEntity = Part.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "part_id")
    public Part getPart() {
        return part;
    }

    public void setPart(Part part) {
        this.part = part;
    }

    @ManyToOne(targetEntity = Specification.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "spec_id")
    public Specification getSpecification() {
        return specification;
    }

    public void setSpecification(Specification specification) {
        this.specification = specification;
    }
}
