package com.mk.ukim.finki.wp.buildy.mapper;

import com.mk.ukim.finki.wp.buildy.model.dto.GpuDto;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Gpu;

import java.util.List;
import java.util.stream.Collectors;

public final class GpuMapper {

    public static GpuDto toGpuDto(Gpu gpu) {
        GpuDto gpuDto = new GpuDto();

        gpuDto.setId(gpu.getId());
        gpuDto.setUid(gpu.getUid());
        gpuDto.setImageUrl(gpu.getImageUrl());
        gpuDto.setName(gpu.getName());
        gpuDto.setPrice(gpu.getPrice());
        gpuDto.setManufacturerName(gpu.getManufacturer().getName());
        gpuDto.setGpuMemoryType(gpu.getMemoryType());
        gpuDto.setRamSize(((int) gpu.getRamSize()));
        gpuDto.setTiming(gpu.getTiming());
        gpuDto.setFrequency(gpu.getFrequency());
        gpuDto.setMemoryClock(((int) gpu.getMemoryClock()));

        return gpuDto;
    }

    public static List<GpuDto> toGpuDtos(List<Gpu> gpus) {
        return gpus
                .stream()
                .map(GpuMapper::toGpuDto)
                .collect(Collectors.toList());
    }
}
