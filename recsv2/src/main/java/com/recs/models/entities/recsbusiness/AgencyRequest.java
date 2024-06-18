package com.recs.models.entities.recsbusiness;

import com.recs.models.entities.account.Agency;
import com.recs.models.entities.realestate.RealEstate;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Table;

@Entity
@Table(name = "AgencyRequest")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AgencyRequest {
    @Id
    @Column(name = "requestId")
    private String requestId;

    @Column(name = "createTimestamp")
    private long createTimestamp;

    @Column(name = "status", length = 16)
    private String status;

    @Column(name = "agencyId")
    private String agencyId;

    @Column(name = "realEstateId", insertable=false, updatable=false)
    private String realEstateId;

    @ManyToOne
    @JoinColumn(name = "agencyId", insertable=false, updatable=false)
    private Agency agency;

    @ManyToOne
    @JoinColumn(name = "realEstateId")
    private RealEstate realEstate;
}
