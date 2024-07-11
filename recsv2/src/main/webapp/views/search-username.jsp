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
                      Send Username
                    </h3>
                    <p class="mb-0">Enter username to get confirmation message by email</p>
                  </div>

                  <!-- Form to Login -->
                  <div class="card-body">
                    <form
                      role="form"
                      action="${pageContext.request.contextPath}/login/forget"
                      method="post"
                    >
                      <label>USERNAME</label>
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



                      <!-- sign in button -->
                      <div class="text-center">
                        <a href="${pageContext.request.contextPath}/login" class="btn bg-light w-30 mt-4 mb-0">
                            Cancel
                        </a>
                        <button
                          type="submit"
                          class="btn bg-gradient-info w-30 mt-4 mb-0"
                        >
                          Send
                        </button>
                        
                      </div>
                    </form>
                  </div>
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
      
    </script>
  </body>
</html>
