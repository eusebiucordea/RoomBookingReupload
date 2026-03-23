package com.roombooking.roombooking.ejb;

import com.roombooking.roombooking.entities.Booking;
import com.roombooking.roombooking.entities.Room;
import com.roombooking.roombooking.entities.User;
import jakarta.ejb.EJBException;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import java.util.List;
import java.util.logging.Logger;

@Stateless
public class BookingBean {
    private static final Logger LOG = Logger.getLogger(BookingBean.class.getName());

    @PersistenceContext
    EntityManager entityManager;

    public void createBooking(Long roomId, String username) {
        LOG.info("createBooking");
        try {
            Room room = entityManager.find(Room.class, roomId);

            // Find user by username
            TypedQuery<User> userQuery = entityManager.createQuery(
                    "SELECT u FROM User u WHERE u.username = :username", User.class);
            userQuery.setParameter("username", username);
            List<User> users = userQuery.getResultList();

            if (!users.isEmpty() && room != null) {
                User user = users.get(0);
                // Set room as unavailable
                room.setAvailable(false);
                entityManager.merge(room);

                // Create booking
                Booking booking = new Booking();
                booking.setRoom(room);
                booking.setUser(user);
                entityManager.persist(booking);
            }
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }



    public List<Room> findBookedRoomsByUsername(String username) {
        LOG.info("findBookedRoomsByUsername");
        try {
            TypedQuery<Room> query = entityManager.createQuery(
                    "SELECT DISTINCT b.room FROM Booking b WHERE b.user.username = :username", Room.class);
            query.setParameter("username", username);
            return query.getResultList();
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }
    public Booking findBookingByRoomAndUsername(Long roomId, String username) {
        LOG.info("findBookingByRoomAndUsername");
        try {
            TypedQuery<Booking> query = entityManager.createQuery(
                    "SELECT b FROM Booking b WHERE b.room.id = :roomId AND b.user.username = :username",
                    Booking.class);
            query.setParameter("roomId", roomId);
            query.setParameter("username", username);
            List<Booking> results = query.getResultList();
            return results.isEmpty() ? null : results.get(0);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

}