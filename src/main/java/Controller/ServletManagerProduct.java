package Controller;

import DAO.ProductDAO;
import Model.Product;
import Service.PaginationService;
import Service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ServletManagerProduct", value = "/managerProduct")
public class ServletManagerProduct extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ServletManagerProduct.class.getName());

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        ProductService ps = ProductService.getInstance();
        PaginationService paginationService = PaginationService.getInstance();

        String updateProduct = req.getParameter("updateProduct");
        String status = req.getParameter("status");
        String deleteProduct = req.getParameter("deleteProduct");
        String check = req.getParameter("check");

        LOGGER.log(Level.INFO, "updateProduct: {0}, status: {1}, deleteProduct: {2}, check: {3}",
                new Object[]{updateProduct, status, deleteProduct, check});

        if (deleteProduct != null && check != null) {
            if (ps.deleteProduct(deleteProduct) > 0) {
                req.setAttribute("notify", "Xóa sản phẩm thành công");
            } else {
                req.setAttribute("notify", "Xóa sản phẩm thất bại");
            }
        }

        if (updateProduct != null && status != null) {
            try {
                int statusInt = Integer.parseInt(status);
                if (ps.updateProduct(updateProduct, statusInt) > 0) {
                    req.setAttribute("notify", "Thay đổi sản phẩm thành công");
                } else {
                    req.setAttribute("notify", "Thay đổi sản phẩm thất bại");
                }
            } catch (NumberFormatException e) {
                LOGGER.log(Level.SEVERE, "Error parsing status: {0}", e.getMessage());
                req.setAttribute("notify", "Thay đổi sản phẩm thất bại");
            }
        }

        List<Product> productList = ProductDAO.productList();
        req.setAttribute("deleteProduct", deleteProduct);
        req.setAttribute("productList", productList);

        req.getRequestDispatcher("ManagerProduct.jsp").forward(req, resp);
    }
}
