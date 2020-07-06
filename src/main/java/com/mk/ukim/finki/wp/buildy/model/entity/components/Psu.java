package com.mk.ukim.finki.wp.buildy.model.entity.components;

import com.mk.ukim.finki.wp.buildy.model.entity.base.BaseEntity;
import com.mk.ukim.finki.wp.buildy.model.entity.helpers.Manufacturer;
import com.mk.ukim.finki.wp.buildy.model.entity.helpers.PsuEfficiency;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Psu extends BaseEntity {

    private String name;

    private double price;

    private String imageUrl;

    private boolean isModular;

    private int capacity;

    @ManyToOne
    @JoinColumn(name = "manufacturer_fk")
    private Manufacturer manufacturer;

    @ManyToOne
    @JoinColumn(name = "psu_efficiency_fk")
    private PsuEfficiency psuEfficiency;

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

    public boolean isModular() {
        return isModular;
    }

    public void setModular(boolean modular) {
        isModular = modular;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public Manufacturer getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(Manufacturer manufacturer) {
        this.manufacturer = manufacturer;
    }

    public PsuEfficiency getPsuEfficiency() {
        return psuEfficiency;
    }

    public void setPsuEfficiency(PsuEfficiency psuEfficiency) {
        this.psuEfficiency = psuEfficiency;
    }
}
