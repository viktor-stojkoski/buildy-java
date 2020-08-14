package com.mk.ukim.finki.wp.buildy.mapper;

import com.mk.ukim.finki.wp.buildy.model.dto.MotherboardDto;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Motherboard;

import java.util.List;
import java.util.stream.Collectors;

public final class MotherboardMapper {

    public static MotherboardDto toMotherboardDto(Motherboard motherboard) {
        MotherboardDto motherboardDto = new MotherboardDto();

        motherboardDto.setId(motherboard.getId());
        motherboardDto.setUid(motherboard.getUid());
        motherboardDto.setImageUrl(motherboard.getImageUrl());
        motherboardDto.setName(motherboard.getName());
        motherboardDto.setPrice(motherboard.getPrice());
        motherboardDto.setManufacturerName(motherboard.getManufacturer().getName());
        motherboardDto.setSocketName(motherboard.getSocket().getName());
        motherboardDto.setMemorySupported(motherboard.getMemorySupported());
        motherboardDto.setNumberOfDimmSlots(motherboard.getNumberOfDimmSlots());
        motherboardDto.setMotherboardType(motherboard.getMotherboardType());

        return motherboardDto;
    }

    public static List<MotherboardDto> toMotherboardDtos(List<Motherboard> motherboards) {
        return motherboards
                .stream()
                .map(MotherboardMapper::toMotherboardDto)
                .collect(Collectors.toList());
    }
}
