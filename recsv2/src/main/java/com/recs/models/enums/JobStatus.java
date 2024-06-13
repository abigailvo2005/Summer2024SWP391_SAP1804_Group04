package com.recs.models.enums;

public enum JobStatus {
    UNKNOWN(""),
    ASSIGNED("Assigned"),
    SUCCESSFUL("Successful"),
    FAIL("Fail");

    private final String value;

    JobStatus(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public static JobStatus from(String status){
        for (JobStatus j : JobStatus.values()){
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
