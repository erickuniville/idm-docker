package com.fluig.docker.imagedemo.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping(path = "/hello")
    public String hello() {
        InetAddress ip = null;
        try {
            ip = InetAddress.getLocalHost();
            System.out.println("Hello. Your current host/IP address : " + ip);
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        return "Hello " + ip;
    }

}
