package Constants;

public class Constants {
    public static String GOOGLE_CLIENT_ID = "1009898544213-079sof1bo2lnn9a1hr0aaumie5kd7vvs.apps.googleusercontent.com";

    public static String GOOGLE_CLIENT_SECRET = "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";

    public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/LoginGoogleHandler";

    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static String GOOGLE_GRANT_TYPE = "authorization_code";

    public static String FACEBOOK_APP_ID = "3242053589264809";

    public static String FACEBOOK_APP_SECRET = "14012a48ec2748060506f1d03cf2c9d8";

    public static String FACEBOOK_REDIRECT_URL = "https://localhost:8080/LoginFacebookHandler";

    public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";
}
