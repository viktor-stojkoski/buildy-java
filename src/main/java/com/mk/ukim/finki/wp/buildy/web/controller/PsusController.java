package com.mk.ukim.finki.wp.buildy.web.controller;

import com.mk.ukim.finki.wp.buildy.model.dto.PsuDto;
import com.mk.ukim.finki.wp.buildy.service.PsuService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/psus")
@CrossOrigin(origins = "http://localhost:4200")
public class PsusController {

    private final PsuService psuService;

    public PsusController(PsuService psuService) {
        this.psuService = psuService;
    }

    @GetMapping
    public List<PsuDto> getPsus() {
        return psuService.getPsuDtos();
    }
}
