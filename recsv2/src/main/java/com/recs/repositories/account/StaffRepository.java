package com.recs.repositories.account;

import com.recs.models.entities.account.Staff;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface StaffRepository extends JpaRepository<Staff, String> {
    Staff findByAccountId(int accountId);

    @Query("SELECT s FROM Staff s JOIN Account a ON s.accountId = a.accountId WHERE a.username = :username")
    Staff findByAccountUsername(@Param("username") String username);
}
