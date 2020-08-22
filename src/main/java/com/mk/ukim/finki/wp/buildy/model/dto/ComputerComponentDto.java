package com.mk.ukim.finki.wp.buildy.model.dto;

import com.mk.ukim.finki.wp.buildy.model.enumeration.ComputerComponentName;
import lombok.Data;

@Data
public class ComputerComponentDto {

    public String uid;

    public ComputerComponentName computerComponentName;

    public String name;

    public double price;
}
