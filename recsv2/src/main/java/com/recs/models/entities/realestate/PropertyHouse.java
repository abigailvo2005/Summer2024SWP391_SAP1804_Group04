package com.recs.models.entities.realestate;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "PropertyHouse")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PropertyHouse {
    @Id
    private String houseId;
    private String realEstateId;
    private Integer bedroom;
    private Integer bath;
    private String houseType;
    private Integer builtIn;

}
