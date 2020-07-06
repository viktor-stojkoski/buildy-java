package com.mk.ukim.finki.wp.buildy.model.entity.components;

import com.mk.ukim.finki.wp.buildy.model.entity.base.BaseEntity;
import com.mk.ukim.finki.wp.buildy.model.entity.helpers.Manufacturer;
import com.mk.ukim.finki.wp.buildy.model.enumeration.MotherboardType;

import javax.persistence.*;

@Entity
public class Case extends BaseEntity {

    private String name;

    private double price;

    private String imageUrl;

    private String dimensions;

    private int numberOfFansSupported;

    @Enumerated(EnumType.STRING)
    private MotherboardType motherboardType;

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

    public String getDimensions() {
        return dimensions;
    }

    public void setDimensions(String dimensions) {
        this.dimensions = dimensions;
    }

    public int getNumberOfFansSupported() {
        return numberOfFansSupported;
    }

    public void setNumberOfFansSupported(int numberOfFansSupported) {
        this.numberOfFansSupported = numberOfFansSupported;
    }

    public MotherboardType getMotherboardType() {
        return motherboardType;
    }

    public void setMotherboardType(MotherboardType motherboardType) {
        this.motherboardType = motherboardType;
    }

    public Manufacturer getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(Manufacturer manufacturer) {
        this.manufacturer = manufacturer;
    }
}
