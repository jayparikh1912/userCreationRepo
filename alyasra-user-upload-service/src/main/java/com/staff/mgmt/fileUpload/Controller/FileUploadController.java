package com.staff.mgmt.fileUpload.Controller;

import com.opencsv.bean.CsvToBean;
import com.opencsv.bean.CsvToBeanBuilder;
import com.staff.mgmt.fileUpload.Client.StaffClient;
import com.staff.mgmt.fileUpload.Dto.BasicData;
import com.staff.mgmt.fileUpload.Dto.ItemExcelDto;
import com.staff.mgmt.fileUpload.Dto.StaffDTO;
import com.staff.mgmt.fileUpload.Dto.StaffExcelDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/v1")
public class FileUploadController {
    @Autowired
    private StaffClient staffClient;

    private static final Logger log = LoggerFactory.getLogger(FileUploadController.class);

    @PostMapping(value = "/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public List<StaffDTO> uploadFile(@RequestParam("file") MultipartFile file) throws IOException {
        List<StaffExcelDto> staffList = new ArrayList<>();
        List<StaffDTO> staff = new ArrayList<>();

        try (InputStreamReader reader = new InputStreamReader(file.getInputStream())) {
            CsvToBean<StaffExcelDto> csvToBean = new CsvToBeanBuilder<StaffExcelDto>(reader)
                    .withType(StaffExcelDto.class)
                    .withSeparator(',')
                    .withSkipLines(1)  // Skip header line
                    .build();

            staffList = csvToBean.parse();

            staff = setStaffDetails(staffList);
            staff.forEach(data -> {
                try {
                    staffClient.createStaff(data);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            });
        } catch (Exception e) {
            log.error("Error parsing CSV file: ", e);
        }

        log.info("Parsed Staff List: {}", staffList);
        return staff;
    }

    private List<StaffDTO> setStaffDetails(List<StaffExcelDto> staffList) {
        List<StaffDTO> staffListDto = new ArrayList<>();
        Map<String, String> divisionOrigin = new HashMap<>();
        divisionOrigin.put("7d8c6ad1-3d45-47ef-a56e-c50e38329885", "3003");
        divisionOrigin.put("8d1e8eb9-c1a5-4b9a-98ad-b5e61a2d3f21", "3002");
        divisionOrigin.put("e5f7d3e1-ff7e-4b71-8ab1-041a0c9d7e15", "3001");
        staffList.forEach(data -> {
            StaffDTO staffDTO = new StaffDTO();
            staffDTO.setAuthMode("Email");
            staffDTO.setTenantId("1");
            staffDTO.setIsUseCustomerIL(false);
            BasicData basicData = new BasicData();
            basicData.setId("f28b49cd-1b70-44b0-bf5a-1b95912b2563");
            basicData.setOriginId("82");
            basicData.setName("Al Yasra Food Company");
            Map<String, String> nameMap = new HashMap<>();
            nameMap.put("en", "Al Yasra Food Company");
            basicData.setNameMap(nameMap);
            staffDTO.setOrgRef(basicData);
            staffDTO.setStatus("ACTIVE");
            staffDTO.setOriginStatus("ACTIVE");
            BasicData inv = new BasicData();
            inv.setId("82241fe5-d028-4fee-b7e4-3202d46fac5f");
            inv.setName("SUBHAN");
            Map<String, String> invName = new HashMap<>();
            invName.put("en", "SUBHAN");
            invName.put("ar", "شوبان");
            inv.setNameMap(invName);
            inv.setType("SELLABLE");
            staffDTO.setInventoryLocations(List.of(inv));
            BasicData division = new BasicData();
            division.setId(data.getDivisionId());
            division.setOriginId(divisionOrigin.get(data.getDivisionId()));
            Map<String, String> divisionName = new HashMap<>();

            division.setName(data.getDivision());
            divisionName.put("en", data.getDivision());
            division.setNameMap(divisionName);
            staffDTO.setDivisions(List.of(division));

            Map<String, String> staffName = new HashMap<>();

            staffName.put("en", data.getEnglishName());
            staffName.put("ar", data.getArabicName());
            staffDTO.setNames(staffName);
            staffDTO.setName(data.getEnglishName());
            staffDTO.setRoles(List.of(data.getRole()));
            staffDTO.setEmail(data.getEmail());
            staffDTO.setDesignation(data.getDesignation());
            staffDTO.setPhone(data.getPhoneNumber());
            staffDTO.setOriginId(data.getEmployeeNumber());
            staffListDto.add(staffDTO);
        });
        return staffListDto;
    }

//    @PostMapping(value = "/item/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
//    public List<String> uploadItemFile(@RequestParam("file") MultipartFile file) throws IOException {
//        List<ItemExcelDto> itemExcelDtos = new ArrayList<>();
//        List<String> itemList = new ArrayList<>();
//
//        try (InputStreamReader reader = new InputStreamReader(file.getInputStream())) {
//            CsvToBean<ItemExcelDto> csvToBean = new CsvToBeanBuilder<ItemExcelDto>(reader)
//                    .withType(ItemExcelDto.class)
//                    .withSeparator(',')
//                    .withSkipLines(1)  // Skip header line
//                    .build();
//
//            itemExcelDtos = csvToBean.parse();
//
//            itemList = setStaffDetail(itemExcelDtos);
//
//        } catch (Exception e) {
//        }
//        return itemList;
//    }
//
//    private List<String> setStaffDetail(List<ItemExcelDto> list) {
//        List<String> itemDTOS = new ArrayList<>();
//        list.forEach(data -> {
//            try {
//                Thread.sleep(1);
//            } catch (InterruptedException e) {
//                throw new RuntimeException(e);
//            }
//            if (!isImageValid(data.getItemUrl())) {
//                itemDTOS.add(extractItemCode(data.getItemUrl()));
//                System.out.println("************** UnSuccessful Item Image Found ***************" + data.getItemUrl());
//            }else{
//                System.out.println("************** Successful Image Item Found ***************" + data.getItemUrl());
//            }
//        });
//        return itemDTOS;
//    }
//
//    public static String extractItemCode(String url) {
//        String fileName = url.substring(url.lastIndexOf("/") + 1); // Get "16004160.jpg"
//        return fileName.substring(0, fileName.lastIndexOf(".")); // Remove ".jpg"
//    }
//    boolean isImageValid(String imageUrl) {
//        try {
//            URL url = new URL(imageUrl);
//            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
//            connection.setRequestMethod("GET");
//            connection.setConnectTimeout(5000);
//            connection.setReadTimeout(5000);
//            return connection.getResponseCode() == HttpURLConnection.HTTP_OK;
//        } catch (Exception e) {
//            return false;
//        }
//    }
}
