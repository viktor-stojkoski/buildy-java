package com.mk.ukim.finki.wp.buildy.model.entity.components;

import com.mk.ukim.finki.wp.buildy.model.entity.base.BaseEntity;
import com.mk.ukim.finki.wp.buildy.model.entity.helpers.Manufacturer;
import com.mk.ukim.finki.wp.buildy.model.enumeration.GpuMemoryType;

import javax.persistence.*;

@Entity
public class Gpu extends BaseEntity {

    private String name;

    private double price;

    private String imageUrl;

    private double frequency;

    private double memoryClock;

    private String timing;

    private double ramSize;

    @Enumerated(value = EnumType.STRING)
    private GpuMemoryType memoryType;

    @ManyToOne
    @JoinColumn(name = "manufacturer_fk")
    private Manufacturer manufacturer;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public double getFrequency() {
        return frequency;
    }

    public void setFrequency(double frequency) {
        this.frequency = frequency;
    }

    public double getMemoryClock() {
        return memoryClock;
    }

    public void setMemoryClock(double memoryClock) {
        this.memoryClock = memoryClock;
    }

    public String getTiming() {
        return timing;
    }

    public void setTiming(String timing) {
        this.timing = timing;
    }

    public double getRamSize() {
        return ramSize;
    }

    public void setRamSize(double ramSize) {
        this.ramSize = ramSize;
    }

    public GpuMemoryType getMemoryType() {
        return memoryType;
    }

    public void setMemoryType(GpuMemoryType memoryType) {
        this.memoryType = memoryType;
    }

    public Manufacturer getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(Manufacturer manufacturer) {
        this.manufacturer = manufacturer;
    }
}
