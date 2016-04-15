package com.sivitsky.ddr.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "booking")
@NamedQueries({
        @NamedQuery(name="Order.getOrderesByVendorId", query="select o.order_date, o.part.part_name, o.order_num, o.booking_status " +
                "from Order o join o.offer off join off.vendor ven " +
                "where ven.vendor_id = :vendor_id" ),
        @NamedQuery(name="Order.getOrderesByUserId", query="select order_date, part.part_name, order_num, booking_status from Order " +
                "where user_id = :user_id and booking_status in (:booking_status)" ),
        @NamedQuery(name="Order.getCountAndSumOrdersByUserId", query="select count(order_id) as cart_num, " +
                "sum(booking_sum) as total_sum from Order where user_id = :user_id and booking_status ='NEW' group by user_id"),
        @NamedQuery(name="Order.getOrdersByUserId", query="from Order where user_id = :user_id and booking_status not in ('CLOSED', 'CANCELED')")
})

public class Order implements Serializable {

    private Long booking_id;
    private Integer booking_num;
    private Float booking_sum;
    private Date booking_date;
    private String booking_status;
    private Offer offer;
    private User user;
    private Cart cart;
    private Part part;

    public Order() {
        this.setBooking_status(OrderStatus.NEW.toString());
    }

    @Id
    @Column(name = "booking_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getOrder_id() {
        return booking_id;
    }

    public void setOrder_id(Long order_id) {
        this.booking_id = order_id;
    }

    @Column(name = "booking_num")
    public Integer getOrder_num() {return booking_num;
    }

    public void setOrder_num(Integer booking_num) {
        this.booking_num = booking_num;
    }

    @Column(name = "booking_date")
    @DateTimeFormat(iso= DateTimeFormat.ISO.DATE)
    public Date getOrder_date() {
        return booking_date;
    }

    public void setOrder_date(Date booking_date) {
        this.booking_date = booking_date;
    }

    @ManyToOne(targetEntity=Offer.class, fetch=FetchType.EAGER)
    @JoinColumn(name = "offer_id")
    public Offer getOffer() {
        return offer;
    }

    public void setOffer(Offer offer) {
        this.offer = offer;
    }

    @ManyToOne(targetEntity=User.class, fetch=FetchType.EAGER)
    @JoinColumn(name = "user_id")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne(targetEntity=Part.class, fetch=FetchType.EAGER)
    @JoinColumn(name = "part_id")
    public Part getPart() {
        return part;
    }

    public void setPart(Part part) {
        this.part = part;
    }

    @Column(name = "booking_status")
    public String getBooking_status() {
        return this.booking_status;
    }

    public void setBooking_status(String booking_status) {
        this.booking_status = booking_status;
    }

    @Column(name = "booking_sum")
    public Float getBooking_sum() {
        return booking_sum;
    }

    public void setBooking_sum(Float booking_sum) {
        this.booking_sum = booking_sum;
    }

    @ManyToOne(targetEntity = Cart.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "cart_id")
    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }
}
