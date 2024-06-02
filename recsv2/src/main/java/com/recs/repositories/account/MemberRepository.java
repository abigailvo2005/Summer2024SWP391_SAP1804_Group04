package com.recs.repositories.account;

import com.recs.models.entities.account.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MemberRepository extends JpaRepository<Member, String> {
    Member findByAccountId(int accountId);
}
