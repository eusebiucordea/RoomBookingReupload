package com.roombooking.roombooking.ejb;

import com.roombooking.roombooking.common.ContactDto;
import com.roombooking.roombooking.entities.Contact;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Stateless
public class ContactBean {

    @PersistenceContext
    private EntityManager entityManager;

    public void saveContact(String name, String email, String message) {
        Contact contact = new Contact();
        contact.setName(name);
        contact.setEmail(email);
        contact.setMessage(message);

        entityManager.persist(contact);
    }
}
