package com.recs.repositories.account;

import com.recs.models.entities.account.Staff;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface StaffRepository extends JpaRepository<Staff, String> {
    Staff findByAccountId(int accountId);
}
