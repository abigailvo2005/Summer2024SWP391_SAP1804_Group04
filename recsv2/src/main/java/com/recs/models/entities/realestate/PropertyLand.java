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
@Table(name = "PropertyLand")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PropertyLand {
    @Id
    private String landId;
    private String realEstateId;
    private String landType;


}
