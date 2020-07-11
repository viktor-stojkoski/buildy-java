package com.mk.ukim.finki.wp.buildy.model.entity.components;

import com.mk.ukim.finki.wp.buildy.model.entity.base.BaseEntity;
import com.mk.ukim.finki.wp.buildy.model.entity.helpers.Manufacturer;
import com.mk.ukim.finki.wp.buildy.model.entity.helpers.Socket;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Cpu extends BaseEntity {

    private String name;

    private double price;

    private String imageUrl;

    private int cores;

    private int threads;

    private double frequency;

    private int cache;

    private boolean coolingSolution;

    @ManyToOne
    @JoinColumn(name = "manufacturer_fk")
    private Manufacturer manufacturer;

    @ManyToOne
    @JoinColumn(name = "socket_fk")
    private Socket socket;

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

    public int getCores() {
        return cores;
    }

    public void setCores(int cores) {
        this.cores = cores;
    }

    public int getThreads() {
        return threads;
    }

    public void setThreads(int threads) {
        this.threads = threads;
    }

    public double getFrequency() {
        return frequency;
    }

    public void setFrequency(double frequency) {
        this.frequency = frequency;
    }

    public int getCache() {
        return cache;
    }

    public void setCache(int cache) {
        this.cache = cache;
    }

    public boolean isCoolingSolution() {
        return coolingSolution;
    }

    public void setCoolingSolution(boolean coolingSolution) {
        this.coolingSolution = coolingSolution;
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
}
