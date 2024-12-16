package Model;

import java.sql.Date;

public class Voucher {
    int id ;
    String name;
    Date dateStart;
    Date dateEnd;

    double discount;

    public Voucher() {
    }

    public Voucher(int id, String name, Date dateStart, Date dateEnd, double discount) {
        this.id = id;
        this.name = name;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.discount = discount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }
    public boolean checkDateValid(Date dateStart,Date dateEnd){
        if (dateStart == null || dateEnd == null) {
            return false;
        }

        // Kiểm tra nếu ngày kết thúc trước ngày bắt đầu
        if (dateEnd.before(dateStart)) {
            return false;
        }
        return true;
    }
    @Override
    public String toString() {
        return "Voucher{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", dateStart=" + dateStart +
                ", dateEnd=" + dateEnd +
                ", discount=" + discount +
                '}';
    }
}
