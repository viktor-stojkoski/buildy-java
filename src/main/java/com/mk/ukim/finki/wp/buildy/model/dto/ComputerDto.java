package com.mk.ukim.finki.wp.buildy.model.dto;

import lombok.Data;

import java.util.UUID;

@Data
public class ComputerDto {

    public UUID uid;

    public String name;

    public ComputerComponentDto cpu;

    public ComputerComponentDto gpu;

    public ComputerComponentDto ram;

    public ComputerComponentDto pcCase;

    public ComputerComponentDto cooling;

    public ComputerComponentDto motherboard;

    public ComputerComponentDto psu;

    public ComputerComponentDto storage;
}
