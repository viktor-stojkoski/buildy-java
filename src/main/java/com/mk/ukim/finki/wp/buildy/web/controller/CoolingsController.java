package com.mk.ukim.finki.wp.buildy.web.controller;

import com.mk.ukim.finki.wp.buildy.model.dto.CoolingDto;
import com.mk.ukim.finki.wp.buildy.service.CoolingService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/coolings")
@CrossOrigin(origins = "http://localhost:4200")
public class CoolingsController {

    private final CoolingService coolingService;

    public CoolingsController(CoolingService coolingService) {
        this.coolingService = coolingService;
    }

    @GetMapping
    public List<CoolingDto> getCoolings() {
        return coolingService.getCoolingDtos();
    }
}
