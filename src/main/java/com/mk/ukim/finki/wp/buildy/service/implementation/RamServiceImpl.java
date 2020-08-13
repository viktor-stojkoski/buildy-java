package com.mk.ukim.finki.wp.buildy.service.implementation;

import com.mk.ukim.finki.wp.buildy.mapper.RamMapper;
import com.mk.ukim.finki.wp.buildy.model.dto.RamDto;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Ram;
import com.mk.ukim.finki.wp.buildy.persistance.RamRepository;
import com.mk.ukim.finki.wp.buildy.service.RamService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RamServiceImpl implements RamService {

    private final RamRepository ramRepository;

    public RamServiceImpl(RamRepository ramRepository) {
        this.ramRepository = ramRepository;
    }

    @Override
    public List<RamDto> getRamDtos() {
        List<Ram> rams = ramRepository.findAll();

        return RamMapper.toRamDtos(rams);
    }
}
