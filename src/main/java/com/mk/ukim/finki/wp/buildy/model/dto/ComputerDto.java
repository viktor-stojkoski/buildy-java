package com.mk.ukim.finki.wp.buildy.model.dto;

import lombok.Data;

@Data
public class ComputerDto {

    public ComputerComponentDto cpu;

    public ComputerComponentDto gpu;

    public ComputerComponentDto ram;

    public ComputerComponentDto pcCase;

    public ComputerComponentDto cooling;

    public ComputerComponentDto motherboard;

    public ComputerComponentDto psu;

    public ComputerComponentDto storage;
}
