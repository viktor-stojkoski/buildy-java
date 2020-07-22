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
}
