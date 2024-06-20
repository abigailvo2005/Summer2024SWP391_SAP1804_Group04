package com.recs.models.entities.account;

import com.recs.models.entities.recsbusiness.DealAssignMember;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "Agency")
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

    @OneToMany(mappedBy = "agency", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<DealAssignMember> dealAssignMembers;
}
