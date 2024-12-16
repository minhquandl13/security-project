package Service;

import DAO.FeedbackDAO;
import DAO.RatingDAO;
import Model.Comment;

import java.util.List;

public class FeedbackAndRatingService {
    private static FeedbackAndRatingService instance;

    public static FeedbackAndRatingService getInstance() {
        if (instance == null) instance = new FeedbackAndRatingService();

        return instance;
    }

    public int saveCommentFeedback(String content, String productId, int idAccount) {
        return FeedbackDAO.saveCommentFeedback(content, productId, idAccount);
    }

    public List<Comment> getCommentsByProductId(String productId) {
        return FeedbackDAO.getCommentsByProductId(productId);
    }

    public int saveRating(int rating, int idAccount, String productId) {
        return RatingDAO.saveRating(rating, idAccount, productId);
    }

    public int getTotalNumberOfComments() {
        return FeedbackDAO.getTotalNumberOfComments();
    }

    public List<Comment> getCommentsByAccountId(int idAccount) {
        return FeedbackDAO.getCommentsByAccountId(idAccount);
    }

    public int getTotalComment() {
        return FeedbackDAO.getTotalComment();
    }

    public int totalCommentBySearch(String search) {
        return FeedbackDAO.totalCommentBySearch(search);
    }

    public int getStatusComment(int idAccount) {
        return FeedbackDAO.getStatusComment(idAccount);
    }

    public List<String> getProductId(int idAccount) {
        return FeedbackDAO.getProductId(idAccount);
    }
}
