package com.sivitsky.ddr.dao;

import com.sivitsky.ddr.model.User;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {

    private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public User saveUser(User user) {
        sessionFactory.getCurrentSession().saveOrUpdate(user);
        logger.info("User updated successfully, User id=" + user.getUser_id());
        return user;
    }

    @SuppressWarnings("unchecked")
    public List<User> listUsers() {
        return sessionFactory.getCurrentSession().createQuery("from User").list();
    }

    public User getUserById(Long id) {
        return (User) this.sessionFactory.getCurrentSession().get(User.class, id);
    }

    public User getUserByName(String name) {
        return (User) this.sessionFactory.getCurrentSession().createQuery("select v from User v where v.login = :user_name")
                .setParameter("user_name", name).uniqueResult();
    }

    public User getUserByEmail(String email) {
        return (User) this.sessionFactory.getCurrentSession().createQuery("select v from User v where v.email = :email")
                .setParameter("email", email).uniqueResult();
    }

    public void removeUser(User user) {
        sessionFactory.getCurrentSession().delete(user);
    }

}
