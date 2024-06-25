package com.recs.repositories.account;

import com.recs.models.entities.account.Member;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MemberRepository extends JpaRepository<Member, String> {
    Member findByAccountAccountId(int accountId);
    List<Member> findAllByAgencyAgencyId(String agencyId);
}
