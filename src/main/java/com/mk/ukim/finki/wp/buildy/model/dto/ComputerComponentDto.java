package com.mk.ukim.finki.wp.buildy.model.dto;

import com.mk.ukim.finki.wp.buildy.model.enumeration.ComputerComponentNames;
import lombok.Data;

@Data
public class ComputerComponentDto {

    public ComputerComponentNames computerComponentName;

    public String name;

    public double price;
}
