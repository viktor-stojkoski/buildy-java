package com.mk.ukim.finki.wp.buildy.persistance;

import com.mk.ukim.finki.wp.buildy.model.entity.components.Ram;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface RamRepository extends JpaRepository<Ram, Long> {

    Optional<Ram> findRamByUid(UUID uid);
}
