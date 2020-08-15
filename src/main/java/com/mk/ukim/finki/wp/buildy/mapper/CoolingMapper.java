package com.mk.ukim.finki.wp.buildy.mapper;

import com.mk.ukim.finki.wp.buildy.model.dto.CoolingDto;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Cooling;

import java.util.List;
import java.util.stream.Collectors;

public final class CoolingMapper {

    public static CoolingDto toCoolingDto(Cooling cooling) {
        CoolingDto coolingDto = new CoolingDto();

        coolingDto.setId(cooling.getId());
        coolingDto.setUid(cooling.getUid());
        coolingDto.setImageUrl(cooling.getImageUrl());
        coolingDto.setName(cooling.getName());
        coolingDto.setPrice(cooling.getPrice());
        coolingDto.setCoolingType(cooling.getCoolingType());
        coolingDto.setManufacturerName(cooling.getManufacturer().getName());
        coolingDto.setRgb(cooling.isRgb());
        coolingDto.setSize(cooling.getSize());
        coolingDto.setSpeed(cooling.getSpeed());

        return coolingDto;
    }

    public static List<CoolingDto> toCoolingDtos(List<Cooling> coolings) {
        return coolings
                .stream()
                .map(CoolingMapper::toCoolingDto)
                .collect(Collectors.toList());
    }
}
