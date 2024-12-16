package Controller;

import Model.Account;
import Service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletUpdateInfo", value = "/ServletUpdateInfo")
public class ServletUpdateInfo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String newFullname = req.getParameter("newFullname");
        HttpSession session = req.getSession();
        String username = ((Account) session.getAttribute("account")).getUsername();
        AccountService accountService = AccountService.getInstance();
        boolean infoChanging = accountService.updateUserInfo(username,newFullname);
        if (infoChanging) {
            ((Account) session.getAttribute("account")).setFullname(newFullname);
        }
        req.getRequestDispatcher("users-page.jsp").forward(req,resp);
    }
}

