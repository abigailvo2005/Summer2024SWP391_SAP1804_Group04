package com.recs.repositories.account;

import com.recs.models.entities.account.Manager;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ManagerRepository extends JpaRepository<Manager, String> {
    Manager findByAccountId(int accountId);

    @Query("SELECT m FROM Manager m JOIN Account a ON s.accountId = a.accountId WHERE m.username = :username")
    Manager findByAccountUsername(@Param("username") String username);
}
