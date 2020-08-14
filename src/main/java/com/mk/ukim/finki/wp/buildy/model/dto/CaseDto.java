package com.mk.ukim.finki.wp.buildy.model.dto;

import com.mk.ukim.finki.wp.buildy.model.enumeration.MotherboardType;
import lombok.Data;

@Data
public class CaseDto extends BaseComputerComponentDto {

    public String manufacturerName;

    public int width;

    public int height;

    public int depth;

    public int numberOfFansSupported;

    public MotherboardType motherboardType;
}
