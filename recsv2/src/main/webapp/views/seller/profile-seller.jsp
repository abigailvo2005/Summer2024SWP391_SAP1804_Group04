<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RECS - Profile</title>

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

    <!-- FontAwesome: icons used in website-->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
  </head>

  <body class="g-sidenav-show bg-gray-100">
    <!-- START: SIDEBAR -->
    <header>
      <jsp:include page="/views/seller/sidebar-seller.jsp" />
    </header>
    <!-- END SIDEBAR -->

    <main
      class="main-content no-dash position-relative max-height-vh-100 h-100 border-radius-lg"
    >
      <!-- START: Profile -->
      <div class="container-fluid py-4">
        <!--profile header: pfp, name, role-->
        <div
          class="page-header min-height-300 border-radius-xl mt-2"
          style="
            background-image: url('./../../template/assets/img/curved-images/curved-11.jpg');
            background-position-y: 50%;
          "
        >
          <span class="mask bg-gradient-primary opacity-6"></span>
        </div>
        <div class="card card-body blur shadow-blur mx-4 mt-n6 overflow-hidden">
          <div class="row gx-4">
            <div class="col-auto">
              <div class="avatar avatar-xl position-relative">
                <img
                  src="${account.gender == 0 ? './../../template/assets/img/male-pfp.png' : './../../template/assets/img/female-pfp.png'}"
                  alt="profile_image"
                  class="w-100 border-radius-lg shadow-sm"
                />
              </div>
            </div>
            <div class="col-auto my-auto">
              <div class="h-100">
                <h5 class="mb-1">${account.fullName}</h5>
                <p class="mb-0 font-weight-bold text-sm">
                  ${account.roleId}
                </p>
              </div>
            </div>
          </div>
        </div>

        <!--Information-->
        <div>
          <!--all detail profile information-->
          <div class="row">
            <div class="col-12 col-xl-6 mt-sm-4">
              <div class="card h-100">
                <div class="card-header pb-0 p-3">
                  <div class="row">
                    <div class="col-md-8 d-flex align-items-center">
                      <h6 class="mb-0">What can you do?</h6>
                    </div>
                  </div>
                </div>
                <div class="card-body p-3">
                  <p class="text-sm">
                    As a seller - you can upload your properties and relating
                    paperwork in order for RECS to validate whether your
                    properties are legally accepted by the government to be sold
                    or not. You can also view and track your properties while
                    they are being validated, posted for agencies to follow,
                    taken by an agency or had interested buyers or not.
                  </p>
                  <ul class="list-group">
                    <li class="list-group-item border-0 ps-0 pt-0 text-sm">
                      <strong class="text-dark">Username:</strong> &nbsp; ${account.username}
                    </li>
                    <li class="list-group-item border-0 ps-0 text-sm">
                      <strong class="text-dark">Gender:</strong> &nbsp; ${account.gender == 0 ? 'Male' : 'Female'}
                    </li>
                    <li class="list-group-item border-0 ps-0 text-sm">
                      <strong class="text-dark">Address:</strong> &nbsp; ${account.address}
                    </li>
                    <li class="list-group-item border-0 ps-0 text-sm">
                      <strong class="text-dark">Birthday:</strong> &nbsp;
                      ${account.birthDate}
                    </li>
                    <li class="list-group-item border-0 ps-0 text-sm">
                      <strong class="text-dark">Email:</strong> &nbsp;
                      ${account.email}
                    </li>
                    <li class="list-group-item border-0 ps-0 text-sm">
                      <strong class="text-dark">ID Number:</strong> &nbsp;
                      ${account.idCard}
                    </li>
                  </ul>
                </div>
              </div>
            </div>

            <!-- Update some information (password + phone number) -->
            <div class="col-12 col-xl-6 mt-sm-4">
              <div class="card h-100">
                <div class="card-header pb-0 p-3">
                  <h6 class="mb-0">Update Profile</h6>
                </div>
                <div class="card-body p-3">
                  <ul class="list-group">
                    <!--change phone number-->
                    <li
                      class="list-group-item border-0 d-flex align-items-center px-0 mb-2"
                    >
                      <div
                        class="navbar-toggler-icon d-flex justify-content-center my-1 mx-2"
                      >
                        <i class="fa-solid fa-phone"></i>
                      </div>

                      <div
                        class="d-flex align-items-start flex-column justify-content-center"
                      >
                        <h6 class="mb-0 text-sm">${account.phone}</h6>
                        <p class="mb-0 text-xs">Phone Number</p>
                      </div>

                      <div class="pe-1 ps-0 mb-0 ms-auto">
                        <a
                          class="btn btn-link pe-1 ps-1 mb-0 ms-auto"
                          href="javascript:;"
                          >Change</a
                        >
                      </div>
                    </li>

                    <!--change password-->
                    <li
                      class="list-group-item border-0 d-flex align-items-center px-0 mb-2"
                    >
                      <div
                        class="navbar-toggler-icon d-flex justify-content-center my-1 mx-2"
                      >
                        <i class="fa-solid fa-lock"></i>
                      </div>
                      <div
                        class="d-flex align-items-start flex-column justify-content-center"
                      >
                        <p class="mb-0 text-xs">Password</p>
                      </div>
                      <!-- eye open - viewable / eye close - not viewable -->
                      <div class="pe-1 ps-0 mb-0 ms-auto">
                        <div class="d-flex">
                          <!-- <a
                            class="btn btn-link pe-1 ps-1 mb-0 ms-auto"
                            href=""
                          >
                            <i class="fa-solid fa-eye"></i>
                          </a>
                          <a
                            class="btn btn-link pe-1 ps-1 mb-0 ms-auto position-absolute"
                            href="""
                          >
                            <i class="fa-solid fa-eye-slash"></i>
                          </a> -->
                          <a
                            class="btn btn-link pe-1 ps-1 mb-0 ms-auto"
                            href=""
                            >Change</a
                          >
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--END: Profile-->

      <!-- START FOOTER-->
      <footer class="footer pt-3">
        <div class="container-fluid">
          <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6 mb-lg-0 mb-4">
              <div
                class="copyright text-center text-sm text-muted text-lg-start"
              >
                ©
                <script>
                  document.write(new Date().getFullYear());
                </script>
                , made with <i class="fa fa-heart"></i> by
                <b>Team 4 - SAP1801</b>
              </div>
            </div>
            <div class="col-lg-6">
              <ul
                class="nav nav-footer justify-content-center justify-content-lg-end"
              >
                <li class="nav-item">
                  <a href="#" class="nav-link text-muted" target="_blank"
                    >About Us</a
                  >
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link text-muted" target="_blank"
                    >Team</a
                  >
                </li>
              </ul>
            </div>
          </div>
        </div>
      </footer>
      <!-- END: FOOTER -->
    </main>

    <!--   Core JS Files   -->
    <script src="/template/assets/js/core/popper.min.js"></script>
    <script src="/template/assets/js/core/bootstrap.min.js"></script>
    <script src="/template/assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/chartjs.min.js"></script>
    <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>

    <script>
      //URL REAL ESTATE API
      const urlUser = "http://localhost:8085/api/user/";

      //Load all information
    </script>
  </body>
</html>
