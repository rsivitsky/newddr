package com.sivitsky.ddr.service;

import com.sivitsky.ddr.model.Vendor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Workbook;

import java.io.FileInputStream;
import java.io.IOException;

public interface ExcelReaderService {
    Object getCellValue(Cell cell);

    void readBooksFromExcelFile(javax.servlet.http.Part offers_file, Vendor vendor) throws IOException;

    Workbook getWorkbook(FileInputStream inputStream, String excelFilePath) throws IOException;
}
