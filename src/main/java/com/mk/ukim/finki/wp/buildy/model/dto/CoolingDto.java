package com.mk.ukim.finki.wp.buildy.model.dto;

import com.mk.ukim.finki.wp.buildy.model.enumeration.CoolingType;
import lombok.Data;

@Data
public class CoolingDto extends BaseComputerComponentDto {

    public String manufacturerName;

    public int size;

    public int speed;

    public CoolingType coolingType;

    public boolean isRgb;
}
