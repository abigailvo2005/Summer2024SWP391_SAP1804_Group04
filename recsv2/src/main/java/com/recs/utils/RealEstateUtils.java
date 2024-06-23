package com.recs.utils;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class RealEstateUtils {

    public static String formatDate(Long timestamp) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDateTime dateTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(timestamp), ZoneId.systemDefault());
        return dateTime.format(formatter);
    }
    
    public static String formatPrice(Long price) {
        if(price < 1_000L) {
            return price + "";
        } else if (price < 1_000_000L) {
            if (price % 1000 == 0L) {
                return String.format(price/1000 + ".000");
            } else {
                return NumberFormat.getInstance().format(price).replace(",", ".");
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
                    new BigDecimal("1000000000.00"), 1, RoundingMode.DOWN);
                return roundingDownNum + "B";
            }
        }
    }

}
