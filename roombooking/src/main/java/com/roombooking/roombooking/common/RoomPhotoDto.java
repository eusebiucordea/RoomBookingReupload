package com.roombooking.roombooking.common;

public class RoomPhotoDto {

    private Long id;

    private String fileName;

    private String fileType;

    private byte[] fileContent;

    String room;

    public RoomPhotoDto(Long id, String fileName, String fileType, byte[] fileContent, String room) {
        this.id = id;
        this.fileName = fileName;
        this.fileType = fileType;
        this.fileContent = fileContent;
        this.room = room;
    }

    public String getRoom() {
        return room;
    }

    public Long getId() {
        return id;
    }

    public String getFileName() {
        return fileName;
    }

    public String getFileType() {
        return fileType;
    }

    public byte[] getFileContent() {
        return fileContent;
    }
}
