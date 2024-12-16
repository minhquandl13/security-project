<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 5/15/2024
  Time: 10:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <!-- CSS Files -->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="https://unpkg.com/bs-brain@2.0.4/components/contacts/contact-1/assets/css/contact-1.css"/>
    <style>
        .social-icons {
            font-size: 1.5rem;
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 10px;
        }

        .contact-span {
            font-size: 1.25rem;
            text-align: center;
            display: block;
            margin-top: 10px;
        }

        .warning {
            font-size: 14px;
            color: red;

        }

        .contact-form-section {
            background: rgba(255, 255, 255, 0.8); /* Nền trắng với độ trong suốt */
            border-radius: 10px;
            padding: 20px;
        }

        .social-icons {
            font-size: 1.5rem;
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 10px;
        }

        .contact-span {
            font-size: 1.25rem;
            text-align: center;
            display: block;
            margin-top: 10px;
        }
    </style>

</head>
<body>
<!-- Contact 1 - Bootstrap Brain Component -->
<section class="bg-light py-3 py-md-5">
    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col-12 col-md-10 col-lg-8 col-xl-7 col-xxl-6">
                <h2 class="mb-4 display-5 text-center">Liên Hệ</h2>
                <p class="text-secondary mb-5 text-center">
                    Những phản hồi của bạn là rất quan trọng đối với chúng tôi.
                    Vui lòng điền thông tin vào biểu mẫu dưới đây và chúng tôi sẽ liên hệ với bạn trong thời gian sớm
                    nhất.</p>
                <hr class="w-50 mx-auto mb-5 mb-xl-9 border-dark-subtle">
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-12 col-lg-9">
                <div class="bg-white border rounded shadow-sm overflow-hidden">

                    <form action="./contract" method="post">
                        <div class="row gy-4 gy-xl-5 p-4 p-xl-5">
                            <div class="col-12">
                                <label for="fullName" class="form-label">Tên <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="fullName" name="fullname" value="" required>
                            </div>
                            <div class="col-12 col-md-6">
                                <label for="email" class="form-label">Email<span class="text-danger">*</span></label>
                                <div class="input-group">
                  <span class="input-group-text">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-envelope" viewBox="0 0 16 16">
                      <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
                    </svg>
                  </span>
                                    <input type="email" class="form-control" id="email" name="email" value="" required>
                                    <p class="warning">Vui lòng nhập 1 địa chỉ mail đúng để chúng tôi có thể liên hệ
                                        bạn</p>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <label for="phone" class="form-label">Số điện thoại</label>
                                <div class="input-group">
                  <span class="input-group-text">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-telephone" viewBox="0 0 16 16">
                      <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
                    </svg>
                  </span>
                                    <input type="tel" class="form-control" id="phone" name="phone" value="">
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="message" class="form-label">Nội dung <span
                                        class="text-danger">*</span></label>
                                <textarea class="form-control" id="message" name="message" rows="3" required></textarea>
                            </div>
                            <div class="col-12">
                                <div class="d-grid">
                                    <button class="btn btn-primary btn-lg" type="submit">Submit</button>
                                </div>
                                <div class="col-12">
                                    <span class="contact-span">Hoặc bạn có thể liên hệ chúng tôi qua:</span>
                                    <div class="social-icons">
                                        <a href="https://www.facebook.com" target="_blank">
                                            <img src="https://img.icons8.com/ios-filled/50/000000/facebook.png"
                                                 alt="Facebook"/>
                                        </a>
                                        <a href="https://zalo.me" target="_blank">
                                            <img src="https://img.icons8.com/ios-filled/50/000000/zalo.png" alt="Zalo"/>
                                        </a>
                                        <a href="https://telegram.org" target="_blank">
                                            <img src="https://img.icons8.com/ios-filled/50/000000/telegram-app.png"
                                                 alt="Telegram"/>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>

    </div>
</section>
<section class="bg-light py-3 py-md-5">
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-12 col-lg-9">
                <div class="bg-white border rounded shadow-sm overflow-hidden p-4">
                    <h3 class="mb-4">Thông tin liên hệ</h3>
                    <p><strong>Website:</strong> thuongmaidientu.ndfresh.vn</p>
                    <p><strong>Địa chỉ:</strong> 266 Đội Cấn, Ba Đình, Hà Nội</p>
                    <p><strong>Điện thoại:</strong> 19006750</p>
                    <p><strong>Email:</strong> support@sapo.vn</p>
                </div>
            </div>
        </div>
    </div>
</section>


</body>
</html>
