package com.recs.models.enums;

public enum AgencyRequestStatus {
    UNKNOWN(""),
    REVIEWING("Reviewing"),
    ACCEPTED("Accepted"),
    DENIED("Denied"),
    PROCESSING("Processing"),
    CLOSED("Closed"),
    DROPPED("Dropped");

    private final String value;

    AgencyRequestStatus(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public static AgencyRequestStatus from(String status){
        for (AgencyRequestStatus j : AgencyRequestStatus.values()){
            if(j.value.equals(status))
                return j;
        }
        return UNKNOWN;
    }

    public RealEstateStatus toRealEstateStatus() {
        if(this == ACCEPTED) return RealEstateStatus.HANDLED;
        else if(this == DENIED || this == REVIEWING || this == DROPPED) return RealEstateStatus.AGENCY_APPROVING;
        return RealEstateStatus.UNKNOWN;
    }

    @Override
    public String toString() {
        return value;
    }
}
