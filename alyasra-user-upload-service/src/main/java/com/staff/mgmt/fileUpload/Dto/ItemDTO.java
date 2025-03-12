package com.staff.mgmt.fileUpload.Dto;


import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.Setter;

@JsonInclude(value = JsonInclude.Include.NON_NULL)
@Getter
@Setter
public class ItemDTO {

    private String itemCode;
}
