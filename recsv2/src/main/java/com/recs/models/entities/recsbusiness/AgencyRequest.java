package com.recs.models.entities.recsbusiness;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.recs.models.entities.account.Agency;
import com.recs.models.entities.realestate.RealEstate;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Table;

@Entity
@Table(name = "AgencyRequest")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AgencyRequest {
    @Id
    @Column(name = "requestId")
    private String requestId;

    @Column(name = "createTimestamp")
    private long createTimestamp;

    @Column(name = "status")
    private String status;

    @Column(name = "message")
    private String message;

    @ManyToOne
    @JoinColumn(name = "agencyId")
    private Agency agency;

    @ManyToOne
    @JoinColumn(name = "realEstateId")
    private RealEstate realEstate;
}
