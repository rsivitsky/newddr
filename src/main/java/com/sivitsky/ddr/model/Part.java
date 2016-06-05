package com.sivitsky.ddr.model;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "part")
@NamedQueries({
        @NamedQuery(name = "Part.findAllWithDetail", query = "select MIN (offer.offer_price) as min_price, COUNT (offer.offer_id) as offer_count, " +
                "part.part_id as part_id, part.part_name as part_name, offer.currency as valuta_name from Offer offer " +
                "join offer.part part group by part.part_id")
        }
)
public class Part implements Serializable {
    private Long part_id;
    @Size(min = 3, message = "The part name must be at least 3 characters long.")
    private String part_name;
    private Manufactur manufactur;
    private byte[] photo;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "part_id")
    public Long getPart_id() {
        return part_id;
    }

    public void setPart_id(Long part_id) {
        this.part_id = part_id;
    }

    @Basic(fetch= FetchType.LAZY)
    @Lob
    @Column(name = "photo")
    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    @Column(name = "part_name")
    public String getPart_name() {
        return part_name;
    }

    public void setPart_name(String part_name) {
        this.part_name = part_name;
    }

    @ManyToOne(targetEntity=Manufactur.class, fetch=FetchType.EAGER)
    @JoinColumn(name = "manufactur_id")
    public Manufactur getManufactur() {
        return manufactur;
    }

    public void setManufactur(Manufactur manufactur) {
        this.manufactur = manufactur;
    }

}
