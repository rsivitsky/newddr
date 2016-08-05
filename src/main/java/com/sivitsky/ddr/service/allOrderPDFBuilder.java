package com.sivitsky.ddr.service;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.sivitsky.ddr.model.Order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


public class allOrderPDFBuilder extends AbstractITextPdfView {

    @Override
    protected void buildPdfDocument(Map<String, Object> model, Document doc,
                                    PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        List<Order> orderList = new ArrayList<Order>();
        try {
            orderList = (List<Order>) model.get("listOrders");
        } catch (Exception e) {
            System.err.println("Caught Exception: " + e.getMessage());
        }
        ;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
        Date date = new Date();
        doc.add(new Paragraph("Order list" + " from " + dateFormat.format(date)));

        if (orderList != null) {
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

            cell.setPhrase(new Phrase("Order status", font));
            table.addCell(cell);

            for (Order order : orderList) {
                table.addCell(order.getPart().getPart_name());
                table.addCell(order.getOffer().getOffer_price().toString());
                //table.addCell(order.getBooking_num().toString());
                // table.addCell(order.getBooking_sum().toString());
                //table.addCell(order.getBooking_status());
            }
            doc.add(table);
        } else {
            doc.add(new Paragraph("Your Order list is empty"));
        }

    }

}