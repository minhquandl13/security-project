<%@ page import="Model.Account" %>
<%@ page import="Model.Order" %>
<%@ page import="Service.OrderService" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="Model.Order_detail" %>
<%@ page import="java.util.*" %>
<%@ page import="DAO.OrderDAO" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UsersPage</title>
    <link href="css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="css/history.css">
    <link rel="stylesheet" href="css/user-page.css">
    <!--google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.4.2/js/all.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"></script>
    <script src="js/productDetail.js"></script>
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="css/templatemo.css">
    <script src="js/templatemo.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="wraperContent">
    <div class="container light-style flex-grow-1 container-p-y">
        <div class="card overflow-hidden">
            <div class="row no-gutters row-bordered row-border-light">
                <div class="col-md-3 pt-0">
                    <div class="list-group list-group-flush account-settings-links">
                        <a class="list-group-item list-group-item-action active" data-toggle="list"
                           href="#account-general">Tài khoản</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                           href="#account-change-password">Thay đổi mật khẩu</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                           href="#shopping-order">Thông tin đơn hàng</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                           href="#key-management">Quản lý khóa</a>
                    </div>
                </div>
                <%
                    Account account = (Account) session.getAttribute("account");
                    List<Order> orderListSS = OrderService.getInstance().showOrder(account.getID());
                %>
                <div class="col-md-9">
                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="account-general">
                            <div class="card-body media align-items-center">
                                <img src="assets/images/facebook-user-icon-19.jpg" alt
                                     class="d-block ui-w-80">
                            </div>
                            <hr class="border-light m-0">
                            <div class="card-body">
                                <div class="form-group">
                                    <%
                                        if (account.getFullname() == null) {
                                            account.setFullname(account.getName());
                                        }
                                    %>
                                    <label class="form-label">Họ và tên: <%= account.getFullname() %>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Email: <%= account.getEmail() %>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <%
                                        if (account.getNumberPhone() == null) {
                                            account.setNumberPhone("Chưa cập nhật");
                                        }
                                    %>
                                    <label class="form-label">Số điện thoại: <%= account.getNumberPhone() %>
                                    </label>
                                </div>
                                <button id="showFormButton" class="btn btn-primary">
                                    <h5>
                                        Chỉnh sửa thông tin
                                    </h5></button>
                                <a data-toggle="modal" data-target="#logout" class="btn btn-primary">
                                    <div>
                                        <div>
                                            <h5>Đăng xuất</h5>
                                        </div>
                                    </div>
                                </a>
                                <!-- Form for updating user information (initially hidden) -->
                                <form id="updateInfoForm" action="./ServletUpdateInfo" method="post"
                                      style="display: none;">
                                    <!-- Input fields for the update -->
                                    <div class="form-group">
                                        <label for="newFullname">Họ và tên mới:</label>
                                        <input type="text" id="newFullname" name="newFullname" class="form-control"
                                               required>
                                    </div>
                                    <!-- Submit button -->
                                    <button type="submit" class="btn btn-primary">Cập nhật thông tin</button>
                                </form>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="account-change-password">
                            <form action="./ServletPassChanging" method="post">
                                <div class="card-body pb-2">
                                    <%
                                        String successMessage = (String) request.getAttribute("success");
                                        String errorMessage = (String) request.getAttribute("error");
                                        Boolean passwordChanged = (Boolean) request.getAttribute("PassChange");
                                    %>
                                    <div class="form-group">
                                        <label class="form-label">Mật khẩu hiện tại</label>
                                        <input type="password" name="currentPassword" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Mật khẩu mới</label>
                                        <input id="password" type="password" name="newPassword" class="form-control"
                                               required>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Xác nhận lại mật khẩu mới</label>
                                        <input id="re-password" type="password" name="confirmNewPassword"
                                               class="form-control" required>
                                        <span id="message"></span>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Mã xác nhận</label>
                                        <input id="code" type="text" name="code"
                                               class="form-control" required>
                                        <span id="">Vui lòng ấn vào nút lấy mã xác nhận trước khi quý khách thực hiện đổi mật khẩu để nhận mã thông qua email</span>
                                    </div>

                                    <button type="submit" class="btn btn-primary">Thay đổi mật khẩu</button>

                                </div>
                            </form>
                            <form action="./ServletSendMail" method="post">
                                <button type="submit" class="btn btn-primary">Lấy mã</button>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="shopping-order">
                            <div class="card-body pb-2">
                                <div class="card mb-4">
                                    <div class="card-header">Đơn hàng của bạn</div>
                                    <div class="card-body p-0">
                                        <div class="table-responsive table-billing-history">
                                            <table class="table mb-0">
                                                <thead>
                                                <tr>
                                                    <th class="border-gray-200" scope="col">Mã đơn hàng</th>
                                                    <th class="border-gray-200" scope="col">Ngày đặt hàng</th>
                                                    <th class="border-gray-200" scope="col">Ngày giao hàng</th>
                                                    <th class="border-gray-200" scope="col">Số điện thoại</th>
                                                    <th class="border-gray-200" scope="col">Tình trạng</th>
                                                    <th class="border-gray-200" scope="col">Xác thực đơn hàng</th>
                                                    <th class="border-gray-200" scope="col">Thao tác</th>
                                                    <th class="border-gray-200" scope="col">Xem chi tiết</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <%
                                                        if (orderListSS == null) {
                                                            System.out.println("null");
                                                        }
                                                        for (Order order : orderListSS) {
                                                    %>
                                                    <td><%=order.getId()%>
                                                    <td><%=order.getDateBuy()%>
                                                    </td>
                                                    <td><%=order.getDateArrival()%>
                                                    </td>
                                                    <td><%=order.getNumberPhone()%>
                                                    </td>
                                                    <td><span class="badge bg-light text-dark">Đang giao hàng</span>
                                                    </td>
                                                    <td><%=OrderDAO.showResult_isVerifyOrder(order.getId())%></td>
                                                    <td>
                                                        <button type="button" class="btn btn-primary view-details-btn"
                                                                data-toggle="modal" data-target="#orderDetailsModal"
                                                                data-order-id="<%= order.getId() %>">
                                                            Xem Chi tiết
                                                        </button>
                                                    </td>
                                                    <td>

                                                    </td>
                                                </tr>
                                                <%}%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="key-management">
                            <div class="card-body pb-2">
                                <div class="card mb-4">
                                    <div class="card-header">Key Management</div>
                                    <div class="card-body">
                                        <form action="./ServletGenerateKey" method="post">
                                            <button type="submit" class="btn btn-primary">Generate New Key Pair</button>
                                        </form>
                                        <div class="mt-3">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th>Public Key</th>
                                                    <th>Created Date</th>
                                                    <th>Status</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${publicKeys}" var="key">
                                                    <tr>
                                                        <td><c:out value="${key.public_key}"/></td>
                                                        <td><c:out value="${key.created_date}"/></td>
                                                        <td><c:out
                                                                value="${key.is_active ? 'Active' : 'Inactive'}"/></td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="orderDetailsModal" tabindex="-1" role="dialog" aria-labelledby="orderDetailsModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="orderDetailsModalLabel">Chi tiết đơn hàng</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="orderDetailsContainer">
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="messageModalLabel">Kết quả thay đổi mật khẩu</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <% if (passwordChanged != null) { %>
                <% if (passwordChanged) { %>
                <div class="alert alert-success" role="alert">
                    Mật khẩu đã được thay đổi thành công.
                </div>
                <% } else { %>
                <div class="alert alert-danger" role="alert">
                    Lỗi khi thay đổi mật khẩu,vui lòng kiểm tra lại mật khẩu hiện tại của bạn
                </div>
                <% } %>
                <% } %>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="logout" tabindex="-1"
     role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"></h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <h4>Bạn có muốn đăng xuất</h4>
                    <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">Không
                    </button>
                    <a href="./ServletLogOut">
                        <button
                                type="button" class="btn btn-primary text-white">Có
                        </button>
                    </a>
                </div>
            </div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>
<div class="modal fade" id="verificationModal" tabindex="-1" role="dialog" aria-labelledby="verificationModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="verificationModalLabel">Enter Verification Code</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="verificationCodeForm" action="./ServletVerifyCode" method="post">
                    <div class="form-group">
                        <label for="verificationCode">Verification Code</label>
                        <input type="text" name="verificationCode" id="verificationCode" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Verify Code</button>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script>
    $(document).ready(function () {
        // Handle click event on "Xem Chi tiết" button within the modal
        $('#orderDetailsModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var orderId = button.data('order-id'); // Extract order ID from data attribute
            var modal = $(this);

            // Make AJAX request to fetch order details based on orderId
            $.ajax({
                url: 'OrderDetail.jsp', // URL to fetch order details (adjust this to your implementation)
                method: 'GET',
                data: {orderId: orderId},
                success: function (response) {
                    // Update modal content with fetched order details
                    modal.find('.modal-body #orderDetailsContainer').html(response);
                },
                error: function () {
                    // Handle error if AJAX request fails
                    modal.find('.modal-body #orderDetailsContainer').html('Error loading order details.');
                }
            });
        });
    });
    document.getElementById('showFormButton').addEventListener('click', function () {
        document.getElementById('updateInfoForm').style.display = 'block';
    });
    $(document).ready(function () {
        <% if (passwordChanged != null) { %>
        $('#messageModal').modal('show');
        <% } %>
        document.getElementById('confirmPasswordChange').addEventListener('click', function () {
            $('#messageModal').modal('show');
        });
    });
    $(() => {
        $('#password, #re-password').on('keyup', function () {
            if ($('#password').val() == "" && $('#re-password').val() == "") {
                $('#submit-pass').prop('disabled', true);
                $('#message').hide();
            } else if ($('#password').val() == $('#re-password').val()) {
                $('#submit-pass').prop('disabled', false);
                $('#message').show().html('Mật khẩu mới không khớp').css('color', 'green');
            } else {
                $('#submit-pass').prop('disabled', true);
                $('#message').show().html('Mật khẩu mới khớp').css('color', 'red');
            }
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>