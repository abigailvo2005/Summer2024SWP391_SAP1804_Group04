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
@Table(name = "Manager")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Manager {
    @Id
    @Column(name = "managerId")
    private String managerId;

    @Column(name = "accountId")
    private int accountId;

    @Column(name = "yearsOfExperience")
    private int yearsOfExperience;
}
