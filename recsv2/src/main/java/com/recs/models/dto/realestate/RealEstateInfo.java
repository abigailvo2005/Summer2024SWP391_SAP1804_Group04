package com.recs.models.dto.realestate;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.recs.models.dto.account.UserInfo;
import com.recs.models.entities.realestate.PropertyHouse;
import com.recs.models.entities.realestate.PropertyImages;
import com.recs.models.entities.realestate.PropertyLand;
import com.recs.models.entities.realestate.RealEstate;
import com.recs.utils.RealEstateUtils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class RealEstateInfo {
    private String realEstateId;
    private String name;
    private String realEstateType;
    private String description;
    private String address;
    private double area;
    private long price;
    private String textPrice;
    private String status;
    private int displayable;
    private long createTimestamp;
    private String createDate;
    private long updateTimestamp;

    private UserInfo managerInfo;
    private UserInfo sellerInfo;

    private PropertyHouse propertyHouse;
    private PropertyLand propertyLand;
    private List<PropertyImages> propertyImagesList;

    public static RealEstateInfo fromRealEstate(RealEstate realestate) {
        RealEstateInfo realEstateInfo = new RealEstateInfo();

        realEstateInfo.setRealEstateId(realestate.getRealEstateId());
        realEstateInfo.setName(realestate.getName());
        realEstateInfo.setRealEstateType(realestate.getRealEstateType() == 1 ? "land" : "house");
        realEstateInfo.setDescription(realestate.getDescription());
        realEstateInfo.setAddress(realestate.getAddress());
        realEstateInfo.setArea(realestate.getArea());
        realEstateInfo.setPrice(realestate.getPrice());
        realEstateInfo.setTextPrice(RealEstateUtils.formatPrice(realestate.getPrice()));
        realEstateInfo.setStatus(realestate.getStatus());
        realEstateInfo.setDisplayable(realestate.getDisplayable());
        realEstateInfo.setCreateTimestamp(realestate.getCreateTimestamp());
        realEstateInfo.setCreateDate(RealEstateUtils.formatPrice(realestate.getCreateTimestamp()));
        realEstateInfo.setUpdateTimestamp(realestate.getUpdateTimestamp());
        realEstateInfo.setCreateDate(RealEstateUtils.formatPrice(realestate.getUpdateTimestamp()));
        return realEstateInfo;
    }

    public static RealEstateInfo fromLand(RealEstate realEstate, PropertyLand land) {
        RealEstateInfo info = fromRealEstate(realEstate);
        if(land != null){
            info.setPropertyLand(land);
        } else info.setPropertyLand(new PropertyLand());

        return info;
    }

    public static RealEstateInfo fromHouse(RealEstate realEstate, PropertyHouse house) {
        RealEstateInfo info = fromRealEstate(realEstate);
        if(house != null){
            info.setPropertyHouse(house);
        } else info.setPropertyHouse(new PropertyHouse());

        return info;
    }
}
