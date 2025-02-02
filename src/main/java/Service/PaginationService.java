package Service;

import DAO.PaginationDao;
import Model.Account;
import Model.Comment;
import Model.Order;
import Model.Product;

import java.util.List;

public class PaginationService {

    private static PaginationService instance;

    public static PaginationService getInstance() {
        if (instance == null) instance = new PaginationService();
        return instance;
    }

    public List<Product> productList(int limit, int page) {
        return PaginationDao.productList(limit, page);
    }

    public List<Product> ProductDefault(int limit, int page, String id_category) {
        return PaginationDao.productByCategory(limit, page, id_category);
    }

    public List<Product> productSort(int limit, int page, String id_category, String sort) {
        return PaginationDao.productByCategoryAndSortByPrice(limit, page, id_category, sort);
    }

    public List<Product> productListBySearch(String search, int limit, int page) {
        return PaginationDao.productListBySearch(search, limit, page);
    }

    public List<Product> ProductFilter(int limit, int page, String id_category, String filter) {
        return PaginationDao.productByCategoryAndFilterByPrice(limit, page, id_category, filter);
    }

    public int totalProductByCategory(String id_category) {
        return PaginationDao.countProductByCategory(id_category);
    }

    public int totalProductByFilter(String filter, String id_category) {
        return PaginationDao.countProductFilter(filter, id_category);
    }

    public List<Account> accountList(int limit, int page) {
        return PaginationDao.accountList(limit, page);
    }

    public List<Account> findAccountByUsername(String username, int limit, int page) {
        return PaginationDao.findAccountByUsername(username, limit, page);
    }

    public List<Order> orderList(int limit, int page) {
        return PaginationDao.orderList(limit, page);
    }

    public List<Order> findOrder(String search, int limit, int page) {
        return PaginationDao.findOrder(search, limit, page);
    }

    public List<Comment> commentList() {
        return PaginationDao.commentList();
    }

    public List<Comment> findComment(String search, int limit, int page) {
        return PaginationDao.findComment(search, limit, page);
    }
}
