package com.recs.repositories.account;

import com.recs.models.entities.account.Seller;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface SellerRepository extends JpaRepository<Seller, String> {
    Seller findByAccountId(int accountId);

}
