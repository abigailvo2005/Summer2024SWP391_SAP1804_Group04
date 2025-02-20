package com.recs.models.entities.account;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "Members")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Member {
    @Id
    @Column(name = "memberId")
    private String memberId;

//    @Column(name = "accountId")
//    private int accountId;

//    @Column(name = "company")
//    private String company;

//    @Column(name = "agencyId")
//    private String agencyId;

    @ManyToOne
    @JoinColumn(name = "agencyId")
    private Agency agency;

    @OneToOne
    @JoinColumn(name = "accountId")
    private Account account;

}
