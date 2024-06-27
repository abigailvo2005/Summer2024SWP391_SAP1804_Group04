package com.recs.models.enums;

public enum RealEstateStatus {
    UNKNOWN(""),
    REVIEWING("Reviewing"),
    VALIDATING("Validating"),
    UNQUALIFIED("Unqualified"),
    DISPLAYED("Displayed"),
    AGENCY_APPROVING("Agency Approving"),
    HANDLED("Handled"),
    MARKETED("Marketed"),
    BUYER_APPROVING("Buyer Approving"),
    CONNECTED("Connected"),
    CLOSED("Closed");

    private final String value;

    RealEstateStatus(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public static RealEstateStatus from(String status) {
        for (RealEstateStatus re : RealEstateStatus.values()){
            if(re.value.equals(status))
                return re;
        }
        return UNKNOWN;
    }

    public static RealEstateStatus fromJobStatus(JobStatus jobStatus) {
        if(jobStatus == JobStatus.SUCCESSFUL){
            return DISPLAYED;
        } else if (jobStatus == JobStatus.FAIL) {
            return UNQUALIFIED;
        }
        else return UNKNOWN;
    }

    @Override
    public String toString() {
        return value;
    }
}
