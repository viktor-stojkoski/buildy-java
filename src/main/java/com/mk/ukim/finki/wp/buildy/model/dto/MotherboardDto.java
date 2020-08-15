package com.mk.ukim.finki.wp.buildy.model.dto;

import com.mk.ukim.finki.wp.buildy.model.enumeration.MotherboardType;
import lombok.Data;

@Data
public class MotherboardDto extends BaseComputerComponentDto {

    public String manufacturerName;

    public MotherboardType motherboardType;

    public String socketName;

    public int memorySupported;

    public int numberOfDimmSlots;
}
