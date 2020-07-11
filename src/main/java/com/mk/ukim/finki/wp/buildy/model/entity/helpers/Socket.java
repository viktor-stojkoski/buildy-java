package com.mk.ukim.finki.wp.buildy.model.entity.helpers;

import com.mk.ukim.finki.wp.buildy.model.entity.base.BaseEntity;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Cpu;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Motherboard;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import java.util.List;

@Entity
public class Socket extends BaseEntity {

    private String name;

    @OneToMany(mappedBy = "socket")
    private List<Motherboard> motherboards;

    @OneToMany(mappedBy = "socket")
    private List<Cpu> cpus;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Motherboard> getMotherboards() {
        return motherboards;
    }

    public void setMotherboards(List<Motherboard> motherboards) {
        this.motherboards = motherboards;
    }

    public List<Cpu> getCpus() {
        return cpus;
    }

    public void setCpus(List<Cpu> cpus) {
        this.cpus = cpus;
    }
}
