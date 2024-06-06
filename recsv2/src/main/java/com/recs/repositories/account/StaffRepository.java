package com.recs.repositories.account;

import com.recs.models.entities.account.Staff;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StaffRepository extends JpaRepository<Staff, String> {
    Staff findByAccountId(int accountId);
    List<Staff> findAllByManagerId(String managerId);
}
