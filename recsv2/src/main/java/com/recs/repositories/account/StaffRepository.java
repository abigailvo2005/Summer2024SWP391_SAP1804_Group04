package com.recs.repositories.account;

import com.recs.models.entities.account.Staff;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StaffRepository extends JpaRepository<Staff, String> {
    Staff findByAccountId(int accountId);
}
