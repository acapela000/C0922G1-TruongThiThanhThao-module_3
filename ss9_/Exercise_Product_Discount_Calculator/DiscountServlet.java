package com.example.product_discount_calculator;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "Product Discount Calculator", urlPatterns ="/display-discount")
public class DiscountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
        String productDes = req.getParameter("product_description");
        double listPrice = Double.parseDouble(req.getParameter("list_price"));
        double discountPercent = Double.parseDouble(req.getParameter("discount_percent"));
        double discountAmount = listPrice*discountPercent*0.01;
        double discountPrice = listPrice - discountAmount;

        req.setAttribute("product_description",productDes);
        req.setAttribute("list_price",listPrice);
        req.setAttribute("discount_percent",discountPercent);
        req.setAttribute("discount_amount",discountAmount);
        req.setAttribute("discount_price",discountPrice);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("result.jsp");

        requestDispatcher.forward(req,resp);
    }

}