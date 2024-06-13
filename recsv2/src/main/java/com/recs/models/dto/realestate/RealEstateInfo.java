package com.recs.models.dto.realestate;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.recs.models.dto.account.UserInfo;
import com.recs.models.entities.realestate.PaperWorks;
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
public class RealEstateInfo {
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
    private long createTimestamp;
    private String createDate;
    private long updateTimestamp;
    private String updatedDate;


    private UserInfo managerInfo;
    private UserInfo sellerInfo;

    private PropertyHouse propertyHouse;
    private PropertyLand propertyLand;
    private List<PropertyImages> propertyImagesList;
    private PaperWorks paperWorks;
    private String notes;

    private RealEstateInfo(Builder builder) {
        this.realEstateId = builder.realEstateId;
        this.name = builder.name;
        this.realEstateType = builder.realEstateType;
        this.description = builder.description;
        this.address = builder.address;
        this.area = builder.area;
        this.price = builder.price;
        this.textPrice = builder.textPrice;
        this.status = builder.status;
        this.displayable = builder.displayable;
        this.createTimestamp = builder.createTimestamp;
        this.createDate = builder.createDate;
        this.updateTimestamp = builder.updateTimestamp;
        this.updatedDate = builder.updatedDate;
        this.managerInfo = builder.managerInfo;
        this.sellerInfo = builder.sellerInfo;
        this.propertyHouse = builder.propertyHouse;
        this.propertyLand = builder.propertyLand;
        this.propertyImagesList = builder.propertyImagesList;
        this.paperWorks = builder.paperWorks;
    }

    public static class Builder {
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
        private long createTimestamp;
        private String createDate;
        private long updateTimestamp;
        private String updatedDate;

        private UserInfo managerInfo;
        private UserInfo sellerInfo;

        private PropertyHouse propertyHouse;
        private PropertyLand propertyLand;
        private List<PropertyImages> propertyImagesList;
        private PaperWorks paperWorks;
        private String notes;

        public Builder setRealEstateId(String realEstateId) {
            this.realEstateId = realEstateId;
            return this;
        }

        public Builder setName(String name) {
            this.name = name;
            return this;
        }

        public Builder setRealEstateType(String realEstateType) {
            this.realEstateType = realEstateType;
            return this;
        }

        public Builder setDescription(String description) {
            this.description = description;
            return this;
        }

        public Builder setAddress(String address) {
            this.address = address;
            return this;
        }

        public Builder setArea(double area) {
            this.area = area;
            return this;
        }

        public Builder setPrice(long price) {
            this.price = price;
            return this;
        }

        public Builder setTextPrice(String textPrice) {
            this.textPrice = textPrice;
            return this;
        }

        public Builder setStatus(RealEstateStatus status) {
            this.status = status;
            return this;
        }

        public Builder setDisplayable(int displayable) {
            this.displayable = displayable;
            return this;
        }

        public Builder setCreateTimestamp(long createTimestamp) {
            this.createTimestamp = createTimestamp;
            return this;
        }

        public Builder setCreateDate(String createDate) {
            this.createDate = createDate;
            return this;
        }

        public Builder setUpdateTimestamp(long updateTimestamp) {
            this.updateTimestamp = updateTimestamp;
            return this;
        }

        public Builder setUpdatedDate(String updatedDate) {
            this.updatedDate = updatedDate;
            return this;
        }

        public Builder setManagerInfo(UserInfo managerInfo) {
            this.managerInfo = managerInfo;
            return this;
        }

        public Builder setSellerInfo(UserInfo sellerInfo) {
            this.sellerInfo = sellerInfo;
            return this;
        }

        public Builder setPropertyHouse(PropertyHouse propertyHouse) {
            this.propertyHouse = propertyHouse;
            return this;
        }

        public Builder setPropertyLand(PropertyLand propertyLand) {
            this.propertyLand = propertyLand;
            return this;
        }

        public Builder setPropertyImagesList(List<PropertyImages> propertyImagesList) {
            this.propertyImagesList = propertyImagesList;
            return this;
        }

        public Builder setPaperWorks(PaperWorks paperWorks) {
            this.paperWorks = paperWorks;
            return this;
        }

        private Builder setNotes(String notes) {
            this.notes = notes;
            return this;
        }

        public RealEstateInfo build() {
            return new RealEstateInfo(this);
        }
    }

    public static RealEstateInfo fromRealEstate(RealEstate realestate) {
        return new Builder()
                .setRealEstateId(realestate.getRealEstateId())
                .setName(realestate.getName())
                .setRealEstateType(realestate.getRealEstateType() == 1 ? "Land" : "House")
                .setDescription(realestate.getDescription())
                .setAddress(realestate.getAddress())
                .setArea(realestate.getArea())
                .setPrice(realestate.getPrice())
                .setTextPrice(RealEstateUtils.formatPrice(realestate.getPrice()))
                .setStatus(RealEstateStatus.from(realestate.getStatus()))
                .setDisplayable(realestate.getDisplayable())
                .setCreateTimestamp(realestate.getCreateTimestamp())
                .setCreateDate(RealEstateUtils.formatDate(realestate.getCreateTimestamp()))
                .setUpdateTimestamp(realestate.getUpdateTimestamp())
                .setUpdatedDate(RealEstateUtils.formatDate(realestate.getUpdateTimestamp()))
                .setNotes(realestate.getNoteMsg())
                .build();
    }

    public static RealEstateInfo fromLand(RealEstate realEstate, PropertyLand land) {
        Builder builder = fromRealEstate(realEstate).toBuilder();
        builder.setPropertyLand(land != null ? land : new PropertyLand());
        return builder.build();
    }

    public static RealEstateInfo fromHouse(RealEstate realEstate, PropertyHouse house) {
        Builder builder = fromRealEstate(realEstate).toBuilder();
        builder.setPropertyHouse(house != null ? house : new PropertyHouse());
        return builder.build();
    }

    public Builder toBuilder() {
        return new Builder()
                .setRealEstateId(this.realEstateId)
                .setName(this.name)
                .setRealEstateType(this.realEstateType)
                .setDescription(this.description)
                .setAddress(this.address)
                .setArea(this.area)
                .setPrice(this.price)
                .setTextPrice(this.textPrice)
                .setStatus(this.status)
                .setDisplayable(this.displayable)
                .setCreateTimestamp(this.createTimestamp)
                .setCreateDate(this.createDate)
                .setUpdateTimestamp(this.updateTimestamp)
                .setUpdatedDate(this.updatedDate)
                .setManagerInfo(this.managerInfo)
                .setSellerInfo(this.sellerInfo)
                .setPropertyHouse(this.propertyHouse)
                .setPropertyLand(this.propertyLand)
                .setPropertyImagesList(this.propertyImagesList)
                .setPaperWorks(this.paperWorks);
    }

}

