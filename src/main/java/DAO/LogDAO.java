package DAO;

import Model.Log;

import java.util.List;

public interface LogDAO {
    int add(Log log);

    List<Log> findAll();

}
