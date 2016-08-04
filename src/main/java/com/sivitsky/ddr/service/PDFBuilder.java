package com.sivitsky.ddr.service;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.sivitsky.ddr.model.Order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;


public class PDFBuilder extends AbstractITextPdfView {

    @Override
    protected void buildPdfDocument(Map<String, Object> model, Document doc,
                                    PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // get data model which is passed by the Spring container
        // List<Book> listBooks = (List<Book>) model.get("listBooks");
        HttpSession session = request.getSession(true);

        Order order = (Order) session.getAttribute("booking");
        doc.add(new Paragraph("Order #" + order.getBooking_id() + " from " + order.getBooking_date()));

        PdfPTable table = new PdfPTable(5);
        table.setWidthPercentage(100.0f);
        table.setWidths(new float[]{3.0f, 2.0f, 2.0f, 2.0f, 1.0f});
        table.setSpacingBefore(10);

        // define font for table header row
        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(BaseColor.WHITE);

        // define table header cell
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(BaseColor.BLUE);
        cell.setPadding(5);

        // write table header
        cell.setPhrase(new Phrase("Goods", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Price", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Num", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Cost", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Total", font));
        table.addCell(cell);

        // write table row data
        /*
        for (Book aBook : listBooks) {
            table.addCell(aBook.getTitle());
            table.addCell(aBook.getAuthor());
            table.addCell(aBook.getIsbn());
            table.addCell(aBook.getPublishedDate());
            table.addCell(String.valueOf(aBook.getPrice()));
        }
        */
        doc.add(table);

    }

}