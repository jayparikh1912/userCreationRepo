package com.staff.mgmt.fileUpload.Dto;

import com.opencsv.bean.CsvBindByPosition;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ItemExcelDto {
    @CsvBindByPosition(position = 0)
    private String itemUrl;
}
