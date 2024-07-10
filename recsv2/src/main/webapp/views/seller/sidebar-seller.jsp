<%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RECS - Dashboard</title>

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
    <aside
      class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 z-index-1 fixed-start ms-3"
      id="sidenav-main"
    >
      <!-- sidebar: menu section-->
      <div class="sidenav-header mt-0">
        <a
          class="navbar-brand m-0"
          href="${pageContext.request.contextPath}/seller/dashboard"
          target="_self"
        >
          <img
            src="/template/assets/img/logos/logo-no-name.png"
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
            <a
              class="nav-link ${currentPage == 'dashboard' ? 'active' : ''}"
              href="${pageContext.request.contextPath}/seller/dashboard"
            >
              <div
                class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i
                  class="fa-solid fa-table-columns"
                ></i>
              </div>
              <span class="nav-link-text ms-1">Dashboard</span>
            </a>
          </li>
          <li class="nav-item">
            <a
              class="nav-link ${currentPage == 'profile' ? 'active' : ''}"
              href="${pageContext.request.contextPath}/seller/profile"
            >
              <div
                class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i
                  class="fa-solid fa-user"
                ></i>
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
              background-image: url(/template/assets/img/curved-images/white-curved.jpg);
            "
          ></div>
          <div class="card-body text-start p-3 w-100">
            <div class="docs-info">
              <h6 class="text-white up mb-0">Want to keep track?</h6>
              <p class="text-xs">
                View your close properties here.
              </p>
              <a
                href="${pageContext.request.contextPath}/seller/history"
                target="_self"
                class="btn btn-white btn-sm w-100 mb-0"
                >History</a
              >
            </div>
          </div>
        </div>
        <a
          class="btn bg-gradient-primary mt-3 w-100"
          href="${pageContext.request.contextPath}/seller/create-property"
          >Create Property</a
        >
      </div>
    </aside>
    <!-- END SIDEBAR -->

    <!-- START RIGHT SIDE-->
    <main
      class="main-content position-relative max-height-vh-100 h-100 border-radius-lg mt-3 z-index-0"
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
                ${currentPage == 'dashboard' ? 'Dashboard' : (currentPage ==
                'profile' ? 'View Profile' : (currentPage == 'history' ?
                'View History' : (currentPage == 'create-property' ? 'Create
                Property' : '')))}
              </li>
            </ol>
            <h6 class="font-weight-bolder mb-0">
              ${currentPage == 'dashboard' ? 'Dashboard' : (currentPage ==
              'profile' ? 'Profile' : (currentPage == 'history' ?
              'History' : (currentPage == 'create-property' ? 'Create Property'
              : '')))}
            </h6>
          </nav>

          <!-- right side: search & profile-->
          <div
            class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4"
            id="navbar"
          >
            <div class="ms-md-auto pe-md-3 d-flex align-items-center">
            </div>
            <ul class="navbar-nav justify-content-end">
              <li class="nav-item d-flex align-items-center">
                <a href="#" class="nav-link text-body font-weight-bold px-0">
                  <i class="fa fa-user me-sm-1"></i>
                  <span class="d-sm-inline d-none">Welcome, ${fullName}</span>
                </a>
              </li>
              <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                <a
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
              <div class="ms-md-auto pe-md-3 d-flex align-items-center"></div>
              <li class="nav-item d-flex align-items-center">
                <i id="logoutButton" class="fa-solid fa-right-from-bracket"></i>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- END: Nav Bar -->
    </main>

    <!--   Core JS Files   -->
    <script src="/template/assets/js/core/bootstrap.min.js"></script>
    <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
    <script>
      document
        .getElementById("logoutButton")
        .addEventListener("click", function () {
          var userConfirmation = confirm("Are you sure you want to sign out?");
          if (userConfirmation) {
            window.location.href = "${pageContext.request.contextPath}/logout";
          } else {
            alert("Logout canceled.");
          }
        });
    </script>
  </body>
</html>
