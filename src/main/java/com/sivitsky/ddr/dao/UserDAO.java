package com.sivitsky.ddr.dao;

import com.sivitsky.ddr.model.User;

import java.util.List;

public interface UserDAO {

    List<User> listUsers();

    User saveUser(User user);

    User getUserById(Long id);

    User getUserByName(String name);

    User getUserByEmail(String email);

    void removeUser(User user);
}
