package com.recs.repositories.account;

import com.recs.models.entities.account.Manager;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ManagerRepository extends JpaRepository<Manager, String> {
    Manager findByAccountId(int accountId);
}
