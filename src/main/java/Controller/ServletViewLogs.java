package Controller;

import DAO.LogDAO;
import DAO.LogDAOImp;
import Model.Log;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletViewLogs", value = "/viewLogs")
public class ServletViewLogs extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("ServletViewLogs: Handling request...");

        // Fetch logs from DAO
        LogDAO logDAO = new LogDAOImp();
        List<Log> logs = logDAO.findAll();

        // Check if logs are retrieved
        System.out.println("ServletViewLogs: Number of logs retrieved: " + logs.size());

        // Set logs as attribute in request
        req.setAttribute("logs", logs);

        // Forward to JSP for rendering
        req.getRequestDispatcher("viewLogs.jsp").forward(req, resp);
    }
}
