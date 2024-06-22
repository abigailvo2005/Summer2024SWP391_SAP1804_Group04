package com.recs.repositories.account;

import com.recs.models.entities.account.Agency;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AgencyRepository extends JpaRepository<Agency, String> {
    Agency findByAccountAccountId(int accountId);
}
