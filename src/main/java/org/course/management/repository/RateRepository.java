package org.course.management.repository;

import org.course.management.entity.Rate;
import org.course.management.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RateRepository extends JpaRepository <Rate, Integer>{
    @Query("SELECT r FROM Rate r WHERE r.rateId = :rateId")
    List<Rate> findByRateId(@Param("rateId") Integer rateId);
}
