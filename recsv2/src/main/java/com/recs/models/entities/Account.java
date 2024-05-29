package com.recs.models.entities;

import jakarta.persistence.*;
import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Account")
public class Account {

    @Id
    @Column(name = "accountId")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
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


}
