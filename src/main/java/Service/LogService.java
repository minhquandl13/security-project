package Service;

import DAO.LogDAO;
import DAO.LogDAOImp;
import Model.Log;

import java.util.List;

public class LogService {
    private static LogService instance;
    private LogDAO logDAO;

    private LogService() {
        logDAO = new LogDAOImp();
    }

    public static synchronized LogService getInstance() {
        if (instance == null) {
            instance = new LogService();
        }
        return instance;
    }

    public int addLog(Log log) {
        return logDAO.add(log);
    }

    public List<Log> getAllLogs(int page) {
        return logDAO.findAll();
    }


}
