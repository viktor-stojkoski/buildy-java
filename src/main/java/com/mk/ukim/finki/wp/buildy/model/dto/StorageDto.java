package com.mk.ukim.finki.wp.buildy.model.dto;

import com.mk.ukim.finki.wp.buildy.model.enumeration.StorageType;
import lombok.Data;

@Data
public class StorageDto extends BaseComputerComponentDto {

    public String manufacturerName;

    public StorageType storageType;

    public int capacity;

    public int readingSpeed;

    public int writingSpeed;
}
