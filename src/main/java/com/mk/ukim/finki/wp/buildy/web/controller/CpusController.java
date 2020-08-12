package com.mk.ukim.finki.wp.buildy.web.controller;

import com.mk.ukim.finki.wp.buildy.model.dto.CpuDto;
import com.mk.ukim.finki.wp.buildy.service.CpuService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/cpus")
@CrossOrigin(origins = "http://localhost:4200")
public class CpusController {

    private final CpuService cpuService;

    public CpusController(CpuService cpuService) {
        this.cpuService = cpuService;
    }

    @GetMapping
    public List<CpuDto> getCpus() {
        return cpuService.getCpuDtos();
    }
}
