package com.recs.services.realestaesvc;

import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.CreateRealEstateRequestDTO;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.entities.account.Manager;
import com.recs.models.entities.realestate.PaperWorks;
import com.recs.models.entities.realestate.PropertyHouse;
import com.recs.models.entities.realestate.PropertyImages;
import com.recs.models.entities.realestate.PropertyLand;
import com.recs.models.entities.realestate.RealEstate;
import com.recs.repositories.account.ManagerRepository;
import com.recs.repositories.realestate.PaperWorksRepository;
import com.recs.repositories.realestate.PropertyHouseRepository;
import com.recs.repositories.realestate.PropertyImagesRepository;
import com.recs.repositories.realestate.PropertyLandRepository;
import com.recs.repositories.realestate.RealEstateRepository;
import com.recs.services.accountsvc.AccountService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Clock;
import java.util.Comparator;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.stream.Stream;

@Service
public class RealEstateServiceImpl implements RealEstateService{

    private RealEstateRepository realEstateRepository;
    private PropertyHouseRepository propertyHouseRepository;
    private PropertyLandRepository propertyLandRepository;
    private PropertyImagesRepository propertyImagesRepository;
    private PaperWorksRepository paperWorksRepository;
    private AccountService accountService;
    private ManagerRepository managerRepository;

    @Autowired
    public RealEstateServiceImpl(
            RealEstateRepository realEstateRepository,
            PropertyHouseRepository propertyHouseRepository,
            PropertyLandRepository propertyLandRepository,
            PropertyImagesRepository propertyImagesRepository,
            PaperWorksRepository paperWorksRepository,
            AccountService accountService,
            ManagerRepository managerRepository
    ) {
        this.realEstateRepository = realEstateRepository;
        this.propertyHouseRepository = propertyHouseRepository;
        this.propertyLandRepository = propertyLandRepository;
        this.propertyImagesRepository = propertyImagesRepository;
        this.paperWorksRepository = paperWorksRepository;
        this.accountService = accountService;
        this.managerRepository = managerRepository;
    }

    @Override
    public List<RealEstateInfo> getAllRealEstate() {
        List<RealEstate> list = realEstateRepository.findAll();
        return mapListToInfo(list).stream()
                .sorted(Comparator.comparing(RealEstateInfo::getStatus)
                        .thenComparing(RealEstateInfo::getCreateTimestamp))
                .toList();
    }

    @Override
    public RealEstate getById(String realEstateId) {
        return realEstateRepository.getReferenceById(realEstateId);
    }

    @Override
    public RealEstate create(RealEstate realEstate) {
        return realEstateRepository.save(realEstate);
    }

    @Override
    public RealEstate update(String realEstateId, RealEstate realEstate) {
        return null;
    }

    @Override
    public List<RealEstateInfo> getAllBySeller(String sellerId) {
        List<RealEstate> list = realEstateRepository.findAllBySellerId(sellerId);
        List<RealEstateInfo> infoList = mapListToInfo(list);
        System.out.println("list re by seller "+sellerId+" size "+ infoList.size());
        return infoList;
    }

    @Override
    public List<RealEstateInfo> getValidatingBySeller(String sellerId) {
        List<RealEstate> list = realEstateRepository.findAllBySellerIdAndStatus(sellerId,"validating");
        List<RealEstateInfo> infoList = mapListToInfo(list);
        System.out.println("list validating by seller "+sellerId+" size "+ infoList.size());
        return infoList;
    }

    @Override
    public List<RealEstateInfo> getReviewingListByManager(String managerId) {
        List<RealEstate> list = realEstateRepository.findAllByManagerIdAndStatus(managerId, "reviewing");
        List<RealEstateInfo> infoList = mapListToInfo(list);
        System.out.println("list reviewing by manager "+ managerId + "size "+ infoList.size());
        return infoList;
    }

    @Override
    public List<RealEstateInfo> getValidatingListByManager(String managerId) {
        List<RealEstate> list = realEstateRepository.findAllByManagerIdAndStatus(managerId, "validating");
        List<RealEstateInfo> infoList = mapListToInfo(list);
        System.out.println("list validating by manager "+ managerId + "size "+ infoList.size());
        return infoList;
    }

//    @Override
//    public List<RealEstate> getListByManager(String managerId) {
//        List<RealEstate> list = realEstateRepository.findAllByManagerId(managerId)
//                .stream().sorted(
//                        Comparator.comparing(realEstate -> realEstate.getStatus().equals("reviewing"))
//                ).toList();
//        System.out.println("list re by manager "+managerId+" size "+ list.size());
//        return list;
//    }

    @Override
    public RealEstateInfo getRealEstateInfo(String realEstateId) {
        RealEstate realEstate = realEstateRepository.getReferenceById(realEstateId);
        System.out.println("query real estate response: "+ realEstate);

        RealEstateInfo info = null;

        if(realEstate.getRealEstateType() == 1) {
            PropertyLand land = propertyLandRepository.getByRealEstateId(realEstateId);
            System.out.println("land: "+land);
            info = RealEstateInfo.fromLand(realEstate,land);
        } else if (realEstate.getRealEstateType() == 2) {
            PropertyHouse house = propertyHouseRepository.getByRealEstateId(realEstateId);
            System.out.println("house: "+ house);
            info = RealEstateInfo.fromHouse(realEstate,house);
        } else info = RealEstateInfo.fromRealEstate(realEstate);

        if (info != null) {
            UserInfo manager = accountService.getManagerToUserInfo(realEstate.getManagerId());
            UserInfo seller = accountService.getSellerToUserInfo(realEstate.getSellerId());
            List<PropertyImages> images = propertyImagesRepository.findAllByRealEstateId(realEstateId);
            info.setManagerInfo(manager);
            info.setSellerInfo(seller);
            info.setPropertyImagesList(images == null ? images : List.of());
        }

        System.out.println("Real estate info: "+info);
        return info;
    }

    @Override
    public RealEstate createRealEstate(String sellerId, CreateRealEstateRequestDTO request) {
        RealEstate realEstate = convertToRealEstate(sellerId, request);
        System.out.println("realEstate entity: "+ realEstate);
//        PropertyImages images = realEstate.
        if(realEstate.getRealEstateType() == 1) {
            PropertyLand land = new PropertyLand(
                    UUID.randomUUID().toString(),
                    realEstate.getRealEstateId(),
                    request.getLandCategory()
            );
            System.out.println("land: "+ land);
            realEstateRepository.save(realEstate);
            propertyLandRepository.save(land);
        } else {
            PropertyHouse house = new PropertyHouse(
                    UUID.randomUUID().toString(),
                    realEstate.getRealEstateId(),
                    request.getBedrooms(),
                    request.getBathrooms(),
                    request.getHouseCategory(),
                    request.getBuiltYear()
            );
            System.out.println("house: "+ house);
            realEstateRepository.save(realEstate);
            propertyHouseRepository.save(house);
        }
        PaperWorks paperWorks = new PaperWorks(
                realEstate.getRealEstateId(),
                StringUtils.EMPTY,
                request.getPaperwork()
                );
        System.out.println("paperwork: "+ paperWorks);
        paperWorksRepository.save(paperWorks);
        return realEstate;
    }

    @Override
    public RealEstate update(RealEstate realEstate) {
        //Todo() define list field can update directly
        return null;
    }

    @Override
    public RealEstate updateStatus(String realEstateId, String status) {
        RealEstate realEstate = realEstateRepository.getReferenceById(realEstateId);
        if(realEstate != null) {
            realEstate.setStatus(status);
            realEstate.setUpdateTimestamp(Clock.systemUTC().millis());
            realEstateRepository.save(realEstate);
        }
        return realEstate;
    }

    private RealEstate convertToRealEstate(String sellerId, CreateRealEstateRequestDTO dto) {
        return new RealEstate(
                UUID.randomUUID().toString(),
                dto.getName(),
                dto.getPropertyType().equals("land") ? 1 : 2,
                dto.getDescription(),
                dto.getAddress(),
                dto.getArea(),
                dto.getPrice(),
                "reviewing",
                0,
                Clock.systemUTC().millis(),
                Clock.systemUTC().millis(),
                sellerId,
                getSuitableManager()
                );
    }

    /**
     * Find manager which has the least properties
     * @return managerId
     */
    private String getSuitableManager() {
        List<Manager> list = managerRepository.findAll();
        Manager managerWithMinRe = list.stream().min(Comparator.comparing(
                manager -> realEstateRepository.countByManagerId(manager.getManagerId()
                )
        )).orElse(
                list.get(
                        new Random().nextInt(list.size()
                        )
                ));
        System.out.println("Suitable manager: "+ managerWithMinRe);
        return managerWithMinRe.getManagerId();
    }

    private List<RealEstateInfo> mapListToInfo(List<RealEstate> list) {
        return list.stream().map(realEstate -> {
                    List<PropertyImages> images = propertyImagesRepository.findAllByRealEstateId(realEstate.getRealEstateId());
                    PaperWorks paperWorks = paperWorksRepository.getReferenceById(realEstate.getRealEstateId());
                    if(realEstate.getRealEstateType() == 1 ){
                        PropertyLand land = propertyLandRepository.getByRealEstateId(realEstate.getRealEstateId());
                        return RealEstateInfo.fromLand(realEstate, land)
                                .toBuilder()
                                .setPropertyImagesList(images)
                                .setPaperWorks(paperWorks)
                                .build();
                    } else {
                        PropertyHouse house = propertyHouseRepository.getByRealEstateId(realEstate.getRealEstateId());
                        return RealEstateInfo.fromHouse(realEstate, house)
                                .toBuilder()
                                .setPropertyImagesList(images)
                                .setPaperWorks(paperWorks)
                                .build();
                    }
                })
                .toList();
    }
}
