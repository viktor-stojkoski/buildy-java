package com.mk.ukim.finki.wp.buildy.model.entity.helpers;

import com.mk.ukim.finki.wp.buildy.model.entity.base.BaseEntity;
import com.mk.ukim.finki.wp.buildy.model.entity.components.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import java.util.List;

@Entity
public class Manufacturer extends BaseEntity {

    @Column(columnDefinition = "NVARCHAR(100)")
    private String name;

    @Column(columnDefinition = "NVARCHAR(1000)")
    private String description;

    @OneToMany(mappedBy = "manufacturer")
    private List<Cpu> cpus;

    @OneToMany(mappedBy = "manufacturer")
    private List<Gpu> gpus;

    @OneToMany(mappedBy = "manufacturer")
    private List<Ram> rams;

    @OneToMany(mappedBy = "manufacturer")
    private List<Motherboard> motherboards;

    @OneToMany(mappedBy = "manufacturer")
    private List<Psu> psus;

    @OneToMany(mappedBy = "manufacturer")
    private List<Storage> storages;

    @OneToMany(mappedBy = "manufacturer")
    private List<Cooling> coolings;

    @OneToMany(mappedBy = "manufacturer")
    private List<Case> cases;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Cpu> getCpus() {
        return cpus;
    }

    public void setCpus(List<Cpu> cpus) {
        this.cpus = cpus;
    }

    public List<Gpu> getGpus() {
        return gpus;
    }

    public void setGpus(List<Gpu> gpus) {
        this.gpus = gpus;
    }

    public List<Ram> getRams() {
        return rams;
    }

    public void setRams(List<Ram> rams) {
        this.rams = rams;
    }

    public List<Motherboard> getMotherboards() {
        return motherboards;
    }

    public void setMotherboards(List<Motherboard> motherboards) {
        this.motherboards = motherboards;
    }

    public List<Psu> getPsus() {
        return psus;
    }

    public void setPsus(List<Psu> psus) {
        this.psus = psus;
    }

    public List<Storage> getStorages() {
        return storages;
    }

    public void setStorages(List<Storage> storages) {
        this.storages = storages;
    }

    public List<Cooling> getCoolings() {
        return coolings;
    }

    public void setCoolings(List<Cooling> coolings) {
        this.coolings = coolings;
    }

    public List<Case> getCases() {
        return cases;
    }

    public void setCases(List<Case> cases) {
        this.cases = cases;
    }
}
