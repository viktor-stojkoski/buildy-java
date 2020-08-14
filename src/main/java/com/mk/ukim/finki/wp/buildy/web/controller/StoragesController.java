package com.mk.ukim.finki.wp.buildy.web.controller;

import com.mk.ukim.finki.wp.buildy.model.dto.StorageDto;
import com.mk.ukim.finki.wp.buildy.service.StorageService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/storages")
@CrossOrigin(origins = "http://localhost:4200")
public class StoragesController {

    private final StorageService storageService;

    public StoragesController(StorageService storageService) {
        this.storageService = storageService;
    }

    @GetMapping
    public List<StorageDto> getStorageDtos() {
        return storageService.getStorageDtos();
    }
}
