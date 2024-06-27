package com.recs.models.enums;

public enum DealAssignMemberStatus {
    UNKNOWN(""),
    ASSIGNED("Assigned"),
    REVIEWING("Reviewing"),
    CANCELLED("Cancelled"),
    CLOSED("Closed");

    private final String value;

    DealAssignMemberStatus(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public static DealAssignMemberStatus from(String status){
        for (DealAssignMemberStatus j : DealAssignMemberStatus.values()){
            if(j.value.equals(status))
                return j;
        }
        return UNKNOWN;
    }

    @Override
    public String toString() {
        return value;
    }
}
