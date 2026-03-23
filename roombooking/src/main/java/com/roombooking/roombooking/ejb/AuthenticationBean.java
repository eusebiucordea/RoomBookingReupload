package com.roombooking.roombooking.ejb;

import jakarta.ejb.EJBException;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import com.roombooking.roombooking.entities.User;

@Stateless
public class AuthenticationBean {

    @Inject
    PasswordBean passwordBean;

    @PersistenceContext
    EntityManager entityManager;

    public boolean authenticate(String username, String password) {
        try {
            TypedQuery<User> query = entityManager.createQuery(
                    "SELECT u FROM User u WHERE u.username = :username AND u.password = :password",
                    User.class);
            query.setParameter("username", username);
            query.setParameter("password", passwordBean.convertToSha256(password));

            User user = query.getResultList().stream().findFirst().orElse(null);

            return user != null && user.getIsApproved();

        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    public String getUserRole(String username) {
        try {
            TypedQuery<User> query = entityManager.createQuery(
                    "SELECT u FROM User u WHERE u.username = :username",
                    User.class);
            query.setParameter("username", username);
            User user = query.getSingleResult();
            return user.getRole().getRoleName();
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }
}