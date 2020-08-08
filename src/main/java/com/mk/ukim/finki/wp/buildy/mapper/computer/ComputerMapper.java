package com.mk.ukim.finki.wp.buildy.mapper.computer;

import com.mk.ukim.finki.wp.buildy.model.dto.ComputerComponentNameDto;
import com.mk.ukim.finki.wp.buildy.model.enumeration.ComputerComponentNames;

public final class ComputerMapper {

    public static ComputerComponentNameDto toComputerComponentsDto(ComputerComponentNames computerComponents) {
        ComputerComponentNameDto computerComponentNameDto = new ComputerComponentNameDto();

        computerComponentNameDto.setShortName(computerComponents.name());
        computerComponentNameDto.setLongName(computerComponents.longName);

        return computerComponentNameDto;
    }
}
