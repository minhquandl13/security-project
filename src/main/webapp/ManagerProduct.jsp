<%@ page import="Service.ProductService" %>
<%@ page import="java.util.Map" %>
<%@ page import="Model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="Model.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="./css/admin.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
</head>
<%
    Account account = session.getAttribute("account") == null ? new Account() : (Account) session.getAttribute("account");
    String notify = request.getAttribute("notify") == null ? "" : request.getAttribute("notify").toString();
    ProductService ps = request.getAttribute("ps") == null ? ProductService.getInstance() : (ProductService) request.getAttribute("ps");
    Map<String, String> listImageThumbnail = ps.selectImageThumbnail();
    Map<String, String> categorys = ps.selectCategory();
    List<Product> listProduct = request.getAttribute("productList") == null ? new ArrayList<>() : (List<Product>) request.getAttribute("productList");
    NumberFormat nf = NumberFormat.getInstance();
%>
<body>
<div id="id">
    <div id="admin">
        <div class="left">
            <div class="menu">
                <div class="menu-title">
                    <div class="logo">
                        <a href="./home"><img src="./assets/logo.svg" alt=""></a>
                    </div>
                    <h2 class="shop-name"><a href="">PLQ SHOP</a></h2>
                </div>
                <div class="shop-user">
                    <div class="user">
                        <img src="./assets/images/logo/icon.jpg" alt="">
                    </div>
                    <p>Xin chào, <%=account.getFullname()%>
                    </p>
                </div>
                <div class="menu-item">
                    <a href="./admin">
                        <div class="icon"><i class="fa-solid fa-house-chimney"></i></div>
                        <p class="menu-content">Thống kê</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="./managerAccount">
                        <div class="icon"><i class="fa-solid fa-desktop"></i></div>
                        <p class="menu-content">Quản lý tài khoản</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="./managerProduct" class="active">
                        <div class="icon"><i class="fa-regular fa-calendar-days"></i></div>
                        <p class="menu-content">Quản lý sản phẩm</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="./managerOrder">
                        <div class="icon"><i class="fa-solid fa-clipboard"></i></div>
                        <p class="menu-content">Quản lý đơn hàng</p>
                    </a>
                </div>
                <div class="menu-item">

                    <a href="./managerLog">
                        <div class="icon"><i class="fa-solid fa-file-alt"></i></div>
                        <p class="menu-content">Quản lý nhật ký</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="./createVoucher?page=1">
                        <div class="icon"><i class="fa-solid fa-gift"></i></div>
                        <p class="menu-content">Quản lý Voucher</p>
                        </a>

                </div>
                <div class="menu-item">
                    <a href="./managerComment?page=1">
                        <div class="icon"><i class="fa-solid fa-comment"></i></div>
                        <p class="menu-content">Quản lý bình luận</p>

                    </a>
                </div>
                <div class="menu-item">
                    <a href="./ServletLogOut">
                        <p class="menu-content">Đăng xuất</p>
                    </a>
                </div>
            </div>
        </div>
        <div class="right">
            <div class="contain">
                <div class="title">
                    <h2>Quản lý Sản phẩm</h2>
                </div>
                <div class="manager">
                    <div class="manager-infor">
                        <table id="myTable">
                            <thead>
                            <tr>
                                <th scope="col">Mã sản phẩm</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Hình ảnh</th>
                                <th scope="col">Giá sản phẩm</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col">Lưu</th>
                                <th scope="col">Xóa</th>
                            </tr>
                            </thead>

                            <tbody>
                            <% for (Product p : listProduct) {%>
                            <tr>
                                <th><%=p.getId()%>
                                </th>
                                <th style="width: 600px"><%=p.getName()%>
                                </th>
                                <th>
                                    <div class="product-img"><img src="<%=listImageThumbnail.get(p.getId())%>" alt="">
                                    </div>
                                </th>
                                <th><%=nf.format(p.getPrice())%>
                                </th>
                                <th><%=p.getQuantity()%>
                                </th>
                                <form action="./managerProduct" method="post">
                                    <th scope="row">
                                        <select class="status" name="status">
                                            <% if (p.isStatus() == 1) {%>
                                            <option value="1" selected>Đang bán</option>
                                            <option value="2">Ngưng bán</option>
                                            <option value="3">Hết hàng</option>
                                            <%} else if(p.isStatus() == 2) {%>
                                            <option value="1">Đang bán</option>
                                            <option value="2" selected>Ngưng bán</option>
                                            <option value="3">Hết hàng</option>
                                            <%} else {%>
                                            <option value="1">Đang bán</option>
                                            <option value="2" >Ngưng bán</option>
                                            <option value="3" selected>Hết hàng</option>
                                                    <%}%>
                                        </select>
                                    </th>
                                    <th>
                                        <input type="hidden" name="updateProduct" value="<%=p.getId()%>">
                                        <button class="btn-repair" style="padding: 5px 10px; margin-right: 5px">Lưu
                                        </button>

                                    </th>
                                </form>
                                <th>
                                    <form action="./managerProduct" method="post" style="display: inline-block">
                                        <input type="hidden" name="deleteProduct" value="<%=p.getId()%>">
                                        <button class="btn-delete" style="padding: 5px 10px;"><i
                                                class="fa-solid fa-trash-can" style="color: #ffffff;"></i></button>
                                    </form>
                                </th>
                            </tr>
                            <%}%>
                            </tbody>

                        </table>
                    </div>
                    <button class="btn-addProduct" onclick="openModal()">Thêm sản phẩm</button>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
<%-- Modal thêm sản phẩm--%>
<div id="myModal" class="modal">
    <!-- Nội dung modal -->
    <div class="modal-content">
        <div class="btn-close" onclick="closeModal()"><span class="close">&times;</span></div>
        <div class="modal-content__title"><h4>Thêm sản phẩm</h4></div>
        <form action="./addProduct" method="post" enctype="multipart/form-data">
            <div class="modal-content__input">
                <div class="description"><span>Mã sản phẩm*: </span></div>
                <input type="text" name="id" autocomplete="off" required>
            </div>
            <div class="modal-content__input">
                <div class="description"><span>Tên sản phẩm*: </span></div>
                <input type="text" name="name" autocomplete="off" required>
            </div>
            <div class="modal-content__input">
                <span>Số lượng*: </span>
                <input type="number" min="1" style="width: 50px;" name="quantity" autocomplete="off" required>
                <span>Giá*: </span>
                <input id="price" oninput="formatNumber(this)" type="text" name="price" autocomplete="off" required>
            </div>
            <div class="modal-content__input">
                <div class="description"><span>Chất liệu*: </span></div>
                <input type="text" name="material" autocomplete="off" required>
            </div>
            <div class="modal-content__input">
                <div class="description"><span>Kích cỡ*: </span></div>
                <input type="text" name="size" autocomplete="off" required>
            </div>
            <div class="modal-content__input">
                <div class="description"><span>Màu sắc*: </span></div>
                <input type="text" name="color" autocomplete="off" required>
            </div>
            <div class="modal-content__input">
                <div class="description"><span>Giới tính*: </span></div>
                <input type="radio" name="gender" value="Nam"> Nam
                <input type="radio" name="gender" value="Nữ" style="margin-left: 10px;"> Nữ
            </div>
            <div class="modal-content__input">
                <div class="description"><span>Loại sản phẩm: </span></div>
                <select class="idCategory" name="idCategory">
                    <% for (Map.Entry<String, String> entry : categorys.entrySet()) {%>
                    <option value="<%=entry.getKey()%>"><%=entry.getValue()%>
                    </option>
                    <%}%>
                </select>
            </div>
            <div class="modal-content__input">
                <span>Thumbnail*: </span>
                <input type="file" name="thumbnail">
            </div>
            <div class="modal-content__input">
                <span>Các hình ảnh chi tiết*: </span>
                <input type="file" name="files[]" multiple>
            </div>
            <button type="submit" class="btn-addProduct">Thêm sản phẩm</button>
        </form>
    </div>
</div>
<%
    String deleteProduct = request.getAttribute("deleteProduct") == null ? "" : request.getAttribute("deleteProduct").toString();
%>
<%--Modal delete sản phẩm--%>
<% if (!deleteProduct.isEmpty()) {%>
<div id="updateModal" style="display: flex" class="modal">
    <div class="modal-content">
        <div class="btn-close" onclick="closeDeleteModal()"><span class="close">&times;</span></div>
        <p style="text-align: center;margin: 40px 0px;font-size: 20px;">Bạn có muốn xóa sản phẩm có mã sản
            phẩm <%=deleteProduct%>
        </p>
        <div style="text-align: center">
            <form action="./managerProduct" method="post" style="display: inline-block">
                <input type="hidden" name="check">
                <input type="hidden" name="deleteProduct" value="<%=deleteProduct%>">
                <button class="btn-repair" onclick="closeDeleteModal()">Đồng ý</button>
            </form>
            <button class="btn-delete" onclick="closeDeleteModal()">Từ chối</button>
        </div>
    </div>
</div>
<%}%>

<%--Modal thông báo--%>
<% if (!notify.isEmpty()) {%>
<div id="notifyModal" style="display: flex" class="modal">
    <div class="modal-content">
        <div class="btn-close" onclick="closeNotifyModal()"><span class="close">&times;</span></div>
        <p style="text-align: center; margin: 40px 0px; font-size: 20px;"><%=notify%>
        </p>
    </div>
</div>
<%}%>
<script src="./js/account.js"></script>
<script>
    function formatNumber(input) {
        let value = input.value;
        console.log(value);
        value = value.replace(/[^0-9.]/g, '');
        value = new Intl.NumberFormat('en-US').format(parseFloat(value));
        input.value = value;
    }

    function openModal() {
        document.getElementById("myModal").style.display = "flex";
    }

    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }

    function closeNotifyModal() {
        document.getElementById("notifyModal").style.display = "none";
    }

    function closeDeleteModal() {
        document.getElementById("updateModal").style.display = "none";
    }

    $(document).ready(function () {
        $('#myTable').DataTable();
    })

</script>
</html>
