package com.sivitsky.ddr.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "specification")
public class Specification implements Serializable {

    private Long spec_id;
    private String spec_name;
    private Measure measure;

    @Id
    @Column(name = "spec_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getSpec_id() {
        return spec_id;
    }

    public void setSpec_id(Long spec_id) {
        this.spec_id = spec_id;
    }

    @Column(name = "spec_name")
    public String getSpec_name() {
        return spec_name;
    }

    public void setSpec_name(String spec_name) {
        this.spec_name = spec_name;
    }

    @ManyToOne(targetEntity = Measure.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "measure_id")
    public Measure getMeasure() {
        return measure;
    }

    public void setMeasure(Measure measure) {
        this.measure = measure;
    }
}
