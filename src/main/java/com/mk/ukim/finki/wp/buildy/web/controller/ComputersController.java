package com.mk.ukim.finki.wp.buildy.web.controller;

import com.mk.ukim.finki.wp.buildy.model.dto.ComputerComponentNameDto;
import com.mk.ukim.finki.wp.buildy.model.dto.ComputerDto;
import com.mk.ukim.finki.wp.buildy.model.request.computer.SaveComputerRequest;
import com.mk.ukim.finki.wp.buildy.service.ComputerService;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

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

    @GetMapping("ours/{id}")
    public ComputerDto getOursComputer(@PathVariable Long id) {
        return computerService.getOursComputerDto(id);
    }

    @GetMapping("{userUid}")
    public List<ComputerDto> getComputersForUser(@PathVariable UUID userUid) {
        return computerService.getComputersForUser(userUid);
    }

    @PostMapping
    public ComputerDto saveComputerToUser(@RequestBody SaveComputerRequest saveComputerRequest) {
        return computerService.saveComputerToUser(saveComputerRequest);
    }
}
