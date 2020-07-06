package com.mk.ukim.finki.wp.buildy.model.entity.helpers;

import com.mk.ukim.finki.wp.buildy.model.entity.base.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Manufacturer extends BaseEntity {

    @Column(columnDefinition = "NVARCHAR(100)")
    private String name;

    @Column(columnDefinition = "NVARCHAR(1000)")
    private String description;

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
}
