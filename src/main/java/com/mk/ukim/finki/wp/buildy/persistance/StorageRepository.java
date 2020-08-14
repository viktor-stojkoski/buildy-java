package com.mk.ukim.finki.wp.buildy.persistance;

import com.mk.ukim.finki.wp.buildy.model.entity.components.Storage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StorageRepository extends JpaRepository<Storage, Long> {
}
