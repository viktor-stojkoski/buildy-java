package com.mk.ukim.finki.wp.buildy.web.controller;

import com.mk.ukim.finki.wp.buildy.model.dto.ComputerComponentNameDto;
import com.mk.ukim.finki.wp.buildy.service.ComputerService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/computers")
@CrossOrigin(origins = "http://localhost:4200")
public class ComputersController {

    private final ComputerService computerService;

    public ComputersController(ComputerService computerService) {
        this.computerService = computerService;
    }

    @GetMapping("component-names")
    public List<ComputerComponentNameDto> getComputerComponentNames(){
        return computerService.getComputerComponentNames();
    }
}
