package com.mk.ukim.finki.wp.buildy.service.implementation;

import com.mk.ukim.finki.wp.buildy.mapper.MotherboardMapper;
import com.mk.ukim.finki.wp.buildy.model.dto.MotherboardDto;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Motherboard;
import com.mk.ukim.finki.wp.buildy.persistance.MotherboardRepository;
import com.mk.ukim.finki.wp.buildy.service.MotherboardService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MotherboardServiceImpl implements MotherboardService {

    private final MotherboardRepository motherboardRepository;

    public MotherboardServiceImpl(MotherboardRepository motherboardRepository) {
        this.motherboardRepository = motherboardRepository;
    }

    @Override
    public List<MotherboardDto> getMotherboardDtos() {
        List<Motherboard> motherboards = motherboardRepository.findAll();

        return MotherboardMapper.toMotherboardDtos(motherboards);
    }
}
