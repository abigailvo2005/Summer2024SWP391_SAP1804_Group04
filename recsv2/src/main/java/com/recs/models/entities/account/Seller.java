package com.recs.models.entities.account;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "Seller")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Seller {
    @Id
    @Column(name = "sellerId")
    private String sellerId;

    @Column(name = "accountId")
    private int accountId;

    @Column(name = "company")
    private String company;
}
