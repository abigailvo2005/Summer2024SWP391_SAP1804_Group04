package com.recs.models.entities.realestate;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Paperworks")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaperWorks {
    @Id
    private String realEstateId;
    private String name;
    private String url;


}
