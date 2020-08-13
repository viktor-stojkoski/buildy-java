package com.mk.ukim.finki.wp.buildy.web.controller;

import com.mk.ukim.finki.wp.buildy.model.dto.RamDto;
import com.mk.ukim.finki.wp.buildy.service.RamService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/rams")
@CrossOrigin(origins = "http://localhost:4200")
public class RamsController {

    private final RamService ramService;

    public RamsController(RamService ramService) {
        this.ramService = ramService;
    }

    @GetMapping
    public List<RamDto> getRams() {
        return ramService.getRamDtos();
    }
}
