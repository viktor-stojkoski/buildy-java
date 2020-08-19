package com.mk.ukim.finki.wp.buildy.mapper;

import com.mk.ukim.finki.wp.buildy.model.dto.ComputerComponentDto;
import com.mk.ukim.finki.wp.buildy.model.dto.ComputerComponentNameDto;
import com.mk.ukim.finki.wp.buildy.model.dto.ComputerDto;
import com.mk.ukim.finki.wp.buildy.model.entity.Computer;
import com.mk.ukim.finki.wp.buildy.model.enumeration.ComputerComponentName;

public final class ComputerMapper {

    public static ComputerComponentNameDto toComputerComponentNameDto(ComputerComponentName computerComponent) {
        ComputerComponentNameDto computerComponentNameDto = new ComputerComponentNameDto();

        computerComponentNameDto.setShortName(computerComponent.name());
        computerComponentNameDto.setLongName(computerComponent.longName);

        return computerComponentNameDto;
    }

    public static ComputerDto toComputerDto(Computer computer) {
        ComputerDto computerDto = new ComputerDto();

        ComputerComponentDto cpu = new ComputerComponentDto();
        cpu.setUid(computer.getCpu().getUid().toString());
        cpu.setName(computer.getCpu().getName());
        cpu.setPrice(computer.getCpu().getPrice());
        cpu.setComputerComponentName(ComputerComponentName.CPU);

        ComputerComponentDto gpu = new ComputerComponentDto();
        gpu.setUid(computer.getGpu().getUid().toString());
        gpu.setName(computer.getGpu().getName());
        gpu.setPrice(computer.getGpu().getPrice());
        gpu.setComputerComponentName(ComputerComponentName.GPU);

        ComputerComponentDto ram = new ComputerComponentDto();
        ram.setUid(computer.getRam().getUid().toString());
        ram.setName(computer.getRam().getName());
        ram.setPrice(computer.getRam().getPrice());
        ram.setComputerComponentName(ComputerComponentName.RAM);

        ComputerComponentDto pcCase = new ComputerComponentDto();
        pcCase.setUid(computer.getPcCase().getUid().toString());
        pcCase.setName(computer.getPcCase().getName());
        pcCase.setPrice(computer.getPcCase().getPrice());
        pcCase.setComputerComponentName(ComputerComponentName.Case);

        ComputerComponentDto cooling = new ComputerComponentDto();
        cooling.setUid(computer.getCooling().getUid().toString());
        cooling.setName(computer.getCooling().getName());
        cooling.setPrice(computer.getCooling().getPrice());
        cooling.setComputerComponentName(ComputerComponentName.Cooling);

        ComputerComponentDto motherboard = new ComputerComponentDto();
        motherboard.setUid(computer.getMotherboard().getUid().toString());
        motherboard.setName(computer.getMotherboard().getName());
        motherboard.setPrice(computer.getMotherboard().getPrice());
        motherboard.setComputerComponentName(ComputerComponentName.Motherboard);

        ComputerComponentDto psu = new ComputerComponentDto();
        psu.setUid(computer.getPsu().getUid().toString());
        psu.setName(computer.getPsu().getName());
        psu.setPrice(computer.getPsu().getPrice());
        psu.setComputerComponentName(ComputerComponentName.PSU);

        ComputerComponentDto storage = new ComputerComponentDto();
        storage.setUid(computer.getStorage().getUid().toString());
        storage.setName(computer.getStorage().getName());
        storage.setPrice(computer.getStorage().getPrice());
        storage.setComputerComponentName(ComputerComponentName.Storage);

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
