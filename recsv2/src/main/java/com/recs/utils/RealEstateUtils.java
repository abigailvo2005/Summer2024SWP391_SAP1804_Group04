package com.recs.utils;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;

public class RealEstateUtils {
    
    public static String formatPrice(Long price) {
        if(price < 1_000L) {
            return price + "đ";
        } else if (price < 1_000_000L) {
            if (price % 1000 == 0L) {
                return String.format("%dK", price / 1000);
            } else {
                return NumberFormat.getInstance().format(price).replace(",", ".") + "đ";
            }
        } else if (price < 1_000_000_000L) {
            if (price % 1_000_000 == 0L) {
                return String.format("%dM", price / 1_000_000);
            } else {
                BigDecimal roundingDownNum = new BigDecimal(Long.toString(price)).divide(
                    new BigDecimal("1000000.00"), 1, RoundingMode.DOWN);
                
                return roundingDownNum + "M";
            }   
        } else { 
            if (price % 1_000_000_000 == 0L) {
                return String.format("%dB", price / 1_000_000_000);
            } else {
                BigDecimal roundingDownNum = new BigDecimal(Long.toString(price)).divide(
                    new BigDecimal("1000000000.00"), 0, RoundingMode.DOWN);
                return roundingDownNum + "B";
            }
        }
    }

}
