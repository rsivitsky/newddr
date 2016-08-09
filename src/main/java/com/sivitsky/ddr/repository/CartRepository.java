package com.sivitsky.ddr.repository;

import com.sivitsky.ddr.model.Cart;
import com.sivitsky.ddr.model.User;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface CartRepository extends PagingAndSortingRepository<Cart, Long> {

    Cart findByUser(User user);
}
