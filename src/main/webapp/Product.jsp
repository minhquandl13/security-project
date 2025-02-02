<%@ page import="java.util.List" %>
<%@ page import="Model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Service.ProductService" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="./css/product.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="./css/base.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
            integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<%
    ProductService ps = request.getAttribute("ps") == null ? ProductService.getInstance() : (ProductService) request.getAttribute("ps");
    Map<String, String> listCategory = ps.selectCategory();
    Map<String, String> listImageThumbnail = ps.selectImageThumbnail();
    List<Product> listProduct = request.getAttribute("listProduct") == null ? new ArrayList<>() : (List<Product>) request.getAttribute("listProduct");
    int totalPage = request.getAttribute("totalPage") == null ? 0 : (int) request.getAttribute("totalPage");
    int pageCurrent = request.getAttribute("pageCurrent") == null ? 1 : Integer.parseInt(request.getAttribute("pageCurrent").toString());
    String id_category = (String) request.getAttribute("category");
    String filter = request.getAttribute("filter") == null ? "" : "&filter=" + (String) request.getAttribute("filter");
    String sort = request.getAttribute("order") == null ? "" : "&order=" + (String) request.getAttribute("order");
    NumberFormat nf = NumberFormat.getInstance();
%>
<jsp:include page="header.jsp"/>
<div id="content">
    <div class="container">
        <div class="gird">
            <div class="menu__category">
                <h3 class="menu__category--title">Thắt lưng</h3>
                <ul class="list__category">
                    <% for (Map.Entry<String, String> entry : listCategory.entrySet()) {
                        String id = entry.getKey();
                        String name = entry.getValue();
                    %>
                    <li class="list__category--item">
                        <a href="./product?category=<%=id%>&page=1"><%=name%>
                        </a>
                    </li>
                    <%}%>
                </ul>
            </div>

            <div class="menu__product">
                <div class="filter-horizon">
                    <div class="filter-price">
                        <span>Bộ lọc <i class="fa-solid fa-filter"></i></span>
                        <ul class="filter-price-menu">
                            <li class="filter-price-title">Chọn theo giá</li>
                            <li class="price">
                                <a href="./product?category=<%=id_category%>&page=1&filter=1">
                                    Nhỏ hơn 50.000
                                </a>
                            </li>
                            <li class="price"><a href="./product?category=<%=id_category%>&page=1&filter=2">Từ 50.000
                                đến 100.000</a></li>
                            <li class="price"><a href="./product?category=<%=id_category%>&page=1&filter=3">Từ 100.000
                                đến 300.000</a></li>
                            <li class="price"><a href="./product?category=<%=id_category%>&page=1&filter=4">Từ 300.000
                                đến 500.000</a></li>
                            <li class="price"><a href="./product?category=<%=id_category%>&page=1&filter=5">Lớn hơn
                                500.000</a></li>
                        </ul>
                    </div>
                    <div class="box-filter">
                        <span>Sắp xếp theo</span>
                        <div class="sort-follow">
                            <span>Giá</span>
                            <i class="fa-solid fa-chevron-down"></i>
                            <ul class="sort-menu">
                                <li><a href="./product?category=<%=id_category%>&page=<%=pageCurrent%>">Mặc định</a>
                                </li>
                                <li><a href="./product?category=<%=id_category%>&page=<%=pageCurrent%>&order=asc">Giá từ
                                    thấp đến cao</a></li>
                                <li><a href="./product?category=<%=id_category%>&page=<%=pageCurrent%>&order=desc">Giá
                                    từ cao đến thấp</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="list__product">
                    <% for (Product product : listProduct) { %>
                    <div class="product-item">
                        <div class="product">
                            <a href="productDetail?id=<%= product.getId() %>"><img class="product-img"
                                                                                   src="<%=listImageThumbnail.get(product.getId())%>"
                                                                                   alt=""></a>
                            <div class="product-container__tittle">
                                <p class="product-title"><%=product.getName()%>
                                </p>
                            </div>

                            <p class="product-price">Giá: <%=nf.format(product.getPrice())%>đ
                            </p>
                            <%--                            TODO : quan : Xem chi tiet san pham--%>
                            <a href="productDetail?id=<%= product.getId() %>" class="product-order">Xem chi tiết</a>
                        </div>
                    </div>
                    <%}%>
                </div>
                <div class="pagination">
                    <% if (pageCurrent > 1) {%>
                    <a href="./product?category=<%=id_category%>&page=<%=pageCurrent-1%><%=filter%><%=sort%>"
                       class="other-page previous-page"><span>Trước</span></a>
                    <%}%>

                    <% for (int i = 1; i <= totalPage; i++) {%>
                    <% if (i == pageCurrent) {%>
                    <a href="./product?category=<%=id_category%>&page=<%=i%><%=filter%><%=sort%>" style="color: red;"
                       class="other-page"><span><%=i%></span></a>
                    <%} else {%>
                    <a href="./product?category=<%=id_category%>&page=<%=i%><%=filter%><%=sort%>"
                       class="other-page"><span><%=i%></span></a>
                    <%}%>
                    <%}%>
                    <% if (pageCurrent > 1 && pageCurrent < totalPage) {%>
                    <a href="./product?category=<%=id_category%>&page=<%=pageCurrent+1%><%=filter%><%=sort%>"
                       class="other-page next-page"><span>Sau</span></a>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
