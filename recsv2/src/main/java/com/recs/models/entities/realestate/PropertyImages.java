package com.recs.models.entities.realestate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "PropertyImages")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PropertyImages {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private String imageId;

    private String realEstateId;
    private String url;

}
