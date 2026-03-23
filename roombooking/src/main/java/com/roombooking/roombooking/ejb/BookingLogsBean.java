package com.roombooking.roombooking.ejb;

import com.roombooking.roombooking.common.BookingLogsDto;
import com.roombooking.roombooking.entities.Booking;
import com.roombooking.roombooking.entities.Room;
import com.roombooking.roombooking.entities.User;
import jakarta.ejb.EJBException;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@Stateless
public class BookingLogsBean {
    private static final Logger LOG = Logger.getLogger(BookingLogsBean.class.getName());

    @PersistenceContext
    EntityManager entityManager;

    public void createBookingLog(Long roomId, Long userId) {
        LOG.info("createBookingLog");
        try {
            Room room = entityManager.find(Room.class, roomId);
            User user = entityManager.find(User.class, userId);

            if (room != null && user != null) {
                Booking booking = new Booking();
                booking.setRoom(room);
                booking.setUser(user);
                room.setAvailable(false);

                entityManager.persist(booking);
                entityManager.merge(room);
            }
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    public List<BookingLogsDto> findAllBookingLogs() {
        LOG.info("findAllBookingLogs");
        try {
            TypedQuery<Booking> typedQuery = entityManager.createQuery("SELECT b FROM Booking b", Booking.class);
            List<Booking> bookings = typedQuery.getResultList();
            return copyBookingLogsToDto(bookings);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    private List<BookingLogsDto> copyBookingLogsToDto(List<Booking> bookings) {
        List<BookingLogsDto> bookingLogsDtos = new ArrayList<>();
        for (Booking booking : bookings) {
            Room room = booking.getRoom();
            User bookingUser = booking.getUser();

            BookingLogsDto bookingLogsDto = new BookingLogsDto(
                    booking.getId(),
                    room.getTitle(),
                    room.getLocation(),
                    room.getPrice(),
                    room.getUser().getUsername(),
                    bookingUser != null ? bookingUser.getUsername() : "Unknown",
                    room.getId()
            );
            bookingLogsDtos.add(bookingLogsDto);
        }
        return bookingLogsDtos;
    }
}