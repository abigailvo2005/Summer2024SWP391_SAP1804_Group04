package com.recs.models.dto.realestate;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.recs.models.entities.realestate.PropertyHouse;
import com.recs.models.entities.realestate.PropertyImages;
import com.recs.models.entities.realestate.PropertyLand;
import com.recs.models.entities.realestate.RealEstate;
import com.recs.models.enums.RealEstateStatus;
import com.recs.utils.RealEstateUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class  RealEstateDTO {
    private String realEstateId;
    private String name;
    private String realEstateType;
    private String description;
    private String address;
    private double area;
    private long price;
    private String textPrice;
    private RealEstateStatus status;
    private int displayable;
    private String createDate;
    private String updatedDate;

    private PropertyHouse propertyHouse;
    private PropertyLand propertyLand;
    private List<String> images;
    private String paperWorks;

    public static RealEstateDTO fromRealEstate(RealEstate realEstate) {
        RealEstateDTO realEstateInfo = new RealEstateDTO();
        realEstateInfo.setRealEstateId(realEstate.getRealEstateId());
        realEstateInfo.setName(realEstate.getName());
        realEstateInfo.setRealEstateType(realEstate.getRealEstateType() == 1 ? "Land" : "House");
        realEstateInfo.setDescription(realEstate.getDescription());
        realEstateInfo.setAddress(realEstate.getAddress());
        realEstateInfo.setArea(realEstate.getArea());
        realEstateInfo.setPrice(realEstate.getPrice());
        realEstateInfo.setTextPrice(RealEstateUtils.formatPrice(realEstate.getPrice()));
        realEstateInfo.setStatus(RealEstateStatus.from(realEstate.getStatus()));
        realEstateInfo.setDisplayable(realEstate.getDisplayable());
        realEstateInfo.setCreateDate(RealEstateUtils.formatDate(realEstate.getCreateTimestamp()));
        realEstateInfo.setUpdatedDate(RealEstateUtils.formatDate(realEstate.getUpdateTimestamp()));
        realEstateInfo.setImages(realEstate.getImages().stream().map(PropertyImages::getUrl).toList());
        return realEstateInfo;
    }

    public static RealEstateDTO fromLand(RealEstate realEstate, PropertyLand land) {
        RealEstateDTO realEstateInfo = fromRealEstate(realEstate);
        realEstateInfo.setPropertyLand(land);
        return realEstateInfo;
    }

    public static RealEstateDTO fromHouse(RealEstate realEstate, PropertyHouse house) {
        RealEstateDTO realEstateInfo = fromRealEstate(realEstate);
        realEstateInfo.setPropertyHouse(house);
        return realEstateInfo;
    }
}
