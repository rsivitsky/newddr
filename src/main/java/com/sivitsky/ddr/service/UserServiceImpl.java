package com.sivitsky.ddr.service;

import com.sivitsky.ddr.dao.UserDAOImpl;
import com.sivitsky.ddr.model.User;
import com.sivitsky.ddr.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAOImpl userDAO;

    @Autowired
    private UserRepository userRepository;

    @Transactional
    public User saveUser(User user) {
        return this.userDAO.saveUser(user);
    }

    @Transactional
    public List<User> listUsers() {
        return this.userDAO.listUsers();
    }

    @Transactional
    public User getUserById(Long id) {
        return this.userDAO.getUserById(id);
    }

    @Transactional
    public User getUserByName(String name) {
        return this.userDAO.getUserByName(name);
    }

    @Transactional
    public User getUserByEmail(String email) {
        return this.userDAO.getUserByEmail(email);
    }

    @Transactional
    public void removeUser(User user) {
        if (user != null) {
            this.userDAO.removeUser(user);
        }
    }
}
