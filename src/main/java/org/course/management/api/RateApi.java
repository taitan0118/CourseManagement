package org.course.management.api;

import org.course.management.entity.Rate;
import org.course.management.entity.User;
import org.course.management.service.RateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api-rate")
public class RateApi {
    @Autowired
    private RateService rateService;

    @GetMapping("/getAllRate")
    public Object doGetAllRate() {
        Map<String, Object> result = new HashMap<>();
        try {
            result = new HashMap<>();
            result.put("success", true);
            result.put("status", "Call Api success");
            result.put("data", rateService.getAllRate());
        } catch (Exception e) {
            result.put("error", false);
            result.put("status", "Call Api error");
            result.put("data", null);
            System.out.println(e);
        }
        return ResponseEntity.ok(result);
    }

    @PostMapping("/postSaveRate")
    public ResponseEntity<?> doPostSaveRate(@RequestBody Rate rate) {
        Map<String, Object> result = new HashMap<>();
        try {
            result = new HashMap<>();
            result.put("success", true);
            result.put("status", "Call Api success");
            result.put("data", rateService.doSaveRate(rate));
        } catch (Exception e) {
            result.put("error", false);
            result.put("status", "Call Api error");
            result.put("data", null);
            System.out.println(e);
        }
        return ResponseEntity.ok(result);
    }

    @GetMapping("/getRateById/{rateId}")
    public ResponseEntity<?> doGetRateById(@PathVariable Integer rateId) {
        Map<String, Object> result = new HashMap<>();
        try {
            result.put("success", true);
            result.put("status", "Call Api success");
            result.put("data", rateService.getByRateId(rateId));
        } catch (Exception e) {
            result.put("error", false);
            result.put("status", "Call Api error");
            result.put("data", null);
            System.out.println(e);
        }
        return ResponseEntity.ok(result);
    }
    @DeleteMapping("/deleteRateById/{id}")
    public ResponseEntity<?> doDeleteRateById(@PathVariable int id) {
        Map<String, Object> result = new HashMap<>();
        try {
            result.put("success", true);
            result.put("status", "Call Api success");
            rateService.doGetDelete(id);
        } catch (Exception e) {
            result.put("error", false);
            result.put("status", "Call Api error");
            result.put("data", null);
            System.out.println(e);
        }
        return ResponseEntity.ok(result);
    }


}
