package com.mk.ukim.finki.wp.buildy.mapper;

import com.mk.ukim.finki.wp.buildy.model.dto.PsuDto;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Psu;

import java.util.List;
import java.util.stream.Collectors;

public final class PsuMapper {

    public static PsuDto toPsuDto(Psu psu) {
        PsuDto psuDto = new PsuDto();

        psuDto.setId(psu.getId());
        psuDto.setUid(psu.getUid());
        psuDto.setImageUrl(psu.getImageUrl());
        psuDto.setName(psu.getName());
        psuDto.setPrice(psu.getPrice());
        psuDto.setManufacturerName(psu.getManufacturer().getName());
        psuDto.setCapacity(psu.getCapacity());
        psuDto.setModularityType(psu.getModularityType());
        psuDto.setPsuEfficiency(psu.getPsuEfficiency().getName());

        return psuDto;
    }

    public static List<PsuDto> toPsuDtos(List<Psu> psus) {
        return psus
                .stream()
                .map(PsuMapper::toPsuDto)
                .collect(Collectors.toList());
    }
}
