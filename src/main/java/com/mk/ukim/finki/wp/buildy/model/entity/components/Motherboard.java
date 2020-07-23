package com.mk.ukim.finki.wp.buildy.model.entity.components;

import com.mk.ukim.finki.wp.buildy.model.entity.Computer;
import com.mk.ukim.finki.wp.buildy.model.entity.base.BaseEntity;
import com.mk.ukim.finki.wp.buildy.model.entity.helpers.Chipset;
import com.mk.ukim.finki.wp.buildy.model.entity.helpers.Manufacturer;
import com.mk.ukim.finki.wp.buildy.model.entity.helpers.Socket;
import com.mk.ukim.finki.wp.buildy.model.enumeration.MotherboardType;

import javax.persistence.*;
import java.util.List;

@Entity
public class Motherboard extends BaseEntity {

    private String name;

    private double price;

    private String imageUrl;

    private int numberOfDimmSlots;

    private int MemorySupported;

    @Enumerated(EnumType.STRING)
    private MotherboardType motherboardType;

    @ManyToOne
    @JoinColumn(name = "socket_fk")
    private Socket socket;

    @ManyToOne
    @JoinColumn(name = "chipset_fk")
    private Chipset chipset;

    @ManyToOne
    @JoinColumn(name = "manufacturer_fk")
    private Manufacturer manufacturer;

    @OneToMany(mappedBy = "motherboard")
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

    public int getNumberOfDimmSlots() {
        return numberOfDimmSlots;
    }

    public void setNumberOfDimmSlots(int numberOfDimmSlots) {
        this.numberOfDimmSlots = numberOfDimmSlots;
    }

    public int getMemorySupported() {
        return MemorySupported;
    }

    public void setMemorySupported(int memorySupported) {
        MemorySupported = memorySupported;
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

    public Socket getSocket() {
        return socket;
    }

    public void setSocket(Socket socket) {
        this.socket = socket;
    }

    public Chipset getChipset() {
        return chipset;
    }

    public void setChipset(Chipset chipset) {
        this.chipset = chipset;
    }

    public List<Computer> getComputers() {
        return computers;
    }

    public void setComputers(List<Computer> computers) {
        this.computers = computers;
    }
}
