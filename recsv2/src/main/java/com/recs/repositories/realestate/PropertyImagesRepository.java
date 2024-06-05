package com.recs.repositories.realestate;

import com.recs.models.entities.realestate.PropertyImages;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PropertyImagesRepository extends JpaRepository<PropertyImages, String> {
    public List<PropertyImages> findAllByRealEstateId(String id);
}
