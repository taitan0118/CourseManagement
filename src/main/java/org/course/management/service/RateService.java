package org.course.management.service;

import org.course.management.entity.Rate;

import java.util.List;

public interface RateService {
    List<Rate> getAllRate();

    Rate doSaveRate(Rate rate);

    List<Rate> getByRateId(Integer rateId);

    void doGetDelete(int id);

}

