package DAO;

import org.jdbi.v3.core.Jdbi;

public class ContractDAO {
    private static Jdbi JDBI;
    public static int createContract(String fullName, String phone, String email, String message, int account_type) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("INSERT INTO contract(fullName,phone, email,message, account_type) " +
                                "VALUES (?, ?, ?, ?, ?)")
                        .bind(0, fullName)
                        .bind(1, phone)
                        .bind(2, email)
                        .bind(3, message)
                        .bind(4, account_type)
                        .execute());
        return execute;
    }

    public static void main(String[] args) {
        ContractDAO ct = new ContractDAO();
        ct.createContract("QuocThai","0908180104","quoc@gmail.com","Hello",1);
    }
}
