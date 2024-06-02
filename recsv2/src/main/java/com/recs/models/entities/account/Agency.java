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
@Table(name = "agency")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Agency {
    @Id
    private String agencyId;

    @Column(name = "accountId")
    private int accountId;

    @Column(name = "company")
    private String company;

    @Column(name = "yearsOfExperience")
    private int yearsOfExperience;

    @Column(name = "completedProject")
    private int completedProject;

    @Column(name = "description")
    private String description;
}
