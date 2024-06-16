package com.recs.models.dto.realestate;

import com.recs.models.entities.realestate.RealEstate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreateRealEstateRequestDTO {
    private String name;
    private String address;
    private String description;
    private Double area;
    private Long price;
    private List<MultipartFile> images;
    private String propertyType;
    private String landCategory;
    private String paperwork;
    private String houseCategory;
    private int builtYear;
    private int bedrooms;
    private int bathrooms;

}
