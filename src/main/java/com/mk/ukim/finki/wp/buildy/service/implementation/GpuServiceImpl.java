package com.mk.ukim.finki.wp.buildy.service.implementation;

import com.mk.ukim.finki.wp.buildy.mapper.GpuMapper;
import com.mk.ukim.finki.wp.buildy.model.dto.GpuDto;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Gpu;
import com.mk.ukim.finki.wp.buildy.persistance.GpuRepository;
import com.mk.ukim.finki.wp.buildy.service.GpuService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GpuServiceImpl implements GpuService {

    private final GpuRepository gpuRepository;

    public GpuServiceImpl(GpuRepository gpuRepository) {
        this.gpuRepository = gpuRepository;
    }

    @Override
    public List<GpuDto> getGpuDtos() {
        List<Gpu> gpus = gpuRepository.findAll();

        return GpuMapper.toGpuDtos(gpus);
    }
}
