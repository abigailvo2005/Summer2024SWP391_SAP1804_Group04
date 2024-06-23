package com.recs.services.realestaesvc;

import com.recs.models.dto.realestate.CreateRealEstateRequestDTO;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.entities.realestate.PaperWorks;
import com.recs.models.entities.realestate.RealEstate;
import com.recs.models.enums.RealEstateStatus;

import java.util.List;

public interface RealEstateService {

    public List<RealEstateInfo> getAllRealEstate();

    public RealEstate getById(String realEstateId);

    public RealEstate create(RealEstate realEstate);

    public RealEstate update(String realEstateId, RealEstate realEstate);

    public List<RealEstateInfo> getAllBySeller(String sellerId);

    public List<RealEstateInfo> getValidatingBySeller(String sellerId);

    public List<RealEstateInfo> getReviewingListByManager(String managerId);

    public List<RealEstateInfo> getValidatingListByManager(String managerId);

//    List<RealEstate> getListByManager(String managerId);

    public RealEstateInfo getRealEstateInfo(String realEstateId);

    public RealEstate createRealEstate(String sellerId, CreateRealEstateRequestDTO request);

    public RealEstate update(RealEstate realEstate);

    public RealEstate updateStatus(String realEstateId, RealEstateStatus status, String noteMsg);

    public PaperWorks updatePaperWork(String realEstateID, String url);

    public List<RealEstateInfo> getAllByStatus(String status);

    public List<RealEstateInfo> getListing(String agencyId);
}
