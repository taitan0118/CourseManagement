package org.course.management.controller;import org.springframework.stereotype.Controller;import org.springframework.web.bind.annotation.GetMapping;import org.springframework.web.bind.annotation.RequestMapping;@Controller@RequestMapping("/account")public class LoginController {    @GetMapping("/dang-nhap")    public String ViewDangNhap() {        return "account/signin";    }    @GetMapping("/dang-ky")    public String ViewDangKy() {        return "account/signup";    }    @GetMapping("/quen-mat-khau")    public String ViewQuenMatKhau() {        return "account/forgot";    }}