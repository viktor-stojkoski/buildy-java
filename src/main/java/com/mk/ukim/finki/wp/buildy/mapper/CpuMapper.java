package com.mk.ukim.finki.wp.buildy.mapper;

import com.mk.ukim.finki.wp.buildy.model.dto.CpuDto;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Cpu;

import java.util.List;
import java.util.stream.Collectors;

public final class CpuMapper {

    public static CpuDto toCpuDto(Cpu cpu) {
        CpuDto cpuDto = new CpuDto();

        cpuDto.setId(cpu.getId());
        cpuDto.setUid(cpu.getUid());
        cpuDto.setImageUrl(cpu.getImageUrl());
        cpuDto.setName(cpu.getName());
        cpuDto.setPrice(cpu.getPrice());
        cpuDto.setManufacturerName(cpu.getManufacturer().getName());
        cpuDto.setSocketName(cpu.getSocket().getName());
        cpuDto.setCores(cpu.getCores());
        cpuDto.setThreads(cpu.getThreads());
        cpuDto.setFrequency(cpu.getFrequency());
        cpuDto.setCache(cpu.getCache());
        cpuDto.setCoolingSolution(cpu.isCoolingSolution());

        return cpuDto;
    }

    public static List<CpuDto> toCpuDtos(List<Cpu> cpus) {
        return cpus
                .stream()
                .map(CpuMapper::toCpuDto)
                .collect(Collectors.toList());
    }
}
