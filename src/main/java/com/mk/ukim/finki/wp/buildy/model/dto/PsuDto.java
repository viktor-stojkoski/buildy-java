package com.mk.ukim.finki.wp.buildy.model.dto;

import com.mk.ukim.finki.wp.buildy.model.enumeration.ModularityType;
import lombok.Data;

@Data
public class PsuDto extends BaseComputerComponentDto {

    public String manufacturerName;

    public String psuEfficiency;

    public int capacity;

    public ModularityType modularityType;
}
