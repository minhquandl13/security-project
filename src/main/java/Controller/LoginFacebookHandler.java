package Controller;


import Constants.Constants;
import Model.Account;
import Service.AccountService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginFacebookHandler", value = "/LoginFacebookHandler")
public class LoginFacebookHandler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        HttpSession session = request.getSession(true);
        Account account = (Account) session.getAttribute("account");
        String accessToken = getToken(code);
        Account user = getUserInfo(accessToken);
        AccountService as = AccountService.getInstance();
        String name = user.getName();
        String nameWithoutSpace = name.trim().replace(" ", "");
        int defaultStatus = 1;


        if (as.isAccountExist(user.getEmail())) {
            as.createAccountWithGoogleAndFacebook(nameWithoutSpace, user.getEmail(), user.getName(), defaultStatus);
            response.sendRedirect("/home");
            System.out.println(user);
        } else {
            response.sendRedirect("/home");
        }

        session.setAttribute("account", user);
    }

    public static String getToken(final String code) throws ClientProtocolException, IOException {
        String link = String.format(Constants.FACEBOOK_LINK_GET_TOKEN, Constants.FACEBOOK_APP_ID, Constants.FACEBOOK_APP_SECRET, Constants.FACEBOOK_REDIRECT_URL, code);
        String response = Request.Get(link).execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static Account getUserInfo(String accessToken) {
        FacebookClient facebookClient = new DefaultFacebookClient(accessToken, Constants.FACEBOOK_APP_SECRET, Version.LATEST);
        return facebookClient.fetchObject("me", Account.class);
    }
}