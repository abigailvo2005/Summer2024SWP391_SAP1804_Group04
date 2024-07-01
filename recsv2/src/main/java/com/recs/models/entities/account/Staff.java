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
@Table(name = "Staff")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Staff {
    @Id
    @Column(name = "staffId")
    private String staffId;

    @Column(name = "accountId")
    private int accountId;

    @Column(name = "managerId")
    private String managerId;

    @Column(name = "numOfProjects")
    private int numOfProjects;
}
