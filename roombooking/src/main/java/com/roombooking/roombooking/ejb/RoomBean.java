package com.roombooking.roombooking.ejb;

import com.roombooking.roombooking.common.RoomDto;
import com.roombooking.roombooking.common.RoomPhotoDto;
import com.roombooking.roombooking.entities.Room;
import com.roombooking.roombooking.entities.RoomPhoto;
import com.roombooking.roombooking.entities.User;
import jakarta.ejb.EJBException;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;

@Stateless
public class RoomBean {
    private static final Logger LOG = Logger.getLogger(RoomBean.class.getName());
    @PersistenceContext
    EntityManager entityManager;

    public List<RoomDto> findAllRooms() {
        LOG.info("findAllRooms");
        try {
            TypedQuery<Room> typedQuery = entityManager.createQuery(
                    "SELECT r FROM Room r ORDER BY r.available DESC", Room.class);
            List<Room> rooms = typedQuery.getResultList();
            return copyRoomsToDto(rooms);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    public List<RoomDto> copyRoomsToDto(List<Room> rooms) {
        List<RoomDto> roomDtos = new ArrayList<>();
        for(Room room : rooms) {
            RoomDto roomDto = new RoomDto(
                    room.getId(),
                    room.getTitle(),
                    room.getDescription(),
                    room.getLocation(),
                    room.getPrice(),
                    room.isAvailable(),
                    room.getUser().getUsername()
            );
            roomDtos.add(roomDto);
        }
        return roomDtos;
    }

    public void createRoom(String title, String description, String location, float price, boolean available, Long userId, RoomPhotoDto roomPhotoDto) {
        LOG.info("createRoom");
        Room room = new Room();
        boolean available_true = true;
        room.setTitle(title);
        room.setDescription(description);
        room.setLocation(location);
        room.setPrice(price);
        room.setAvailable(available_true);
        User user = entityManager.find(User.class, userId);
        user.getRooms().add(room);
        room.setUser(user);
        entityManager.persist(room);

        if (roomPhotoDto != null) {
            RoomPhoto roomPhoto = new RoomPhoto();
            roomPhoto.setFileName(roomPhotoDto.getFileName());
            roomPhoto.setFileType(roomPhotoDto.getFileType());
            roomPhoto.setFileContent(roomPhotoDto.getFileContent());
            roomPhoto.setRoom(room);
            entityManager.persist(roomPhoto);
        }
        entityManager.flush();
    }

    public RoomPhotoDto findRoomPhotoByRoomId(Long roomId) {
        TypedQuery<RoomPhoto> query = entityManager.createQuery(
                "SELECT rp FROM RoomPhoto rp WHERE rp.room.id = :roomId", RoomPhoto.class);
        query.setParameter("roomId", roomId);

        List<RoomPhoto> photos = query.getResultList();
        if (photos.isEmpty()) {
            return null;
        }

        RoomPhoto photo = photos.get(0);
        return new RoomPhotoDto(
                photo.getId(),
                photo.getFileName(),
                photo.getFileType(),
                photo.getFileContent(),
                null
        );
    }

    public void deleteRoomsByIds(Collection<Long> roomIds) {
        LOG.info("deleteRoomsByIds");
        for (Long roomId : roomIds) {
            Room room = entityManager.find(Room.class, roomId);
            if (room != null) {
                TypedQuery<RoomPhoto> query = entityManager.createQuery(
                        "SELECT rp FROM RoomPhoto rp WHERE rp.room.id = :roomId", RoomPhoto.class);
                query.setParameter("roomId", roomId);

                List<RoomPhoto> photos = query.getResultList();
                for (RoomPhoto photo : photos) {
                    entityManager.remove(photo);
                }
                entityManager.remove(room);
            }
        }
        entityManager.flush();
    }

    public RoomDto findRoomById(Long roomId) {
        LOG.info("findById");
        Room room = entityManager.find(Room.class, roomId);
        if(room == null) {
            return null;
        }

        return new RoomDto(
                room.getId(),
                room.getTitle(),
                room.getDescription(),
                room.getLocation(),
                room.getPrice(),
                room.isAvailable(),
                room.getUser().getUsername() );

    }

    public void updateRoom(Long roomId, String title, String description, String location,
                           float price, boolean available, Long userId) {
        LOG.info("updateRoom");

        Room room = entityManager.find(Room.class, roomId);
        room.setTitle(title);
        room.setDescription(description);
        room.setLocation(location);
        room.setPrice(price);
        room.setAvailable(available);

        //remove the room from the old owner
        User oldUser = room.getUser();
        oldUser.getRooms().remove(room);

        //add the room to its new owner
        User user = entityManager.find(User.class, userId);
        user.getRooms().add(room);
        room.setUser(user);

    }
}
