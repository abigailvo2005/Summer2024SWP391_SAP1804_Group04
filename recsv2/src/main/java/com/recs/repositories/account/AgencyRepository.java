package com.recs.repositories.account;

import com.recs.models.entities.account.Agency;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AgencyRepository extends JpaRepository<Agency, String> {
    Agency findByAccountId(int accountId);

    @Query("SELECT ag FROM Agency ag JOIN Account a ON ag.accountId = a.accountId WHERE ag.username = :username")
    Agency findByAccountUsername(@Param("username") String username);
}
