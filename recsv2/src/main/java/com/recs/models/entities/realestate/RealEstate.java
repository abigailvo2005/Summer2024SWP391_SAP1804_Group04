package com.recs.models.entities.realestate;

import com.recs.models.entities.recsbusiness.AgencyRequest;
import com.recs.models.entities.recsbusiness.BuyerRequest;
import com.recs.models.entities.recsbusiness.DealAssignMember;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;


@Entity
@Table(name = "RealEstate")
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = {"buyerRequests"})
public class RealEstate {
    @Id
    @Column(name = "realEstateId")
    private String realEstateId;

    @Column(name = "name")
    private String name;

    @Column(name = "realEstateType")
    private Integer realEstateType;

    @Column(name = "description")
    private String description;

    @Column(name = "address")
    private String address;

    @Column(name = "area")
    private Double area;

    @Column(name = "price")
    private Long price;

    @Column(name = "status")
    private String status;

    @Column(name = "displayable")
    private Integer displayable;

    @Column(name = "createTimestamp")
    private Long createTimestamp;

    @Column(name = "updateTimestamp")
    private Long updateTimestamp;

    @Column(name = "sellerId")
    private String sellerId;

    @Column(name = "managerId")
    private String managerId;

    @Column(name = "noteMsg")
    private String noteMsg;

    @OneToMany(mappedBy = "realEstate", cascade = CascadeType.ALL)
    private List<AgencyRequest> agencyRequests = List.of();

    @OneToMany
    @JoinColumn(name = "realEstateId")
    private List<PropertyImages> images = List.of();

    @OneToMany(mappedBy = "realEstate")
    private List<BuyerRequest> buyerRequests = List.of();
}
