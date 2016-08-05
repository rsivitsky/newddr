package com.sivitsky.ddr.service;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.sivitsky.ddr.model.Order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Map;

public class PDFBuilder extends AbstractITextPdfView {

    @Override
    protected void buildPdfDocument(Map<String, Object> model, Document doc,
                                    PdfWriter writer, HttpServletRequest request, HttpServletResponse response) throws Exception {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
        Order order = (Order) model.get("orderPdf");
        doc.add(new Paragraph("Order #" + order.getBooking_id() + " from " + dateFormat.format(order.getBooking_date())));
        doc.add(new Paragraph("goods: " + order.getPart().getPart_name()));
        doc.add(new Paragraph("quantity: " + order.getBooking_num()));
        doc.add(new Paragraph("cost: " + order.getBooking_sum()));
    }
}