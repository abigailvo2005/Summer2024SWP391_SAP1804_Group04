package com.recs.repositories.realestate;

import com.recs.models.entities.realestate.PropertyHouse;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PropertyHouseRepository extends JpaRepository<PropertyHouse, String> {
    public PropertyHouse getByRealEstateId(String id);
}
