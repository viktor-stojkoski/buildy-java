package com.mk.ukim.finki.wp.buildy.persistance;

import com.mk.ukim.finki.wp.buildy.model.entity.components.Cooling;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface CoolingRepository extends JpaRepository<Cooling, Long> {

    Optional<Cooling> findCoolingByUid(UUID uid);
}
