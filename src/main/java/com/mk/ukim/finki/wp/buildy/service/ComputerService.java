package com.mk.ukim.finki.wp.buildy.service;

import com.mk.ukim.finki.wp.buildy.model.dto.ComputerComponentNameDto;
import com.mk.ukim.finki.wp.buildy.model.dto.ComputerDto;

import java.util.List;

public interface ComputerService {

    List<ComputerComponentNameDto> getComputerComponentNames();

    ComputerDto getComputerDto(Long id);
}
