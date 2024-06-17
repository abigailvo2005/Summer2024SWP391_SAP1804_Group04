package com.recs.models.dto.realestate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreateRealEstateRequestDTO {
    private String name = StringUtils.EMPTY;
    private String address = StringUtils.EMPTY;
    private String description = StringUtils.EMPTY;
    private Double area = 0.0;
    private Long price = 0L;
    private List<String> images = List.of();
    private String propertyType = StringUtils.EMPTY;
    private String landCategory = StringUtils.EMPTY;
    private String homePw = StringUtils.EMPTY;
    private String landPw = StringUtils.EMPTY;
    private String houseCategory = StringUtils.EMPTY;
    private int builtYear = 0;
    private int bedrooms = 0;
    private int bathrooms = 0;

}
