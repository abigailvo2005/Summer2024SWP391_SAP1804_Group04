package com.recs.security;

import com.recs.models.entities.Account;
import com.recs.repositories.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class UserInfoDetailsService implements UserDetailsService {

    @Autowired
    private AccountRepository repository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<Account> info = repository.findByUsername(username);
        System.out.println("User:"+ info);
        return info.map(AccountUserDetails::new)
                .orElseThrow(() ->new UsernameNotFoundException("user not found: "+username));
    }
}
