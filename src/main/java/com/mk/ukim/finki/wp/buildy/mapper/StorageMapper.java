package com.mk.ukim.finki.wp.buildy.mapper;

import com.mk.ukim.finki.wp.buildy.model.dto.StorageDto;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Storage;

import java.util.List;
import java.util.stream.Collectors;

public final class StorageMapper {

    public static StorageDto toStorageDto(Storage storage) {
        StorageDto storageDto = new StorageDto();

        storageDto.setId(storage.getId());
        storageDto.setUid(storage.getUid());
        storageDto.setImageUrl(storage.getImageUrl());
        storageDto.setName(storage.getName());
        storageDto.setPrice(storage.getPrice());
        storageDto.setStorageType(storage.getStorageType());
        storageDto.setCapacity(storage.getCapacity());
        storageDto.setReadingSpeed(storage.getReadingSpeed());
        storageDto.setWritingSpeed(storage.getWritingSpeed());
        storageDto.setManufacturerName(storage.getManufacturer().getName());

        return storageDto;
    }

    public static List<StorageDto> toStorageDtos(List<Storage> storages) {
        return storages
                .stream()
                .map(StorageMapper::toStorageDto)
                .collect(Collectors.toList());
    }
}
