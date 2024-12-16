package Service;

import DAO.ContractDAO;

public class ContractService {
    static ContractService contractService = getInstance();

    public static ContractService getInstance() {
        if (contractService == null) contractService = new ContractService();
        return contractService;
    }
    public int createContract(String fullName, String phone, String email, String message, int account_type){
        return ContractDAO.createContract(fullName,phone,email,message,account_type);
    }

}
