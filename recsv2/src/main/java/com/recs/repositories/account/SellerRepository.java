package com.recs.repositories.account;

import com.recs.models.entities.account.Seller;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface SellerRepository extends JpaRepository<Seller, String> {
    Seller findByAccountId(int accountId);

    @Query("SELECT s FROM Seller s JOIN Account a ON s.accountId = a.accountId WHERE a.username = :username")
    Seller findByAccountUsername(@Param("username") String username);

}
