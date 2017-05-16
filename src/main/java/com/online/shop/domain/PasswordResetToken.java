package com.online.shop.domain;

import org.springframework.security.core.userdetails.User;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Razvan on 5/7/2017.
 */
@Entity
public class PasswordResetToken {

    private static final int EXPIRATION = 60 * 24;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String token;

    @OneToOne(targetEntity = UserAccount.class, fetch = FetchType.EAGER)
    @JoinColumn(nullable = false, name = "id")
    private User user;

    private Date expiryDate;
}
