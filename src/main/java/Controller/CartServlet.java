package Controller;

import Model.CartItems;
import Model.ShoppingCart;
import Service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ShoppingCart gioHang = (ShoppingCart) req.getSession().getAttribute("cart");
        ProductService ps = new ProductService();
        String errorMessage = req.getParameter("errorMessage");
        String message = req.getParameter("message");
        String deletedProductId = req.getParameter("deletedProductId");

        if (gioHang == null) {
            gioHang = new ShoppingCart();
            req.getSession().setAttribute("cart", gioHang);
        }
        Map<String, String> listImagesThumbnail = ps.selectImageThumbnail();
        req.setAttribute("errorMessage", errorMessage);
        req.setAttribute("message", message);
        req.setAttribute("deletedProductId", deletedProductId);
        List<CartItems> danhSachSanPham = gioHang.getDanhSachSanPham();
        req.getSession().setAttribute("list-sp", danhSachSanPham);
        req.setAttribute("listImagesThumbnail", listImagesThumbnail);
        req.getRequestDispatcher("cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        }


    }

