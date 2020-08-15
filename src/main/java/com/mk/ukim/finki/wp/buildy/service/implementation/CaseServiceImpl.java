package com.mk.ukim.finki.wp.buildy.service.implementation;

import com.mk.ukim.finki.wp.buildy.mapper.CaseMapper;
import com.mk.ukim.finki.wp.buildy.model.dto.CaseDto;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Case;
import com.mk.ukim.finki.wp.buildy.persistance.CaseRepository;
import com.mk.ukim.finki.wp.buildy.service.CaseService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CaseServiceImpl implements CaseService {

    private final CaseRepository caseRepository;

    public CaseServiceImpl(CaseRepository caseRepository) {
        this.caseRepository = caseRepository;
    }

    @Override
    public List<CaseDto> getCaseDtos() {
        List<Case> pcCases = caseRepository.findAll();

        return CaseMapper.toCaseDtos(pcCases);
    }
}
