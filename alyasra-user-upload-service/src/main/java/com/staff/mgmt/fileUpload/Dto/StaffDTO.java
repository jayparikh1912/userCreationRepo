package com.staff.mgmt.fileUpload.Dto;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@JsonInclude(value = JsonInclude.Include.NON_NULL)
@Getter
@Setter
public class StaffDTO {

    private String id;
    private Map<String, String> names;

    private String name;

    private String phone;

    private BasicData orgRef;

    private String originId;

    private String status;

    private String originStatus;

    private String mobile;

    private String defaultCurrency;

    private List<BasicData> divisions = new ArrayList<>();

    private String designation;

    private List<BasicData> inventoryLocations = new ArrayList<>();

    private Boolean isUseCustomerIL = false;


    private String email;

    private List<String> roles = new ArrayList<>();

    private BasicData parentManagerStaffRef;

    @JsonIgnore
    private String password;

    @JsonIgnore
    private String decodedPassword;

    private Boolean passwordResetFlag = false;

    private String otp;

    private String nonce;

    private LocalDateTime otpValidDate;

    private String authMode;

    private Boolean isDeleted = false;
    private String number;

    private String tenantId;

    private String userId;

    private String keycloakId;
}
