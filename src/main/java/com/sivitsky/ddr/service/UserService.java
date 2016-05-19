package com.sivitsky.ddr.service;

import com.sivitsky.ddr.model.User;

import java.util.List;

public interface UserService {

    User saveUser(User user);

    List<User> listUsers();

    void removeUser(User user);

    User getUserById(Long id);

    User getUserByName(String name);

    User getUserByEmail(String email);
}
