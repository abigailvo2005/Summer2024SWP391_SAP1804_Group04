package com.recs.repositories;

import com.recs.models.entities.Account;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AccountRepository extends JpaRepository<Account, String> {

    Account getByUsername(String username);
    Optional<Account> findByUsername(String username);
}
