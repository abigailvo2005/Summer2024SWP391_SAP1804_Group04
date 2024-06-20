package com.recs.models.entities.recsbusiness;

import com.recs.models.entities.account.Agency;
import com.recs.models.entities.account.Member;
import com.recs.models.entities.realestate.RealEstate;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "DealAssignMember")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DealAssignMember {
    @Id
    @Column(name = "dealId")
    private String dealId;

    @Column(name = "createTimestamp")
    private Long createTimestamp;

    @Column(name = "priority")
    private Integer priority;

    @Column(name = "status", length = 16)
    private String status;

//    @Column(name = "memberId", insertable=false, updatable=false)
//    private String memberId;

//    @Column(name = "agencyId", insertable=false, updatable=false)
//    private String agencyId;

//    @Column(name = "realEstateId", insertable=false, updatable=false)
//    private String realEstateId;

    @ManyToOne
    @JoinColumn(name = "agencyId", nullable = false)
    private Agency agency;

    @ManyToOne
    @JoinColumn(name = "memberId", nullable = false)
    private Member member;

    @ManyToOne
    @JoinColumn(name = "realEstateId")
    private RealEstate realEstate;
}
