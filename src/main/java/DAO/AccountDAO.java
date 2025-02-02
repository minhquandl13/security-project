
package DAO;

import Model.Account;
import org.jdbi.v3.core.Jdbi;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;
import java.util.StringTokenizer;

public class AccountDAO {
    private static Jdbi JDBI;

    public static Account accountByUsername(String username) {
        JDBI = ConnectJDBI.connector();
        Optional<Account> account = JDBI.withHandle(handle ->
                handle.createQuery("Select id, username, password, email, fullname, numberPhone, status From accounts where username = ?")
                        .bind(0, username).mapToBean(Account.class).stream().findFirst()
        );
        return account.isEmpty() ? null : account.get();
    }

    public static Account getAccountByAccountId(int accountId) {
        JDBI = ConnectJDBI.connector();
        String sql = "SELECT id, username, password, email, fullname, numberPhone, status From accounts where id = ?";
        Optional<Account> account = JDBI.withHandle(handle ->
                handle.createQuery(sql)
                        .bind(0, accountId).mapToBean(Account.class).stream().findFirst()
        );
        return account.orElse(null);
    }

    public static int getRoleByAccountId(int accountId) {
        JDBI = ConnectJDBI.connector();
        String sql = "SELECT role FROM access_levels WHERE idAccount = ?";
        return JDBI.withHandle(handle ->
                handle.createQuery(sql)
                        .bind(0, accountId)
                        .mapTo(int.class)
                        .findFirst()
                        .orElse(1)
        );
    }

    public static Account accountByUsernameAndEmail(String username, String email) {
        JDBI = ConnectJDBI.connector();
        Optional<Account> account = JDBI.withHandle(handle ->
                handle.createQuery("Select id, username, password,email, fullname, numberPhone, status From accounts where username = ? And email = ?")
                        .bind(0, username).bind(1, email).mapToBean(Account.class).stream().findFirst()
        );
        return account.isEmpty() ? null : account.get();
    }

    public static int createAccount(String username, String password, String email, String fullname, String number_phone, int status) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("INSERT INTO accounts(username, password, email, fullname, numberPhone, status) " +
                                "VALUES (?, ?, ?, ?, ?, ?)")
                        .bind(0, username)
                        .bind(1, password)
                        .bind(2, email)
                        .bind(3, fullname)
                        .bind(4, number_phone)
                        .bind(5, status)
                        .execute());
        return execute;
    }

    public static int deleteAccount(String username, String email) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("DELETE FROM accounts WHERE username = ? And email = ?")
                        .bind(0, username)
                        .bind(1, email).execute()
        );
        return execute;
    }

    public static int updateStatusAccount(String id, int status) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("UPDATE accounts SET status = ? WHERE id = ?")
                        .bind(0, status)
                        .bind(1, id).execute()
        );
        return execute;
    }

    public static int createVerifyEmail(String code, String dateCreate, String dateExpired, boolean status, int idAccount) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("INSERT INTO verify_emails(code, dateCreated, dateExpired, status, idAccount) " +
                                "VALUES (?, ?, ?, ?, ?)")
                        .bind(0, code)
                        .bind(1, dateCreate)
                        .bind(2, dateExpired)
                        .bind(3, status)
                        .bind(4, idAccount)
                        .execute());
        return execute;
    }

    public static Account isVerifyEmailSuccess(String code) {
        JDBI = ConnectJDBI.connector();
        Calendar date = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formatDate = dateFormat.format(date.getTime());
        Optional<Account> account = JDBI.withHandle(handle ->
                handle.createQuery("SELECT accounts.id, accounts.username, accounts.password, " +
                                "accounts.email, accounts.fullname, accounts.numberPhone, accounts.status " +
                                "FROM accounts " +
                                "INNER JOIN verify_emails ON accounts.id = verify_emails.idAccount " +
                                "WHERE verify_emails.code = ? AND verify_emails.dateExpired > ? AND verify_emails.status = 0")
                        .bind(0, code)
                        .bind(1, formatDate)
                        .mapToBean(Account.class).stream().findFirst()
        );
        int execute = 0;
        if (!account.isEmpty()) {
            execute = updateStatusVerifyEmail(code);
        }
        if (execute > 0) return account.get();
        return null;
    }

    private static int updateStatusVerifyEmail(String code) {
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("UPDATE verify_emails SET status = 1 WHERE code = ?")
                        .bind(0, code).execute());
        return execute;
    }

    public static int updatePasswordAccount(int id, String password) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("UPDATE accounts SET password = ? WHERE id = ?")
                        .bind(0, password)
                        .bind(1, id).execute()
        );
        return execute;
    }

    public static int updateRoleAccount(String id, int role) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("UPDATE access_levels SET role = ? WHERE idAccount = ?")
                        .bind(0, role)
                        .bind(1, id).execute()
        );
        return execute;
    }

    public static int createRoleAccount(Account account, int role) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("INSERT INTO access_levels(role, idAccount) " +
                                "VALUES(?, ?)")
                        .bind(0, role)
                        .bind(1, account.getID()).execute()
        );

        return execute;
    }

    public static int test() {
        JDBI = ConnectJDBI.connector();
        int index = 283;
        int execute = 0;
        for (int i = 500; i <= 636; i++) {
            int finalI = i;
            int finalIndex = index;
            execute += JDBI.withHandle(handle ->
                    handle.createUpdate("Update images set id = ? where id = ?")
                            .bind(0, finalIndex)
                            .bind(1, finalI).execute());
            index++;
        }

        return execute;
    }

    public static void main(String[] args) {
        System.out.println(getRoleByAccountId(2));
    }

    public static int totalAccount() {
        JDBI = ConnectJDBI.connector();
        int total = JDBI.withHandle(handle ->
                handle.createQuery("SELECT COUNT(id) " + "FROM accounts where status = 1")
                        .mapTo(Integer.class)
                        .findOnly()
        );

        return total;
    }


    public static List<Account> findAccountByUsername(String username) {
        JDBI = ConnectJDBI.connector();
        List<Account> accountList = JDBI.withHandle(handle ->
                handle.createQuery("SELECT a.id, a.username, a.email, a.fullname, a.numberPhone, al.role, a.status " +
                                "From accounts a INNER JOIN access_levels al ON a.id = al.idAccount where a.username like ? And a.status > 0 ")
                        .bind(0, "%" + username + "%")
                        .mapToBean(Account.class)
                        .stream()
                        .toList());

        return accountList;
    }

    public static int totalAccountBySearch(String search) {
        JDBI = ConnectJDBI.connector();
        int total = JDBI.withHandle(handle ->
                handle.createQuery("SELECT COUNT(id) " +
                                "FROM accounts where username like ? and status = 1")
                        .bind(0, "%" + search + "%")
                        .mapTo(Integer.class)
                        .findOnly()
        );

        return total;
    }

    public static int roleAccount(String id) {
        JDBI = ConnectJDBI.connector();
        int role = JDBI.withHandle(handle ->
                handle.createQuery("Select role From access_levels where idAccount = ?")
                        .bind(0, id)
                        .mapTo(Integer.class)
                        .findOnly());

        return role;
    }

    public static boolean updatePassword(String username, String newPassword) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("UPDATE accounts SET password = ? WHERE username = ?")
                        .bind(0, newPassword)
                        .bind(1, username)
                        .execute());

        return execute > 0;
    }

    public static boolean updateUserInfo(String username, String newFullname) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("UPDATE accounts SET fullname = ?  WHERE username = ?")
                        .bind(0, newFullname)
                        .bind(1, username)
                        .execute());

        return execute > 0;
    }

    public static int createAccountWithGoogleAndFacebook(String username, String email, String fullname, int status) {
        JDBI = ConnectJDBI.connector();
        String sql = "INSERT INTO accounts(username, email, fullname, status) VALUES (?, ?, ?, ?)";
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind(0, username)
                        .bind(1, email)
                        .bind(2, fullname)
                        .bind(3, status)
                        .execute());

        return execute;
    }

    public static boolean isAccountExist(String email) {
        JDBI = ConnectJDBI.connector();
        String sql = "SELECT 1 FROM accounts WHERE email = ? LIMIT 1";

        return JDBI.withHandle(handle ->
                handle.createQuery(sql)
                        .bind(0, email)
                        .mapTo(Boolean.class)
                        .findFirst()
                        .orElse(false));
    }
}
