package com.mk.ukim.finki.wp.buildy.model.entity.helpers;

import com.mk.ukim.finki.wp.buildy.model.entity.base.BaseEntity;
import com.mk.ukim.finki.wp.buildy.model.entity.components.Psu;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import java.util.List;

@Entity
public class PsuEfficiency extends BaseEntity {

    private String name;

    @OneToMany(mappedBy = "psuEfficiency")
    private List<Psu> psus;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Psu> getPsus() {
        return psus;
    }

    public void setPsus(List<Psu> psus) {
        this.psus = psus;
    }
}
