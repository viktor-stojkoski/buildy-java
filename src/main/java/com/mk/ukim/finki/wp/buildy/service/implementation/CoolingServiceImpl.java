package com.mk.ukim.finki.wp.buildy.service.implementation;

import com.mk.ukim.finki.wp.buildy.mapper.CoolingMapper;
import com.mk.ukim.finki.wp.buildy.model.dto.CoolingDto;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Cooling;
import com.mk.ukim.finki.wp.buildy.persistance.CoolingRepository;
import com.mk.ukim.finki.wp.buildy.service.CoolingService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoolingServiceImpl implements CoolingService {

    private final CoolingRepository coolingRepository;

    public CoolingServiceImpl(CoolingRepository coolingRepository) {
        this.coolingRepository = coolingRepository;
    }

    @Override
    public List<CoolingDto> getCoolingDtos() {
        List<Cooling> coolings = coolingRepository.findAll();

        return CoolingMapper.toCoolingDtos(coolings);
    }
}
