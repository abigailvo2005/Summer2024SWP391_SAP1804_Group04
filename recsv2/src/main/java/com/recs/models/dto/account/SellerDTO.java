package com.recs.models.dto.account;

import com.recs.models.entities.account.Account;
import com.recs.models.entities.account.Seller;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class SellerDTO {
    private Account account;
    private String sellerId;
    private String company;

    public SellerDTO from(Account account, Seller seller) {
        return new SellerDTO(account, seller.getSellerId(), seller.getCompany());
    }

    public Seller toSeller(){
        return new Seller(sellerId, account.getAccountId(), company);
    }
}
