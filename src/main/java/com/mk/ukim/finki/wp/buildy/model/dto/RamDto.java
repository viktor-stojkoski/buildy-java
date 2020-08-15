package com.mk.ukim.finki.wp.buildy.model.dto;

import com.mk.ukim.finki.wp.buildy.model.enumeration.RamMemoryType;
import lombok.Data;

@Data
public class RamDto extends BaseComputerComponentDto {

    public String manufacturerName;

    public RamMemoryType ramMemoryType;

    public int size;

    public String timing;

    public int frequency;
}
