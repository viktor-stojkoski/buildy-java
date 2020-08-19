package com.mk.ukim.finki.wp.buildy.service;

import com.mk.ukim.finki.wp.buildy.model.dto.ComputerComponentNameDto;
import com.mk.ukim.finki.wp.buildy.model.dto.ComputerDto;
import com.mk.ukim.finki.wp.buildy.model.request.computer.SaveComputerRequest;

import java.util.List;
import java.util.UUID;

public interface ComputerService {

    List<ComputerComponentNameDto> getComputerComponentNames();

    ComputerDto getOursComputerDto(Long id);

    ComputerDto saveComputerToUser(SaveComputerRequest saveComputerRequest);

    List<ComputerDto> getComputersForUser(UUID userUid);
}
