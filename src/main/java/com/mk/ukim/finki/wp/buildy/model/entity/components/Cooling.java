package com.mk.ukim.finki.wp.buildy.model.entity.components;

import com.mk.ukim.finki.wp.buildy.model.entity.Computer;
import com.mk.ukim.finki.wp.buildy.model.entity.base.BaseEntity;
import com.mk.ukim.finki.wp.buildy.model.entity.helpers.Manufacturer;
import com.mk.ukim.finki.wp.buildy.model.enumeration.CoolingType;

import javax.persistence.*;
import java.util.List;

@Entity
public class Cooling extends BaseEntity {

    private String name;

    private double price;

    private String imageUrl;

    private int size;

    private boolean isRgb;

    private int speed;

    @Enumerated(EnumType.STRING)
    private CoolingType coolingType;

    @ManyToOne
    @JoinColumn(name = "manufacturer_fk")
    private Manufacturer manufacturer;

    @OneToMany(mappedBy = "cooling")
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

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public boolean isRgb() {
        return isRgb;
    }

    public void setRgb(boolean rgb) {
        isRgb = rgb;
    }

    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public CoolingType getCoolingType() {
        return coolingType;
    }

    public void setCoolingType(CoolingType coolingType) {
        this.coolingType = coolingType;
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
