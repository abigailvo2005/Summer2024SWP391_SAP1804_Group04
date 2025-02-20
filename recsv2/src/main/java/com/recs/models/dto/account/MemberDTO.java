package com.recs.models.dto.account;

import com.recs.models.entities.account.Account;
import com.recs.models.entities.account.Member;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
    private String memberId;
    private String username;
    private String fullName;
    private String phone;
    private String email;
    private AgencyDTO agency;
    private Account account;

    public static MemberDTO from(Member member) {
        return new MemberDTO(
                member.getMemberId(),
                member.getAccount().getUsername(),
                member.getAccount().getFullName(),
                member.getAccount().getPhone(),
                member.getAccount().getEmail(),
                AgencyDTO.from(member.getAgency()),
                member.getAccount()
        );
    }
}
