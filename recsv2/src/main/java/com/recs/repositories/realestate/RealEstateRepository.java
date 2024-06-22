package com.recs.repositories.realestate;

import com.recs.models.entities.realestate.RealEstate;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RealEstateRepository extends JpaRepository<RealEstate, String> {
    public List<RealEstate> findAllByManagerId(String managerId);

    public List<RealEstate> findAllBySellerId(String sellerId);

    public List<RealEstate> findAllBySellerIdAndStatus(String sellerId, String status);

    public List<RealEstate> findAllByManagerIdAndStatus(String managerId, String status);

    public long countByManagerId(String managerId);

    public List<RealEstate> findAllByStatus(String status);

    public List<RealEstate> findByRealEstateId(String realEstateId);

}
