package com.mk.ukim.finki.wp.buildy.mapper;

import com.mk.ukim.finki.wp.buildy.model.dto.RamDto;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Ram;

import java.util.List;
import java.util.stream.Collectors;

public final class RamMapper {

    public static RamDto toRamDto(Ram ram) {
        RamDto ramDto = new RamDto();

        ramDto.setId(ram.getId());
        ramDto.setUid(ram.getUid());
        ramDto.setImageUrl(ram.getImageUrl());
        ramDto.setName(ram.getName());
        ramDto.setPrice(ram.getPrice());
        ramDto.setManufacturerName(ram.getManufacturer().getName());
        ramDto.setRamMemoryType(ram.getMemoryType());
        ramDto.setFrequency(((int) ram.getFrequency()));
        ramDto.setSize(ram.getSize());
        ramDto.setTiming(ram.getTiming());

        return ramDto;
    }

    public static List<RamDto> toRamDtos(List<Ram> rams) {
        return rams
                .stream()
                .map(RamMapper::toRamDto)
                .collect(Collectors.toList());
    }
}
