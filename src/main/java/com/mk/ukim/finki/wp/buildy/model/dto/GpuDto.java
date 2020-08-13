package com.mk.ukim.finki.wp.buildy.model.dto;

import com.mk.ukim.finki.wp.buildy.model.enumeration.GpuMemoryType;
import lombok.Data;

@Data
public class GpuDto extends BaseComputerComponentDto {

    public String manufacturerName;

    public GpuMemoryType gpuMemoryType;

    public int ramSize;

    public String timing;

    public double frequency;

    public int memoryClock;
}
