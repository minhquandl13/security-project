package Service;

import DAO.VoucherDAO;
import Model.Voucher;

import java.sql.Date;
import java.util.List;

public class VoucherService {
    private static VoucherService instance;

    public static VoucherService getInstance() {
        if (instance == null) instance = new VoucherService();
        return instance;
    }
    public  int createVoucher(String name, Date dateStart, Date dateEnd, double discount) {
        return VoucherDAO.createVoucher(name,dateStart,dateEnd,discount);
    }
    public  List <Voucher> getVouchers() {
        return  VoucherDAO.getVouchers();
    }
    public  Voucher getVoucherByID(int id) {
        return  VoucherDAO.getVoucherByID(id);
    }

    public static void main(String[] args) {
        VoucherService voucherService = VoucherService.getInstance();
       int size= (voucherService.getVouchers()).size();
        System.out.println(size);
    }
}
