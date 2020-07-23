package com.mk.ukim.finki.wp.buildy.model.entity.components;

import com.mk.ukim.finki.wp.buildy.model.entity.Computer;
import com.mk.ukim.finki.wp.buildy.model.entity.base.BaseEntity;
import com.mk.ukim.finki.wp.buildy.model.entity.helpers.Manufacturer;
import com.mk.ukim.finki.wp.buildy.model.enumeration.RamMemoryType;

import javax.persistence.*;
import java.util.List;

@Entity
public class Ram extends BaseEntity {

    private String name;

    private double price;

    private String imageUrl;

    private double frequency;

    private int size;

    private String timing;

    @Enumerated(EnumType.STRING)
    private RamMemoryType memoryType;

    @ManyToOne
    @JoinColumn(name = "manufacturer_fk")
    private Manufacturer manufacturer;

    @OneToMany(mappedBy = "ram")
    private List<Computer> computers;

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

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getTiming() {
        return timing;
    }

    public void setTiming(String timing) {
        this.timing = timing;
    }

    public RamMemoryType getMemoryType() {
        return memoryType;
    }

    public void setMemoryType(RamMemoryType memoryType) {
        this.memoryType = memoryType;
    }

    public Manufacturer getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(Manufacturer manufacturer) {
        this.manufacturer = manufacturer;
    }

    public List<Computer> getComputers() {
        return computers;
    }

    public void setComputers(List<Computer> computers) {
        this.computers = computers;
    }
}
