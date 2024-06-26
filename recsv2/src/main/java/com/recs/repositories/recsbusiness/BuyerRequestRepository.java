package com.recs.repositories.recsbusiness;

import com.recs.models.entities.recsbusiness.BuyerRequest;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BuyerRequestRepository extends JpaRepository<BuyerRequest, String> {
    List<BuyerRequest> findAllByMemberMemberId(String memberId);
    List<BuyerRequest> findAllByDealDealId(String dealId);
    List<BuyerRequest> findAllByRealEstateRealEstateId(String realEstateId);
}
