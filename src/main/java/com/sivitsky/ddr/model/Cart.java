package com.sivitsky.ddr.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "cart")
public class Cart implements Serializable {

    private Long cart_id;
    private User user;

    public Cart() {
    }

    public Cart(Long cart_id) {
        this.cart_id = cart_id;
    }

    @Id
    @Column(name = "cart_id")
    public Long getCart_id() {
        return cart_id;
    }

    public void setCart_id(Long cart_id) {
        this.cart_id = cart_id;
    }

    @OneToOne//s(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")

    // @PrimaryKeyJoinColumn
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
