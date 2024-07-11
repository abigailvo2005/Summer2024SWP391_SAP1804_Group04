package com.recs.services.realestaesvc;

import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.CreateRealEstateRequestDTO;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.dto.recsbusiness.AgencyRequestDTO;
import com.recs.models.dto.recsbusiness.BuyerRequestDTO;
import com.recs.models.entities.account.Manager;
import com.recs.models.entities.realestate.PaperWorks;
import com.recs.models.entities.realestate.PropertyHouse;
import com.recs.models.entities.realestate.PropertyImages;
import com.recs.models.entities.realestate.PropertyLand;
import com.recs.models.entities.realestate.RealEstate;
import com.recs.models.entities.recsbusiness.AgencyRequest;
import com.recs.models.enums.AgencyRequestStatus;
import com.recs.models.enums.RealEstateStatus;
import com.recs.repositories.account.ManagerRepository;
import com.recs.repositories.realestate.PaperWorksRepository;
import com.recs.repositories.realestate.PropertyHouseRepository;
import com.recs.repositories.realestate.PropertyImagesRepository;
import com.recs.repositories.realestate.PropertyLandRepository;
import com.recs.repositories.realestate.RealEstateRepository;
import com.recs.repositories.recsbusiness.BuyerRequestRepository;
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
    private BuyerRequestRepository buyerRequestRepository;

    @Autowired
    public RealEstateServiceImpl(
            RealEstateRepository realEstateRepository,
            PropertyHouseRepository propertyHouseRepository,
            PropertyLandRepository propertyLandRepository,
            PropertyImagesRepository propertyImagesRepository,
            PaperWorksRepository paperWorksRepository,
            AccountService accountService,
            ManagerRepository managerRepository,
            BuyerRequestRepository buyerRequestRepository
    ) {
        this.realEstateRepository = realEstateRepository;
        this.propertyHouseRepository = propertyHouseRepository;
        this.propertyLandRepository = propertyLandRepository;
        this.propertyImagesRepository = propertyImagesRepository;
        this.paperWorksRepository = paperWorksRepository;
        this.accountService = accountService;
        this.managerRepository = managerRepository;
        this.buyerRequestRepository = buyerRequestRepository;
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
        UserInfo seller = accountService.getSellerToUserInfo(sellerId);
        List<RealEstateInfo> infoList = mapListToInfoBySeller(list, seller);
        System.out.println("list re by seller "+sellerId+" size "+ infoList.size());
        return infoList;
    }

    @Override
    public List<RealEstateInfo> getValidatingBySeller(String sellerId) {
        List<RealEstate> list = realEstateRepository.findAllBySellerIdAndStatus(sellerId,"Validating");
        UserInfo seller = accountService.getSellerToUserInfo(sellerId);
        List<RealEstateInfo> infoList = mapListToInfoBySeller(list, seller);
        System.out.println("list validating by seller "+sellerId+" size "+ infoList.size());
        return infoList;
    }

    @Override
    public List<RealEstateInfo> getReviewingListByManager(String managerId) {
        List<RealEstate> list = realEstateRepository.findAllByManagerIdAndStatus(managerId, "Reviewing");
        UserInfo manager = accountService.getManagerToUserInfo(managerId);
        List<RealEstateInfo> infoList = mapListToInfoByManager(list, manager);
        System.out.println("list reviewing by manager "+ managerId + "size "+ infoList.size());
        return infoList;
    }

    @Override
    public List<RealEstateInfo> getValidatingListByManager(String managerId) {
        List<RealEstate> list = realEstateRepository.findAllByManagerIdAndStatus(managerId, "Validating");
        UserInfo manager = accountService.getManagerToUserInfo(managerId);
        List<RealEstateInfo> infoList = mapListToInfoByManager(list, manager);
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
            info.setManagerInfo(manager);
            info.setSellerInfo(seller);
        }

        List<BuyerRequestDTO> buyerRequests = buyerRequestRepository.findAllByRealEstateRealEstateId(realEstateId)
                .stream().map(BuyerRequestDTO::from).toList();

        List<PropertyImages> propertyImages = propertyImagesRepository.findAllByRealEstateId(realEstateId);

        List<String> images = propertyImages != null ? propertyImages.stream()
                .map(PropertyImages::getUrl).toList()
                : List.of();
        String paperWorks = paperWorksRepository.getReferenceById(realEstateId)
                .getUrl();

        System.out.println("Real estate info: "+info);
        return info.toBuilder()
                .setPropertyImagesList(images)
                .setPaperWorks(paperWorks)
                .setAgencyRequests(
                        realEstate.getAgencyRequests().stream()
                                .map(AgencyRequestDTO::from)
                                .sorted(Comparator.comparing(AgencyRequestDTO::getStatus))
                                .toList()
                )
                .setBuyerRequest(buyerRequests)
                .build();
    }

    @Override
    public RealEstate createRealEstate(String sellerId, CreateRealEstateRequestDTO request) {
        RealEstate realEstate = convertToRealEstate(sellerId, request);
        System.out.println("realEstate entity: "+ realEstate);

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
                realEstate.getRealEstateType() == 1 ? request.getLandPw() : request.getHomePw()
                );

        List<PropertyImages> images = request.getImages().stream().map( image ->
                        new PropertyImages("", realEstate.getRealEstateId(), image))
                .toList();

        propertyImagesRepository.saveAll(images);

        System.out.println("paperwork: "+ paperWorks);
        paperWorksRepository.save(paperWorks);
        return realEstate;
    }

    @Override
    public RealEstate update(RealEstate realEstate) {
        return realEstateRepository.save(realEstate);
    }

    @Override
    public RealEstate updateStatus(String realEstateId, RealEstateStatus status, String noteMsg) {
        RealEstate realEstate = realEstateRepository.getReferenceById(realEstateId);
        if(realEstate != null) {
            realEstate.setStatus(status.getValue());
            realEstate.setUpdateTimestamp(Clock.systemUTC().millis());
            realEstate.setNoteMsg(noteMsg);
            realEstateRepository.save(realEstate);
        }
        return realEstate;
    }

    @Override
    public PaperWorks updatePaperWork(String realEstateID, String url) {
        PaperWorks ppw = paperWorksRepository.getReferenceById(realEstateID);
        RealEstate realEstate = realEstateRepository.getReferenceById(realEstateID);
        if(ppw != null) {
            realEstate.setStatus(RealEstateStatus.REVIEWING.getValue());
            ppw.setUrl(url);
            paperWorksRepository.save(ppw);
        }
        return ppw;      
    }

    @Override
    public List<RealEstateInfo> getAllByStatus(String status) {
        List<RealEstate> realEstates = realEstateRepository.findAllByStatus(status);
        return mapListToInfo(realEstates);
    }

    @Override
    public List<RealEstateInfo> getListing(String agencyId) {
        List<RealEstate> realEstates = realEstateRepository
                .findAllByStatusIn(
                        List.of(
                                RealEstateStatus.DISPLAYED.getValue(),
                                RealEstateStatus.AGENCY_APPROVING.getValue()
                        ))
                .stream().filter(realEstate -> {
                    if(RealEstateStatus.DISPLAYED.getValue().equals(realEstate.getStatus()))
                        return true;
                    return checkAgency(realEstate, agencyId);
                })
                .toList();
        return mapListToInfo(realEstates);
    }

    @Override
    public List<RealEstateInfo> getAllBySellerIdAndStatus(String sellerId, String status) {
        List<RealEstate> list = realEstateRepository.findAllBySellerIdAndStatus(sellerId,status);
        return mapListToInfo(list);
    }

    @Override
    public void deleteRealEstate(String realEstateId) {
        paperWorksRepository.deleteById(realEstateId);
        RealEstate realEstate = realEstateRepository.getReferenceById(realEstateId);
        if(realEstate.getRealEstateType() == 1) {
            PropertyLand land = propertyLandRepository.getByRealEstateId(realEstateId);
            propertyLandRepository.delete(land);
        } else {
            PropertyHouse house = propertyHouseRepository.getByRealEstateId(realEstateId);
            propertyHouseRepository.delete(house);
        }
        realEstateRepository.delete(realEstate);
    }

    public boolean checkAgency(RealEstate realEstate, String agencyId) {
        List<String> agencyIds = realEstate.getAgencyRequests().stream()
                .filter(request -> !request.getStatus().equals(AgencyRequestStatus.DROPPED.getValue()))
                .map(request -> request.getAgency().getAgencyId())
                .toList();
        return !agencyIds.contains(agencyId);
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
                RealEstateStatus.CREATED.getValue(),
                0,
                Clock.systemUTC().millis(),
                Clock.systemUTC().millis(),
                sellerId,
                getSuitableManager(),
                StringUtils.EMPTY,
                List.of(),
                List.of(),
                List.of()
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
                    UserInfo sellerInfo = accountService.getSellerToUserInfo(realEstate.getSellerId());
                    UserInfo managerInfo = accountService.getManagerToUserInfo(realEstate.getManagerId());
                    List<PropertyImages> images = propertyImagesRepository.findAllByRealEstateId(realEstate.getRealEstateId());
                    PaperWorks paperWorks = paperWorksRepository.getReferenceById(realEstate.getRealEstateId());
                    return RealEstateInfo.fromRealEstate(realEstate)
                            .toBuilder()
                            .setSellerInfo(sellerInfo)
                            .setManagerInfo(managerInfo)
                            .setPropertyImagesList(
                                    images.stream().map(PropertyImages::getUrl).toList()
                            )
                            .setPaperWorks(
                                    paperWorks.getUrl()
                            )
                            .setAgencyRequests(
                                    realEstate.getAgencyRequests().stream()
                                            .map(AgencyRequestDTO::from)
                                            .sorted(Comparator.comparing(AgencyRequestDTO::getStatus))
                                            .toList()
                            )
                            .build();
                })
                .sorted(
                        Comparator.comparing(RealEstateInfo::getCreateTimestamp)
                        .reversed()
                )
                .toList();
    }
    private List<RealEstateInfo> mapListToInfoBySeller(List<RealEstate> list, UserInfo sellerInfo) {
        if (list.isEmpty()) return List.of();
        UserInfo managerInfo = accountService.getManagerToUserInfo(list.get(0).getManagerId());
        return list.stream().map(realEstate -> {
                    return RealEstateInfo.fromRealEstate(realEstate)
                            .toBuilder()
                            .setSellerInfo(sellerInfo)
                            .setManagerInfo(managerInfo)
                            .setAgencyRequests(
                                    realEstate.getAgencyRequests().stream()
                                            .map(AgencyRequestDTO::from)
                                            .sorted(Comparator.comparing(AgencyRequestDTO::getStatus))
                                            .toList()
                            )
                            .build();
                })
                .sorted(
                        Comparator.comparing(RealEstateInfo::getCreateTimestamp)
                        .reversed()
                )
                .toList();
    }

    private List<RealEstateInfo> mapListToInfoByManager(List<RealEstate> list, UserInfo managerInfo) {
        return list.stream().map(realEstate -> {
                    UserInfo sellerInfo = accountService.getSellerToUserInfo(realEstate.getSellerId());
                    return RealEstateInfo.fromRealEstate(realEstate)
                            .toBuilder()
                            .setSellerInfo(sellerInfo)
                            .setManagerInfo(managerInfo)
                            .setAgencyRequests(
                                    realEstate.getAgencyRequests().stream()
                                            .map(AgencyRequestDTO::from)
//                                            .filter(request -> request.getStatus().equals(
//                                                    AgencyRequestStatus.REVIEWING.getValue()
//                                            )) //rat can cho nay
                                            .sorted(Comparator.comparing(AgencyRequestDTO::getStatus))
                                            .toList()
                            )
                            .build();
                })
                .sorted(
                        Comparator.comparing(RealEstateInfo::getCreateTimestamp)
                        .reversed())
                .toList();
    }    
}
