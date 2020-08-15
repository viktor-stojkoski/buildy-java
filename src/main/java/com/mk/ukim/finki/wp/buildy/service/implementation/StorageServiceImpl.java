package com.mk.ukim.finki.wp.buildy.service.implementation;

import com.mk.ukim.finki.wp.buildy.mapper.StorageMapper;
import com.mk.ukim.finki.wp.buildy.model.dto.StorageDto;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Storage;
import com.mk.ukim.finki.wp.buildy.persistance.StorageRepository;
import com.mk.ukim.finki.wp.buildy.service.StorageService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StorageServiceImpl implements StorageService {

    private final StorageRepository storageRepository;

    public StorageServiceImpl(StorageRepository storageRepository) {
        this.storageRepository = storageRepository;
    }

    @Override
    public List<StorageDto> getStorageDtos() {
        List<Storage> storages = storageRepository.findAll();

        return StorageMapper.toStorageDtos(storages);
    }
}
