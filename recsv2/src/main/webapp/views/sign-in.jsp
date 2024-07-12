<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RECS - Login</title>

    <!-- Link CSS -->
    <link
      id="pagestyle"
      href="/template/assets/css/soft-ui-dashboard.css?v=1.0.7"
      rel="stylesheet"
    />

    <!--Web's favicon-->
    <link
      rel="icon"
      type="image/png"
      href="/template/assets/img/logos/logo-no-name.png"
    />

    <!-- Fonts-->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
      rel="stylesheet"
    />
  </head>

  <body class="bg-gray-100">
    <!-- START MAIN FORM LOG IN -->
    <main class="main-content mt-0">
      <section>
        <div class="page-header min-vh-75">
          <div class="container">
            <div class="row">
              <div
                class="col-xl-5 col-lg-5 col-md-6 d-flex flex-column mx-auto"
              >
                <div class="card card-plain mt-8">
                  <!--logo on left section-->
                  <div class="card-header pb-0 bg-transparent">
                    <div style="text-align: center">
                      <img
                        src="/template/assets/img/logos/logo-og.png"
                        style="width: 50%"
                      />
                    </div>

                    <!-- Opening welcome text -->
                    <h3
                      class="font-weight-bolder text-info text-gradient"
                      style="margin-top: -1rem"
                    >
                      Welcome back
                    </h3>
                    <p class="mb-0">Enter your email and password to sign in</p>
                  </div>

                  <!-- Form to Login -->
                  <div class="card-body">
                    <form
                      role="form"
                      action="${pageContext.request.contextPath}/login"
                      method="post"
                    >
                      <label>Username</label>
                      <div class="mb-3">
                        <input
                          id="username"
                          name="username"
                          type="text"
                          class="form-control"
                          placeholder="Username"
                          aria-label="Username"
                        />
                      </div>
                      <label>Password</label>
                      <div class="mb-3 password-container-login">
                        <input
                          id="password"
                          name="password"
                          type="password"
                          class="form-control"
                          placeholder="Password"
                          aria-label="Password"
                        />
                        <button
                          type="button"
                          class="toggle-password"
                          data-toggle="#password"
                        >
                          <label>Show</label>
                        </button>
                      </div>
                      <c:if test="${not empty errorMessage}">
                          <p style="color: red">${errorMessage}</p>
                      </c:if>

                      <!-- sign in button -->
                      <div class="text-center">
                        <button
                          type="submit"
                          class="btn bg-gradient-info w-100 mt-4 mb-0"
                        >
                          Sign in
                        </button>
                      </div>
                      <c:if test="${not empty message}">   
                            <p class="suscessMessage">${message}</p>
                        </c:if>

                        <c:if test="${not empty messageReset}">   
                            <p class="suscessMessage">${messageReset}</p>
                        </c:if>
                    </form>
                  </div>

                  <!-- Reset password: optional - only add this function if have time -->
                  <div class="text-center pt-0 px-lg-2 px-1">
                    <p class="mb-4 text-sm mx-auto">
                      Don't remember your password?
                      <a
                        href="${pageContext.request.contextPath}/login/forget"
                        class="text-info text-gradient font-weight-bold"
                        >Reset Password</a
                      >
                    </p>
                  </div>
                </div>
              </div>

              <!-- right side image -->
              <div class="col-md-6">
                <div
                  class="oblique position-absolute top-0 h-100 d-md-block d-none me-n12"
                >
                  <div
                    class="oblique-image bg-cover position-absolute fixed-top ms-auto h-100 z-index-0 ms-n8"
                    style="
                      background-image: url(/template/assets/img/curved-images/login-background.jpeg);
                      background-position: center;
                      width: 50%;
                    "
                  ></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
    <!-- END MAIN FORM LOG IN -->

    <!-- START FOOTER -->
    <footer class="footer py-5">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mb-4 mx-auto text-center">
            <!-- optional function: introduce what our system's doing -->
            <a
              href="javascript:;"
              target="_blank"
              class="text-secondary me-xl-5 me-3 mb-sm-0 mb-2"
            >
              About Us
            </a>
            <!--optional function: introduce team member-->
            <a
              href=""
              target="_blank"
              class="text-secondary me-xl-5 me-3 mb-sm-0 mb-2"
            >
              Team
            </a>

            <div class="col-8 mx-auto text-center mt-1">
              <p class="mt-3 text-secondary">
                Copyright ©
                <script>
                  document.write(new Date().getFullYear());
                </script>
                RECS by Team 4 - SAP1804.
              </p>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- END FOOTER-->

    <!--   Core JS Files   -->
    <script src="/template/assets/js/core/bootstrap.min.js"></script>
    <script src="/template/assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script>
      function togglePassword(inputId) {
        var input = document.querySelector(inputId);
        if (input.type === "password") {
          input.type = "text";
        } else {
          input.type = "password";
        }
      }

      // Add event listeners to toggle password buttons
      document.querySelectorAll(".toggle-password").forEach(function (button) {
        var isShowing = false;
        button.addEventListener("click", function () {
          var toggleTarget = button.getAttribute("data-toggle");
          togglePassword(toggleTarget);
          if (isShowing) {
            button.innerHTML = "<label>Show</label>";
          } else {
            button.innerHTML = "<label>Hide</label>";
          }
          isShowing = !isShowing;
        });
      });
    </script>
  </body>
</html>
