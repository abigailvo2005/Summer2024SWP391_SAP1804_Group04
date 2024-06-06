package com.recs.repositories.account;

import com.recs.models.entities.account.Member;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, String> {
    Member findByAccountId(int accountId);
}
