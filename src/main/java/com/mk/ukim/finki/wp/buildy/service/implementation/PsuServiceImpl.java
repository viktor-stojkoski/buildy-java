package com.mk.ukim.finki.wp.buildy.service.implementation;

import com.mk.ukim.finki.wp.buildy.mapper.PsuMapper;
import com.mk.ukim.finki.wp.buildy.model.dto.PsuDto;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Psu;
import com.mk.ukim.finki.wp.buildy.persistance.PsuRepository;
import com.mk.ukim.finki.wp.buildy.service.PsuService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PsuServiceImpl implements PsuService {

    private final PsuRepository psuRepository;

    public PsuServiceImpl(PsuRepository psuRepository) {
        this.psuRepository = psuRepository;
    }

    @Override
    public List<PsuDto> getPsuDtos() {
        List<Psu> psus = psuRepository.findAll();

        return PsuMapper.toPsuDtos(psus);
    }
}
