package com.recs.models.entities.account;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Table;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Account")
public class Account {

    @Id
    @Column(name = "accountId")
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int accountId;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String accountPassword;

    @Column(name = "roleId")
    private String roleId;

    @Column(name = "fullName")
    private String fullName;

    @Column(name = "gender")
    private int gender;

    @Temporal(TemporalType.DATE)
    @Column(name = "birthDate")
    private String birthDate;

    @Column(name = "email")
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "address")
    private String address;

    @Column(name = "idCard")
    private String idCard;

    @Column(name = "status")
    private String status;

    @Column(name = "resetToken")
    private String resetToken;
}
