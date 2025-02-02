package Service;

import DAO.ProductDAO;
import Model.Product;
import Model.Slider;

import java.util.List;
import java.util.Map;

public class ProductService {
    private static ProductService instance;

    public static ProductService getInstance() {
        if (instance == null) instance = new ProductService();
        return instance;
    }
    public  List<Product> productList() {
        return ProductDAO.productList();
    }
    public Map<String, String> selectCategory() {
        return ProductDAO.selectCategory();
    }

    public Map<String, String> selectImageThumbnail() {
        return ProductDAO.selectImageThumbnail();
    }

    public Map<String, String> selectImageProductDetail(String productId) {
        return ProductDAO.selectImageProductDetail(productId);
    }


    public int totalQuantityProduct() {
        return ProductDAO.totalQuantityProduct();
    }

    public int totalQuantityProductByCategory(String id_category) {
        return ProductDAO.totalQuantityProductByCategory(id_category);
    }

    public int totalProduct() {
        return ProductDAO.totalProduct();
    }

    public int totalProductBySearch(String search) {
        return ProductDAO.totalProductBySearch(search);
    }

    public int insertProduct(String id, String name, String price, String quantity, String material,
                             String size, String color, String gender, String idCategory) {
        return ProductDAO.insertProduct(id, name, price, quantity, material, size,color, gender, idCategory);
    }

    public int insertImage(String idProduct, String source, boolean is_thumbnail_image) {
        return ProductDAO.insertImages(idProduct, source, is_thumbnail_image);
    }
    public int deleteProduct(String id) {
        return ProductDAO.deleteProduct(id);
    }
    public int updateProduct(String id, int status) {
        return ProductDAO.updateProduct(id, status);
    }

    public List<Product> findByCategory(int id) {
        return ProductDAO.findByCategory(id);
    }

    public Product findById(String productId) {
        return ProductDAO.getProductById(productId);
    }
    public List<Product> findByGender(String gender ){
        return ProductDAO.findByGender(gender);
    }
    public double getRating (String id_product){
        return ProductDAO.getRating(id_product);
    }
    public List<Slider> findAll() {
        return ProductDAO.findAll();
    }

    public static void main(String[] args) {
        ProductService ps = new ProductService();
        ps.updateProduct("TL006",0);
    }
}
