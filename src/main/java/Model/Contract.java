package Model;

public class Contract {
    int id;
    String fullName;
    String phone;
    String email;
    String message;
    int account_type;

    public Contract(int id, String fullName, String phone, String email, String message, int type) {
        this.id = id;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.message = message;
        this.account_type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int isType() {
        return account_type;
    }

    public void setAccount_type(int account_type) {
        this.account_type = account_type;
    }

    @Override
    public String toString() {
        return "Contract{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", phone=" + phone +
                ", email='" + email + '\'' +
                ", message='" + message + '\'' +
                ", type=" + account_type +
                '}';
    }
}
