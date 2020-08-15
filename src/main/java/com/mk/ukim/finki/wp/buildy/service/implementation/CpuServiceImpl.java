package com.mk.ukim.finki.wp.buildy.service.implementation;

import com.mk.ukim.finki.wp.buildy.mapper.CpuMapper;
import com.mk.ukim.finki.wp.buildy.model.dto.CpuDto;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Cpu;
import com.mk.ukim.finki.wp.buildy.persistance.CpuRepository;
import com.mk.ukim.finki.wp.buildy.service.CpuService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CpuServiceImpl implements CpuService {

    private final CpuRepository cpuRepository;

    public CpuServiceImpl(CpuRepository cpuRepository) {
        this.cpuRepository = cpuRepository;
    }

    @Override
    public List<CpuDto> getCpuDtos() {
        List<Cpu> cpus = cpuRepository.findAll();

        return CpuMapper.toCpuDtos(cpus);
    }
}
