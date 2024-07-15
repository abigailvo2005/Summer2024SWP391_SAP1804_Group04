package com.recs.repositories.account;

import com.recs.models.entities.account.Account;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface AccountRepository extends JpaRepository<Account, String> {
    Account getByUsername(String username);
    Optional<Account> findByUsername(String username);
    Optional<Account> findByUsernameOrEmail(String username, String email);
    List<Account> findByStatus(String status);
    List<Account> findByRoleId(String roleId);
    Account findByResetToken(String token);
    List<Account> getAllByEmail(String email);
}
