package in.sam.util;

import java.awt.Color;
import java.io.IOException;
import java.util.List;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

import in.sam.entity.Student;
import jakarta.servlet.http.HttpServletResponse;

public class StudentPdfExporter {

    private List<Student> listStudents;

    public StudentPdfExporter(List<Student> listStudents) {
        this.listStudents = listStudents;
    }

    private void writeTableHeader(PdfPTable table) {

        PdfPCell cell = new PdfPCell();

        cell.setBackgroundColor(Color.BLUE);
        cell.setPadding(6);

        Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
        font.setColor(Color.WHITE);

        cell.setPhrase(new Phrase("ID", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Name", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Email", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Gender", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Course", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Timing", font));
        table.addCell(cell);
    }

    private void writeTableData(PdfPTable table) {

        for (Student student : listStudents) {

            table.addCell(String.valueOf(student.getSid()));
            table.addCell(student.getName());
            table.addCell(student.getEmail());
            table.addCell(student.getGender());
            table.addCell(student.getCourse());
            table.addCell(student.getTiming());

        }
    }

    public void export(HttpServletResponse response)
            throws DocumentException, IOException {

        Document document = new Document();

        PdfWriter.getInstance(document, response.getOutputStream());

        document.open();

        Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);

        font.setSize(18);
        font.setColor(Color.BLUE);

        Paragraph p = new Paragraph("Student Management System", font);

        p.setAlignment(Paragraph.ALIGN_CENTER);

        document.add(p);

        document.add(new Paragraph(" "));

        PdfPTable table = new PdfPTable(6);

        table.setWidthPercentage(100f);

        table.setWidths(new float[] { 1.2f, 3f, 5f, 2f, 3f, 2.5f });

        table.setSpacingBefore(10);

        writeTableHeader(table);

        writeTableData(table);

        document.add(table);

        document.close();
    }
}