package com.mk.ukim.finki.wp.buildy.model.dto;

import lombok.Data;

@Data
public class CpuDto extends BaseDto {

    public String imageUrl;

    public String name;

    public double price;

    public String manufacturerName;

    public String socketName;

    public int cores;

    public int threads;

    public double frequency;

    public int cache;

    public boolean coolingSolution;
}
