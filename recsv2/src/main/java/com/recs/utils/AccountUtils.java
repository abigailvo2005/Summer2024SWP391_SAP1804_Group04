package com.recs.utils;

import com.recs.models.entities.account.Account;
import com.recs.repositories.account.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.Normalizer;
import java.util.List;
import java.util.regex.Pattern;

public class AccountUtils {
    @Autowired
    private static AccountRepository accountRepository;

    public static String generateUsername(String fullName) {
        String username = combinedName(fullName);
        List<Account> list = accountRepository.findAll().stream().filter(account -> {
            return account.getUsername().contains(username);
        }).toList();
        if(list.isEmpty()) {
            return username;
        }
        else return username + list.size();
    }

    private static String combinedName(String fullName) {
        String[] nameSplit = removeNameSign(fullName).toLowerCase().trim().split(" ");
        String firstName = nameSplit[nameSplit.length - 1];
        String lastName = nameSplit[0];
        return firstName + "." + lastName;
    }

    private static String removeNameSign(String name) {
        String temp = Normalizer.normalize(name, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        temp = pattern.matcher(temp).replaceAll("");
        return temp.replaceAll("đ", "d");
    }
}
