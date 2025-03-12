package com.staff.mgmt.fileUpload.Dto;

import com.opencsv.bean.CsvBindByPosition;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StaffExcelDto {
    @CsvBindByPosition(position = 0)
    private String employeeNumber;
    @CsvBindByPosition(position = 1)
    private String role;
    @CsvBindByPosition(position = 2)
    private String englishName;
    @CsvBindByPosition(position = 3)
    private String arabicName;
    @CsvBindByPosition(position = 4)
    private String email;
    @CsvBindByPosition(position = 5)
    private String designation;
    @CsvBindByPosition(position = 6)
    private String phoneNumber;
    @CsvBindByPosition(position = 7)
    private String division;
    @CsvBindByPosition(position = 8)
    private String divisionId;
}
