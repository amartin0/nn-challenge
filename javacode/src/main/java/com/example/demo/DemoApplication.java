package com.example.demo;

import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.web.bind.annotation.*;

@RestController
@SpringBootApplication
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @GetMapping("/")
    public String hello() {
        // Read environment variables passed from Helm
        String tag = System.getenv("IMAGE_TAG");
        String digest = System.getenv("IMAGE_DIGEST");

        return "¡Hola mundo desde Spring Boot!<br>" +
               "Tag de la imagen: " + (tag != null ? tag : "no especificado") + "<br>" +
               "Digest de la imagen: " + (digest != null ? digest : "no especificado");
    }
}
