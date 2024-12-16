package Controller;

import Model.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletLogOut", value = "/ServletLogOut")
public class ServletLogOut extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            session.removeAttribute("account");
            HttpSession session2 = req.getSession();
            session.setAttribute("successMsg", "Logout Successfully");
            clearCart(session);
            // Log the path to verify it's correct
            resp.sendRedirect("./home");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private void clearCart(HttpSession session) {
        // Assuming you have stored cart items in the session with a key "cartItems"
        session.removeAttribute("cart");
        // You might need to perform additional steps based on how your cart is managed
    }
}
