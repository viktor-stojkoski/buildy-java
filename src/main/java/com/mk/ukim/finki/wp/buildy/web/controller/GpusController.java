package com.mk.ukim.finki.wp.buildy.web.controller;

import com.mk.ukim.finki.wp.buildy.model.dto.GpuDto;
import com.mk.ukim.finki.wp.buildy.service.GpuService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/gpus")
@CrossOrigin(origins = "http://localhost:4200")
public class GpusController {

    private final GpuService gpuService;

    public GpusController(GpuService gpuService) {
        this.gpuService = gpuService;
    }

    @GetMapping
    public List<GpuDto> getGpus() {
        return gpuService.getGpuDtos();
    }
}
