package com.sivitsky.ddr;

import com.sivitsky.ddr.model.Cart;
import com.sivitsky.ddr.model.Order;
import com.sivitsky.ddr.model.User;
import com.sivitsky.ddr.model.Vendor;
import com.sivitsky.ddr.service.CartService;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static junit.framework.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class CartServiceTest {
    private final List<Cart> carts = new ArrayList<Cart>();

    @Test
    public void testCreateCart() {
        final Cart newCart = new Cart();
        final User newUser = new User();
        final Order newOrder = new Order();
        final Vendor newVendor = new Vendor();
        newVendor.setVendor_addr("Test Vendor Adress");
        newVendor.setVendor_email("vendor@vendor.com");
        newVendor.setVendor_id(99999l);
        newVendor.setVendor_name("Test Vendor Name");
        newVendor.setVendor_phone("999-999-999");
        newUser.setUser_id(99999l);
        newUser.setLogin("testLogin");
        newUser.setEmail("test@test.com");
        newUser.setRole("ROLE_ADMIN");
        newUser.setFirstname("Ivan");
        newUser.setLastname("Ivanov");
        newUser.setPassword("abc123");
        newUser.setPhone("999-999-999");
        newUser.setVendor(newVendor);
        newCart.setCart_id(99999l);
        newCart.setUser(newUser);

        CartService cartService = mock(CartService.class);
        when(cartService.saveCart(newCart)).
                thenAnswer(invocation -> {
                    carts.add(newCart);
                    return newCart;
                });
        Cart cart = cartService.saveCart(newCart);

        assertEquals(Long.valueOf(99999l), cart.getCart_id());
        assertEquals(Long.valueOf(99999l), cart.getUser().getUser_id());
        assertEquals("test@test.com", cart.getUser().getEmail());
        assertEquals("Ivan", cart.getUser().getFirstname());
        assertEquals("Ivanov", cart.getUser().getLastname());
        assertEquals("testLogin", cart.getUser().getLogin());
        assertEquals("abc123", cart.getUser().getPassword());
        assertEquals("999-999-999", cart.getUser().getPhone());
        assertEquals("ROLE_ADMIN", cart.getUser().getRole());
        assertEquals(Long.valueOf(99999l), cart.getUser().getVendor().getVendor_id());
    }


}

