package com.mk.ukim.finki.wp.buildy.service.implementation;

import com.mk.ukim.finki.wp.buildy.mapper.computer.ComputerMapper;
import com.mk.ukim.finki.wp.buildy.model.dto.ComputerComponentNameDto;
import com.mk.ukim.finki.wp.buildy.model.enumeration.ComputerComponentNames;
import com.mk.ukim.finki.wp.buildy.service.ComputerService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ComputerServiceImpl implements ComputerService {

    public List<ComputerComponentNameDto> getComputerComponentNames() {
        List<ComputerComponentNameDto> computerComponentNameDtos = new ArrayList<>();

        for (ComputerComponentNames c : ComputerComponentNames.values()) {
            computerComponentNameDtos.add(ComputerMapper.toComputerComponentsDto(c));
        }

        return computerComponentNameDtos;
    }

}
