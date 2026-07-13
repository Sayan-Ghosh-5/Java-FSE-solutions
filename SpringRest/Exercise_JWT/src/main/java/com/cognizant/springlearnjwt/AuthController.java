package com.cognizant.springlearnjwt;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Collections;
import java.util.Date;
import java.util.Map;

@RestController
public class AuthController {

    @GetMapping("/authenticate")
    public ResponseEntity<Map<String, String>> authenticate(@RequestHeader(value = "Authorization", required = false) String authHeader) {
        if (authHeader == null || !authHeader.startsWith("Basic ")) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }

        String base64Credentials = authHeader.substring("Basic ".length()).trim();
        byte[] decodedBytes = Base64.getDecoder().decode(base64Credentials);
        String credentials = new String(decodedBytes, StandardCharsets.UTF_8);
        String[] values = credentials.split(":", 2);

        if (values.length != 2) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }

        String username = values[0];
        String password = values[1];

        if ("user".equals(username) && "pwd".equals(password)) {
            String token = JWT.create()
                .withSubject(username)
                .withIssuedAt(new Date())
                .withExpiresAt(new Date(System.currentTimeMillis() + 3600000))
                .sign(Algorithm.HMAC256("secret"));
            return ResponseEntity.ok(Collections.singletonMap("token", token));
        }

        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
    }
}
