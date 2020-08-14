package com.mk.ukim.finki.wp.buildy.mapper;

import com.mk.ukim.finki.wp.buildy.model.dto.CaseDto;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Case;

import java.util.List;
import java.util.stream.Collectors;

public final class CaseMapper {

    public static CaseDto toCaseDto(Case pcCase) {
        CaseDto caseDto = new CaseDto();

        caseDto.setId(pcCase.getId());
        caseDto.setUid(pcCase.getUid());
        caseDto.setImageUrl(pcCase.getImageUrl());
        caseDto.setName(pcCase.getName());
        caseDto.setPrice(pcCase.getPrice());
        caseDto.setManufacturerName(pcCase.getManufacturer().getName());
        caseDto.setHeight(pcCase.getHeight());
        caseDto.setWidth(pcCase.getWidth());
        caseDto.setDepth(pcCase.getDepth());
        caseDto.setMotherboardType(pcCase.getMotherboardType());
        caseDto.setNumberOfFansSupported(pcCase.getNumberOfFansSupported());

        return caseDto;
    }

    public static List<CaseDto> toCaseDtos(List<Case> pcCases) {
        return pcCases
                .stream()
                .map(CaseMapper::toCaseDto)
                .collect(Collectors.toList());
    }
}
