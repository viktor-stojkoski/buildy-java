package com.mk.ukim.finki.wp.buildy.model.entity.helpers;

import com.mk.ukim.finki.wp.buildy.model.entity.base.BaseEntity;

import javax.persistence.Entity;

@Entity
public class Socket extends BaseEntity {

    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
