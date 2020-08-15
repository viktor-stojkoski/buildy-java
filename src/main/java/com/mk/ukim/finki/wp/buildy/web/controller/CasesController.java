package com.mk.ukim.finki.wp.buildy.web.controller;

import com.mk.ukim.finki.wp.buildy.model.dto.CaseDto;
import com.mk.ukim.finki.wp.buildy.service.CaseService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/cases")
@CrossOrigin(origins = "http://localhost:4200")
public class CasesController {

    private final CaseService caseService;

    public CasesController(CaseService caseService) {
        this.caseService = caseService;
    }

    @GetMapping
    public List<CaseDto> getCases() {
        return caseService.getCaseDtos();
    }
}
