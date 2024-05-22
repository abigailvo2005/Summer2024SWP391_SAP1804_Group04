<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RECS - Profile</title>

     <!-- Link CSS -->
     <link
     id="pagestyle"
     href="<c:url value='/template/assets/css/soft-ui-dashboard.css?v=1.0.7' />"
     rel="stylesheet"
   />

   <!--Web's favicon-->
   <link
     rel="icon"
     type="image/png"
     href="<c:url value='/template/assets/img/logos/logo-no-name.png' />"
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
    <aside
      class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3"
      id="sidenav-main"
    >
      <!-- sidebar: menu section-->
      <div class="sidenav-header mt-0">
        <a
          class="navbar-brand m-0"
          href="../seller/dashboard-seller.html"
          target="_blank"
        >
          <img
            src="../../template/assets/img/logos/logo-no-name.png"
            class="navbar-brand-img h-100"
            alt="main_logo"
          />
          <span class="font-weight-bolder" style="margin-left: -0.5rem"
            >RECS</span
          >
        </a>
      </div>
      <hr class="horizontal dark mt-0" />
      <div class="collapse navbar-collapse w-auto" id="sidenav-collapse-main">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="../seller/dashboard-seller.html">
              <div
                class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i class="fa-solid fa-table-columns" style="color: #30221b"></i>
              </div>
              <span class="nav-link-text ms-1">Dashboard</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="../pages/profile-seller.html">
              <div
                class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i class="fa-solid fa-user"></i>
              </div>
              <span class="nav-link-text ms-1">Profile</span>
            </a>
          </li>
        </ul>
      </div>

      <!-- sidebar: create property and history track section-->
      <div class="sidenav-footer mx-3">
        <div
          class="card card-background shadow-none card-background-mask-secondary"
          id="sidenavCard"
        >
          <div
            class="full-background"
            style="
              background-image: url('../../template/assets/img/curved-images/white-curved.jpg');
            "
          ></div>
          <div class="card-body text-start p-3 w-100">
            <div class="docs-info">
              <h6 class="text-white up mb-0">Want to keep track?</h6>
              <p class="text-xs">
                View your successfully connected properties here.
              </p>
              <a
                href="../seller/history-seller.html"
                target="_self"
                class="btn btn-white btn-sm w-100 mb-0"
                >History</a
              >
            </div>
          </div>
        </div>
        <a
          class="btn bg-gradient-primary mt-3 w-100"
          href="../seller/create-property.html"
          >Create Property</a
        >
      </div>
    </aside>
    <!-- END SIDEBAR -->

    <main
      class="main-content position-relative max-height-vh-100 h-100 border-radius-lg"
    >
      <!-- START: Top Navbar -->
      <nav
        class="card navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl mt-4 px-2"
        id="navbarBlur"
        navbar-scroll="true"
      >
        <!--left side: page title-->
        <div class="container-fluid py-1 px-3">
          <nav aria-label="breadcrumb">
            <ol
              class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5"
            >
              <li class="breadcrumb-item text-sm">
                <a class="opacity-5 text-dark" href="javascript:;">Pages</a>
              </li>
              <li
                class="breadcrumb-item text-sm text-dark active"
                aria-current="page"
              >
                View Profile
              </li>
            </ol>
            <h6 class="font-weight-bolder mb-0">Profile</h6>
          </nav>

          <!-- right side: search & profile-->
          <div
            class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4"
            id="navbar"
          >
            <div class="ms-md-auto pe-md-3 d-flex align-items-center">
              <div class="input-group">
                <span class="input-group-text text-body"
                  ><i class="fas fa-search" aria-hidden="true"></i
                ></span>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Type here..."
                />
              </div>
            </div>
            <ul class="navbar-nav justify-content-end">
              <li class="nav-item d-flex align-items-center">
                <a href="#" class="nav-link text-body font-weight-bold px-0">
                  <i class="fa fa-user me-sm-1"></i>
                  <span class="d-sm-inline d-none">Welcome, LongND</span>
                </a>
              </li>
              <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                <a
                  href="javascript:;"
                  class="nav-link text-body p-0"
                  id="iconNavbarSidenav"
                >
                  <div class="sidenav-toggler-inner">
                    <i class="sidenav-toggler-line"></i>
                    <i class="sidenav-toggler-line"></i>
                    <i class="sidenav-toggler-line"></i>
                  </div>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- END: Nav Bar-->

      <!-- START: Profile -->
      <div class="container-fluid py-4">
        <!--profile header: pfp, name, role-->
        <div
          class="page-header min-height-300 border-radius-xl mt-2"
          style="
            background-image: url('../../template/assets/img/curved-images/profile-background.jpeg');
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
                  src="../../template/assets/img/male-pfp.png"
                  alt="profile_image"
                  class="w-100 border-radius-lg shadow-sm"
                />
              </div>
            </div>
            <div class="col-auto my-auto">
              <div class="h-100">
                <h5 class="mb-1">Nguyễn Đức Long</h5>
                <p class="mb-0 font-weight-bold text-sm">
                  Seller / Property Owner
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
                    taken by an agency or having interested buyers or not.
                  </p>
                  <ul class="list-group">
                    <li class="list-group-item border-0 ps-0 pt-0 text-sm">
                      <strong class="text-dark">Username:</strong> &nbsp; LongND
                    </li>
                    <li class="list-group-item border-0 ps-0 text-sm">
                      <strong class="text-dark">Gender:</strong> &nbsp; Male
                    </li>
                    <li class="list-group-item border-0 ps-0 text-sm">
                      <strong class="text-dark">Address:</strong> &nbsp; đường
                      số 1, phường Tân Phong, Quận 7, TP HCM, Việt Nam.
                    </li>
                    <li class="list-group-item border-0 ps-0 text-sm">
                      <strong class="text-dark">Birthday:</strong> &nbsp;
                      01/02/2003
                    </li>
                    <li class="list-group-item border-0 ps-0 text-sm">
                      <strong class="text-dark">Email:</strong> &nbsp;
                      longnd@gmail.com
                    </li>
                    <li class="list-group-item border-0 ps-0 text-sm">
                      <strong class="text-dark">ID Number:</strong> &nbsp;
                      0013349227592
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
                        <h6 class="mb-0 text-sm">0902283811</h6>
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
                        <div class="d-flex">
                          <h6 class="mb-0 text-sm">longnd2003@123</h6>
                          <h6 class="mb-0 text-sm position-absolute">
                            **************
                          </h6>
                        </div>
                        <p class="mb-0 text-xs">Password</p>
                      </div>

                      <!-- eye open - viewable / eye close - not viewable -->
                      <div class="pe-1 ps-0 mb-0 ms-auto">
                        <div class="d-flex">
                          <a
                            class="btn btn-link pe-1 ps-1 mb-0 ms-auto"
                            href="javascript:;"
                          >
                            <i class="fa-solid fa-eye"></i>
                          </a>
                          <a
                            class="btn btn-link pe-1 ps-1 mb-0 ms-auto position-absolute"
                            href="javascript:;"
                          >
                            <i class="fa-solid fa-eye-slash"></i>
                          </a>
                          <a
                            class="btn btn-link pe-1 ps-1 mb-0 ms-auto"
                            href="javascript:;"
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
    <script src="<c:url value='/template/assets/js/core/popper.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/core/bootstrap.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/plugins/perfect-scrollbar.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/plugins/smooth-scrollbar.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/plugins/chartjs.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7' />"></script>
  </body>
</html>
