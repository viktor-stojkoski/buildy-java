package com.mk.ukim.finki.wp.buildy.service.implementation;

import com.mk.ukim.finki.wp.buildy.mapper.computer.ComputerMapper;
import com.mk.ukim.finki.wp.buildy.model.dto.ComputerComponentNameDto;
import com.mk.ukim.finki.wp.buildy.model.dto.ComputerDto;
import com.mk.ukim.finki.wp.buildy.model.entity.Computer;
import com.mk.ukim.finki.wp.buildy.model.enumeration.ComputerComponentName;
import com.mk.ukim.finki.wp.buildy.model.exception.BuildyNotFoundException;
import com.mk.ukim.finki.wp.buildy.model.exception.ErrorCodes;
import com.mk.ukim.finki.wp.buildy.persistance.ComputerRepository;
import com.mk.ukim.finki.wp.buildy.service.ComputerService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ComputerServiceImpl implements ComputerService {

    private final ComputerRepository computerRepository;

    public ComputerServiceImpl(ComputerRepository computerRepository) {
        this.computerRepository = computerRepository;
    }

    @Override
    public List<ComputerComponentNameDto> getComputerComponentNames() {
        List<ComputerComponentNameDto> computerComponentNameDtos = new ArrayList<>();

        for (ComputerComponentName c : ComputerComponentName.values()) {
            computerComponentNameDtos.add(ComputerMapper.toComputerComponentNameDto(c));
        }

        return computerComponentNameDtos;
    }

    @Override
    public ComputerDto getComputerDto(Long id) {
        Computer computer = computerRepository
                .findById(id)
                .orElseThrow(() -> new BuildyNotFoundException(ErrorCodes.COMPUTER_NOT_FOUND));

        return ComputerMapper.toComputerDto(computer);
    }
}
