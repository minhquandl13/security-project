package DAO;

import org.jdbi.v3.core.Jdbi;

public class RatingDAO {
    private static Jdbi JDBI;

    public static int saveRating(int rating, int idAccount, String idProduct) {
        String SAVE_FEEDBACK_SQL = "INSERT INTO product_ratings (rating, idAccount, idProduct) VALUES (?, ?, ?)";
        JDBI = ConnectJDBI.connector();

        int execute = JDBI.withHandle(handle ->
                handle.createUpdate(SAVE_FEEDBACK_SQL)
                        .bind(0, rating)
                        .bind(1, idAccount)
                        .bind(2, idProduct)
                        .execute()
        );

        return execute;
    }
}
