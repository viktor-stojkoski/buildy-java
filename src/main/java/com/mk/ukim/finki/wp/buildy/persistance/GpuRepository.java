package com.mk.ukim.finki.wp.buildy.persistance;

import com.mk.ukim.finki.wp.buildy.model.entity.components.Gpu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface GpuRepository extends JpaRepository<Gpu, Long> {

    Optional<Gpu> findGpuByUid(UUID uid);
}
