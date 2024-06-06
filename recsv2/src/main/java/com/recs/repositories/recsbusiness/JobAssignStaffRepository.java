package com.recs.repositories.recsbusiness;

import com.recs.models.entities.recsbusiness.AssignJobStaff;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface JobAssignStaffRepository extends JpaRepository<AssignJobStaff, String> {
    AssignJobStaff getByRealEstateId(String realEstateId);
    List<AssignJobStaff> findAllByStaffId(String staffId);
    List<AssignJobStaff> findAllByManagerId(String managerId);
    List<AssignJobStaff> findAllByStaffIdAndStatus(String staffId, String status);
    List<AssignJobStaff> findAllByManagerIdAndStatus(String managerId, String status);
}
