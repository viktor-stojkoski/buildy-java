package com.mk.ukim.finki.wp.buildy.mapper.computer;

import com.mk.ukim.finki.wp.buildy.model.dto.ComputerComponentDto;
import com.mk.ukim.finki.wp.buildy.model.dto.ComputerComponentNameDto;
import com.mk.ukim.finki.wp.buildy.model.dto.ComputerDto;
import com.mk.ukim.finki.wp.buildy.model.entity.Computer;
import com.mk.ukim.finki.wp.buildy.model.enumeration.ComputerComponentNames;

public final class ComputerMapper {

    // TODO: Rename this method -> `toComputerComponentNameDto`
    public static ComputerComponentNameDto toComputerComponentsDto(ComputerComponentNames computerComponents) {
        ComputerComponentNameDto computerComponentNameDto = new ComputerComponentNameDto();

        computerComponentNameDto.setShortName(computerComponents.name());
        computerComponentNameDto.setLongName(computerComponents.longName);

        return computerComponentNameDto;
    }

    public static ComputerDto toComputerDto(Computer computer) {
        ComputerDto computerDto = new ComputerDto();

        ComputerComponentDto cpu = new ComputerComponentDto();
        cpu.setName(computer.getCpu().getName());
        cpu.setPrice(computer.getCpu().getPrice());
        cpu.setComputerComponentName(ComputerComponentNames.CPU);

        ComputerComponentDto gpu = new ComputerComponentDto();
        gpu.setName(computer.getGpu().getName());
        gpu.setPrice(computer.getGpu().getPrice());
        gpu.setComputerComponentName(ComputerComponentNames.GPU);

        ComputerComponentDto ram = new ComputerComponentDto();
        ram.setName(computer.getRam().getName());
        ram.setPrice(computer.getRam().getPrice());
        ram.setComputerComponentName(ComputerComponentNames.RAM);

        ComputerComponentDto pcCase = new ComputerComponentDto();
        pcCase.setName(computer.getPcCase().getName());
        pcCase.setPrice(computer.getPcCase().getPrice());
        pcCase.setComputerComponentName(ComputerComponentNames.Case);

        ComputerComponentDto cooling = new ComputerComponentDto();
        cooling.setName(computer.getCooling().getName());
        cooling.setPrice(computer.getCooling().getPrice());
        cooling.setComputerComponentName(ComputerComponentNames.Cooling);

        ComputerComponentDto motherboard = new ComputerComponentDto();
        motherboard.setName(computer.getMotherboard().getName());
        motherboard.setPrice(computer.getMotherboard().getPrice());
        motherboard.setComputerComponentName(ComputerComponentNames.Motherboard);

        ComputerComponentDto psu = new ComputerComponentDto();
        psu.setName(computer.getPsu().getName());
        psu.setPrice(computer.getPsu().getPrice());
        psu.setComputerComponentName(ComputerComponentNames.PSU);

        ComputerComponentDto storage = new ComputerComponentDto();
        storage.setName(computer.getStorage().getName());
        storage.setPrice(computer.getStorage().getPrice());
        storage.setComputerComponentName(ComputerComponentNames.Storage);

        computerDto.setCpu(cpu);
        computerDto.setGpu(gpu);
        computerDto.setRam(ram);
        computerDto.setPcCase(pcCase);
        computerDto.setCooling(cooling);
        computerDto.setMotherboard(motherboard);
        computerDto.setPsu(psu);
        computerDto.setStorage(storage);

        return computerDto;
    }
}
