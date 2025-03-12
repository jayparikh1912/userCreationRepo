package com.staff.mgmt.fileUpload.Dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Map;

@Getter
@Setter
public class BasicData {
    private String id;
    private Map<String, String> nameMap;
    private String name;
    private String number;
    private String originId;
    private String parentId;
    private String parentOriginId;
    private String type;
    private Boolean isDefault = false;

}
