package com.roombooking.roombooking.ejb;

import com.roombooking.roombooking.common.UserDto;
import com.roombooking.roombooking.entities.Role;
import com.roombooking.roombooking.entities.User;
import jakarta.ejb.EJBException;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@Stateless
public class UserBean {
    @Inject
    PasswordBean passwordBean;
    private static final Logger LOG = Logger.getLogger(UserBean.class.getName());

    @PersistenceContext
    EntityManager entityManager;

    public List<UserDto> findPendingUsers() {
        LOG.info("findPendingUsers");
        try {
            TypedQuery<User> query = entityManager.createQuery(
                    "SELECT u FROM User u WHERE u.isApproved = false", User.class);
            List<User> users = query.getResultList();
            return copyUsersToDto(users);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    public List<UserDto> findApprovedUsers() {
        LOG.info("findApprovedUsers");
        try {
            TypedQuery<User> query = entityManager.createQuery(
                    "SELECT u FROM User u WHERE u.isApproved = true", User.class);
            List<User> users = query.getResultList();
            return copyUsersToDto(users);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    // Conversie din entitate User în DTO
    public List<UserDto> copyUsersToDto(List<User> usersList) {
        List<UserDto> userDtos = new ArrayList<>();
        for (User user : usersList) {
            UserDto userDto = new UserDto(
                    user.getId(),
                    user.getUsername(),
                    user.getEmail(),
                    user.getPhone(),
                    user.getIsApproved(),
                    user.getRole() != null ? user.getRole().getRoleName() : "Unknown"
            );
            userDtos.add(userDto);
        }
        return userDtos;
    }

    public void createUser(String username, String password, String email, String phone, String roleName) {
        LOG.info("createUser");
        try {
            User user = new User();
            user.setUsername(username);
            user.setPassword(passwordBean.convertToSha256(password));

            user.setEmail(email);
            user.setPhone(phone);
            user.setIsApproved(false);

            TypedQuery<Role> query = entityManager.createQuery("SELECT r FROM Role r WHERE r.roleName = :roleName", Role.class);
            query.setParameter("roleName", roleName);
            List<Role> roles = query.getResultList();
            if (!roles.isEmpty()) {
                user.setRole(roles.get(0));
            } else {
                throw new EJBException("Role not found: " + roleName);
            }

            entityManager.persist(user);
        } catch (Exception ex) {
            throw new EJBException("Error while creating user", ex);
        }
    }

    public void approveUser(Long userId) {
        try {
            User user = entityManager.find(User.class, userId);
            if (user != null) {
                user.setIsApproved(true);
                entityManager.merge(user);
            }
        } catch (Exception ex) {
            throw new EJBException("Error approving user", ex);
        }
    }

    public void deleteUser(Long userId) {
        try {
            User user = entityManager.find(User.class, userId);
            if (user != null) {
                entityManager.remove(user);
            }
        } catch (Exception ex) {
            throw new EJBException("Error deleting user", ex);
        }
    }

}