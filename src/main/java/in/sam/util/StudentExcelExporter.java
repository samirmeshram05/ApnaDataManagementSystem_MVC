package in.sam.util;

import java.io.IOException;
import java.util.List;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import in.sam.entity.Student;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;

public class StudentExcelExporter {

    private Workbook workbook;
    private Sheet sheet;
    private List<Student> listStudents;

    public StudentExcelExporter(List<Student> listStudents) {
        this.listStudents = listStudents;
        workbook = new XSSFWorkbook();
    }

    // Create Header Row
    private void writeHeaderRow() {

        sheet = workbook.createSheet("Students");

        Row row = sheet.createRow(0);

        row.createCell(0).setCellValue("Student ID");
        row.createCell(1).setCellValue("Student Name");
        row.createCell(2).setCellValue("Email");
        row.createCell(3).setCellValue("Gender");
        row.createCell(4).setCellValue("Course");
        row.createCell(5).setCellValue("Timing");
    }

    // Fill Student Data
    private void writeDataRows() {

        int rowCount = 1;

        for (Student student : listStudents) {

            Row row = sheet.createRow(rowCount++);

            row.createCell(0).setCellValue(student.getSid());
            row.createCell(1).setCellValue(student.getName());
            row.createCell(2).setCellValue(student.getEmail());
            row.createCell(3).setCellValue(student.getGender());
            row.createCell(4).setCellValue(student.getCourse());
            row.createCell(5).setCellValue(student.getTiming());
        }

        // Auto Size Columns
        for (int i = 0; i <= 5; i++) {
            sheet.autoSizeColumn(i);
        }
    }

    // Export Excel
    public void export(HttpServletResponse response) throws IOException {

        writeHeaderRow();
        writeDataRows();

        ServletOutputStream outputStream = response.getOutputStream();

        workbook.write(outputStream);

        workbook.close();

        outputStream.close();
    }
}