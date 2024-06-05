package com.recs.repositories.account;

import com.recs.models.entities.account.Seller;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SellerRepository extends JpaRepository<Seller, String> {
    Seller findByAccountId(int accountId);

}
