package com.mk.ukim.finki.wp.buildy.model.entity.base;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.UUID;

@MappedSuperclass
public abstract class BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;

    @Column(columnDefinition = "UNIQUEIDENTIFIER")
    protected UUID uid;

    @Version
    protected Long version;

    protected LocalDateTime deletedOn;
}
