package com.recs.repositories.realestate;

import com.recs.models.entities.realestate.PropertyLand;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PropertyLandRepository extends JpaRepository<PropertyLand, String> {
    public PropertyLand getByRealEstateId(String id);
}
