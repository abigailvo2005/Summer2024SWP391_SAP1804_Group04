package com.recs.models.entities.recsbusiness;

import com.recs.models.entities.account.Member;
import com.recs.models.entities.realestate.RealEstate;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Table(name = "BuyerRequest")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BuyerRequest {
    @Id
    @Column(name = "requestId")
    private String requestId;

    @Column(name = "fullName")
    private String fullName;

    @Column(name = "phoneNumber")
    private String phoneNumber;

    @Column(name = "message")
    private String message;

    @Column(name = "createTimestamp")
    private Long createTimestamp;

    @Column(name = "status")
    private String status;

    @ManyToOne
    @JoinColumn(name = "memberId")
    private Member member;

    @ManyToOne
    @JoinColumn(name = "realEstateId")
    private RealEstate realEstate;

    @ManyToOne
    @JoinColumn(name = "dealId")
    private DealAssignMember deal;
}
