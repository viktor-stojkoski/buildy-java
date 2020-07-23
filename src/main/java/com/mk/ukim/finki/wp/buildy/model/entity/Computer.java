package com.mk.ukim.finki.wp.buildy.model.entity;

import com.mk.ukim.finki.wp.buildy.model.entity.base.BaseEntity;
import com.mk.ukim.finki.wp.buildy.model.entity.components.*;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Computer extends BaseEntity {

    private String name;

    private double price;

    private int fanCount;

    private int ramAmount;

    private int storageAmount;

    @ManyToOne
    @JoinColumn(name = "pc_case_fk")
    private Case pcCase;

    @ManyToOne
    @JoinColumn(name = "cooling_fk")
    private Cooling cooling;

    @ManyToOne
    @JoinColumn(name = "cpu_fk")
    private Cpu cpu;

    @ManyToOne
    @JoinColumn(name = "gpu_fk")
    private Gpu gpu;

    @ManyToOne
    @JoinColumn(name = "motherboard_fk")
    private Motherboard motherboard;

    @ManyToOne
    @JoinColumn(name = "psu_fk")
    private Psu psu;

    @ManyToOne
    @JoinColumn(name = "ram_fk")
    private Ram ram;

    @ManyToOne
    @JoinColumn(name = "storage_fk")
    private Storage storage;

    // TODO: Add users

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

    public int getFanCount() {
        return fanCount;
    }

    public void setFanCount(int fanCount) {
        this.fanCount = fanCount;
    }

    public int getRamAmount() {
        return ramAmount;
    }

    public void setRamAmount(int ramAmount) {
        this.ramAmount = ramAmount;
    }

    public int getStorageAmount() {
        return storageAmount;
    }

    public void setStorageAmount(int storageAmount) {
        this.storageAmount = storageAmount;
    }

    public Case getPcCase() {
        return pcCase;
    }

    public void setPcCase(Case pcCase) {
        this.pcCase = pcCase;
    }

    public Cooling getCooling() {
        return cooling;
    }

    public void setCooling(Cooling cooling) {
        this.cooling = cooling;
    }

    public Cpu getCpu() {
        return cpu;
    }

    public void setCpu(Cpu cpu) {
        this.cpu = cpu;
    }

    public Gpu getGpu() {
        return gpu;
    }

    public void setGpu(Gpu gpu) {
        this.gpu = gpu;
    }

    public Motherboard getMotherboard() {
        return motherboard;
    }

    public void setMotherboard(Motherboard motherboard) {
        this.motherboard = motherboard;
    }

    public Psu getPsu() {
        return psu;
    }

    public void setPsu(Psu psu) {
        this.psu = psu;
    }

    public Ram getRam() {
        return ram;
    }

    public void setRam(Ram ram) {
        this.ram = ram;
    }

    public Storage getStorage() {
        return storage;
    }

    public void setStorage(Storage storage) {
        this.storage = storage;
    }
}
