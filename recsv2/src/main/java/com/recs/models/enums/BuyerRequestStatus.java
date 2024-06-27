package com.recs.models.enums;

public enum BuyerRequestStatus {
    UNKNOWN(""),
    REVIEWING("Reviewing"),
    ACCEPTED("Accepted"),
    CONNECTED("Connected"),
    DENIED("Denied");

    private final String value;

    BuyerRequestStatus(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public static BuyerRequestStatus from(String status){
        for (BuyerRequestStatus j : BuyerRequestStatus.values()){
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
