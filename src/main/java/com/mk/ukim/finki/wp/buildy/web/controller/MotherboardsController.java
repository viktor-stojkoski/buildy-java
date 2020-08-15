package com.mk.ukim.finki.wp.buildy.web.controller;

import com.mk.ukim.finki.wp.buildy.model.dto.MotherboardDto;
import com.mk.ukim.finki.wp.buildy.service.MotherboardService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/motherboards")
@CrossOrigin(origins = "http://localhost:4200")
public class MotherboardsController {

    private final MotherboardService motherboardService;

    public MotherboardsController(MotherboardService motherboardService) {
        this.motherboardService = motherboardService;
    }

    @GetMapping
    public List<MotherboardDto> getMotherboards() {
        return motherboardService.getMotherboardDtos();
    }
}
