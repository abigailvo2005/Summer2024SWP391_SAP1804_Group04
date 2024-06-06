package com.recs.services.realestaesvc;

import com.recs.models.dto.realestate.CreateRealEstateRequestDTO;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.entities.realestate.RealEstate;

import java.util.List;

public interface RealEstateService {

    public List<RealEstate> getAllRealEstate();

    public RealEstate getById(String realEstateId);

    public RealEstate create(RealEstate realEstate);

    public RealEstate update(String realEstateId, RealEstate realEstate);

    public List<RealEstate> getAllBySeller(String sellerId);

    public List<RealEstate> getValidatingBySeller(String sellerId);

    public List<RealEstate> getReviewingListByManager(String managerId);

    public List<RealEstate> getValidatingListByManager(String managerId);

//    List<RealEstate> getListByManager(String managerId);

    public RealEstateInfo getRealEstateInfo(String realEstateId);

    public RealEstate createRealEstate(String sellerId, CreateRealEstateRequestDTO request);

    public RealEstate update(RealEstate realEstate);

    public RealEstate updateStatus(String realEstateId, String status);
}
