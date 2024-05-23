<%@ include file="/common/taglib.jsp" %> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ include
file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RECS - Dashboard</title>

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

  <body class="g-sidenav-show bg-gray-100" onload="makeTableScroll();">
    <!-- START INCLUDE SIDEBAR -->
    <header>
      <jsp:include page="/WEB-INF/views/admin/sidebar-admin.jsp" />
    </header>
    <!-- END INCLUDE SIDEBAR -->

    <!-- START DASHBOARD MAIN CONTENT -->
    <main
      class="main-content no-dash position-relative max-height-vh-100 h-100 border-radius-lg"
    >
      <!-- START: LIST REGISTER REQUEST -->
      <div class="container-fluid">
        <div class="row my-4">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-6 col-7">
                    <h6>Staff Register Requests</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-solid fa-house-user"></i>
                      <span class="font-weight-bold ms-1">1 request(s)</span>
                      in total
                    </p>
                  </div>
                </div>
              </div>

              <div class="card-body px-0 pb-2">
                <div class="table-responsive">
                  <table class="table align-items-center mb-0">
                    <thead>
                      <tr>
                        <th
                          class="text-center text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                        >
                          ID
                        </th>
                        <th
                          class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3"
                        >
                          NAME
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                        >
                          Role
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                        >
                          Date Created
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                        >
                          Status
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                        >
                          View Details
                        </th>
                      </tr>
                    </thead>
                    <!--input list of validating requests here - only 1 row for reference-->
                    <tbody>
                      <!-- row 1: example property has been posted & available -->
                      <tr>
                        <td class="align-middle text-center text-sm">
                          <div class="d-flex px-2 py-1 justify-content-center">
                            <div
                              class="d-flex flex-column justify-content-center"
                            >
                              <p class="mb-0 text-sm fw-bold text-dark">01</p>
                            </div>
                          </div>
                        </td>
                        <td>
                          <div class="d-flex justify-content-start">
                            <div
                              class="d-flex flex-column justify-content-start"
                            >
                              <p class="mb-0 text-sm fw-bold text-dark">
                                Hoàng Việt Hùng
                              </p>
                            </div>
                          </div>
                        </td>
                        <td>
                          <div class="d-flex px-2 py-1 justify-content-center">
                            <div
                              class="d-flex flex-column justify-content-center"
                            >
                              <p class="mb-0 text-sm fw-bold text-dark">
                                Staff
                              </p>
                            </div>
                          </div>
                        </td>
                        <td class="align-middle">
                          <div class="d-flex px-2 py-1 justify-content-center">
                            <div
                              class="d-flex flex-column justify-content-center"
                            >
                              <p class="mb-0 text-sm fw-bold text-dark">
                                20/05/2024
                              </p>
                            </div>
                          </div>
                        </td>
                        <td class="align-middle">
                          <div class="d-flex px-2 py-1 justify-content-center">
                            <div
                              class="d-flex flex-column justify-content-center"
                            >
                              <p class="mb-0 text-sm fw-bold text-muted">
                                Reviewing
                              </p>
                            </div>
                          </div>
                        </td>
                        <td class="align-middle">
                          <div class="d-flex px-2 py-1 justify-content-center">
                            <div
                              class="d-flex flex-column justify-content-center"
                            >
                              <a
                                class="show-detail"
                                onclick="viewDetailRegisterRequest()"
                                ><i class="fa-solid fa-eye"></i
                              ></a>
                            </div>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- END LIST REGISTER REQUEST-->

      <!-- START: LIST ALL USERS IN SYSTEM -->
      <div class="container-fluid">
        <div class="row my-4">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-6 col-7">
                    <h6>All Users</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-solid fa-house-user"></i>
                      <span class="font-weight-bold ms-1">1 user(s)</span>
                      in system
                    </p>
                  </div>
                </div>
              </div>

              <div class="card-body px-0 pb-2">
                <div class="table-responsive">
                  <table class="table align-items-center mb-0">
                    <thead>
                      <tr>
                        <th
                          class="text-center text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                        >
                          ID
                        </th>
                        <th
                          class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3"
                        >
                          NAME
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                        >
                          Role
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                        >
                          Gender
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                        >
                          Status
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                        >
                          View Details
                        </th>
                      </tr>
                    </thead>
                    <!--input list of validating requests here - only 1 row for reference-->
                    <tbody>
                      <!-- row 1: example property has been posted & available -->
                      <tr>
                        <td class="align-middle text-center text-sm">
                          <div class="d-flex px-2 py-1 justify-content-center">
                            <div
                              class="d-flex flex-column justify-content-center"
                            >
                              <p class="mb-0 text-sm fw-bold text-dark">01</p>
                            </div>
                          </div>
                        </td>
                        <td>
                          <div class="d-flex justify-content-start">
                            <div
                              class="d-flex flex-column justify-content-start"
                            >
                              <p class="mb-0 text-sm fw-bold text-dark">
                                Nguyễn Đức Long
                              </p>
                            </div>
                          </div>
                        </td>
                        <td>
                          <div class="d-flex px-2 py-1 justify-content-center">
                            <div
                              class="d-flex flex-column justify-content-center"
                            >
                              <p class="mb-0 text-sm fw-bold text-dark">
                                Manager
                              </p>
                            </div>
                          </div>
                        </td>
                        <td class="align-middle">
                          <div class="d-flex px-2 py-1 justify-content-center">
                            <div
                              class="d-flex flex-column justify-content-center"
                            >
                              <p class="mb-0 text-sm fw-bold text-dark">Male</p>
                            </div>
                          </div>
                        </td>
                        <td class="align-middle">
                          <div class="d-flex px-2 py-1 justify-content-center">
                            <div
                              class="d-flex flex-column justify-content-center"
                            >
                              <p class="mb-0 text-sm fw-bold text-muted">
                                Active
                              </p>
                            </div>
                          </div>
                        </td>
                        <td class="align-middle">
                          <div class="d-flex px-2 py-1 justify-content-center">
                            <div
                              class="d-flex flex-column justify-content-center"
                            >
                              <a onclick="viewDetailUser()" class="show-detail"
                                ><i class="fa-solid fa-eye"></i
                              ></a>
                            </div>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- END LIST ALL USERS IN SYSTEM-->

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
    <!-- END DASHBOARD MAIN CONTENT -->

    <!--   Core JS Files   -->
    <script src="<c:url value='/template/assets/js/core/popper.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/core/bootstrap.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/plugins/perfect-scrollbar.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/plugins/smooth-scrollbar.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/plugins/chartjs.min.js'/>"></script>
    <script src="<c:url value='/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7' />"></script>

    <!-- end: core js files -->

    <!--------------------START: POPUP SECTIONS-------------------- -->
    <div id="popup-register-request" class="popup-container hidden z-index-3">
      <div class="popup-content container-fluid">
        <!-- Header -->
        <div class="popup-header row mx-1">
          <div class="col-11">
            <h4
              id="registered-name"
              class="card-header font-weight-bolder mb-0"
            >
              Hoàng Việt Hùng
            </h4>
          </div>
          <div class="col-1">
            <i
              class="fa-solid fa-xmark close-button"
              onclick="closeDetailRegisterRequest()"
            ></i>
          </div>
        </div>

        <!-- Request content -->
        <div class="row">
          <div class="col-12 mt-sm-1">
            <div class="card h-100">
              <div class="card-body p-3">
                <ul class="list-group">
                  <div class="container-fluid">
                    <div class="row">
                      <li class="list-group-item border-0 ps-0 text-sm col-6">
                        <strong class="text-dark">Account ID:</strong> &nbsp;
                        HungHV
                      </li>
                      <li class="list-group-item border-0 ps-0 text-sm col-6">
                        <strong class="text-dark">Gender:</strong> &nbsp; Male
                      </li>
                    </div>

                    <div class="row">
                      <li class="list-group-item border-0 ps-0 text-sm col-6">
                        <strong class="text-dark">Email:</strong> &nbsp;
                        hoangviethung@gmail.com
                      </li>
                      <li class="list-group-item border-0 ps-0 text-sm col-6">
                        <strong class="text-dark">Birthday:</strong> &nbsp;
                        01/02/2003
                      </li>
                    </div>

                    <div class="row">
                      <li class="list-group-item border-0 ps-0 text-sm col-6">
                        <strong class="text-dark">Phone:</strong> &nbsp;
                        09128382948
                      </li>
                      <li class="list-group-item border-0 ps-0 text-sm col-6">
                        <strong class="text-dark">Role:</strong> &nbsp; Staff
                      </li>
                    </div>

                    <div class="row">
                      <li class="list-group-item border-0 ps-0 text-sm">
                        <strong class="text-dark">ID Number:</strong> &nbsp;
                        0013349227592
                      </li>
                    </div>

                    <div class="row">
                      <li class="list-group-item border-0 ps-0 col-6 text-sm">
                        <strong class="text-dark">ID Card (Front):</strong>
                        &nbsp;
                        <img
                          class="id-card card-img mt-2"
                          src="<c:url value='/template/assets/img/id-front-demo.jpeg'/>"
                          alt="id-front"
                        />
                      </li>
                      <li class="list-group-item border-0 ps-0 col-6 text-sm">
                        <strong class="text-dark">ID Card (Back):</strong>
                        &nbsp;
                        <img
                          class="id-card card-img mt-2"
                          src="<c:url value='/template/assets/img/id-back-demo.jpeg'/>"
                          alt="id-back"
                        />
                      </li>
                    </div>
                  </div>
                </ul>
              </div>
            </div>
          </div>

          <!-- Buttons to decide if wanted to approve user or not -->
          <div class="col-12 mt-1">
            <div class="h-100 container-fluid mt-0">
              <div class="row justify-content-center">
                <div class="col-auto">
                  <button
                    type="button"
                    onclick="adminResponse()"
                    class="btn btn-success w-100 my-2 mb-2"
                  >
                    Approve
                  </button>
                </div>

                <div class="col-auto">
                  <button
                    type="button"
                    onclick="adminResponse()"
                    class="btn btn-danger w-100 my-2 mb-2"
                  >
                    Decline
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- JS MODIFY POPUP -->
    <script>
      var maxRows = 5;
      function makeTableScroll() {
        //set limit each display only allow 5 rows for a list
        var table = document.querySelector(".table");
        var wrapper = table.parentNode;
        var rowsInTable = table.rows.length;
        var height = 0;
        if (rowsInTable > maxRows) {
          for (var i = 0; i < maxRows; i++) {
            height += table.rows[i].clientHeight;
          }
          wrapper.style.height = height + "px";
        }
      }

      // Get the popup container and close button
      const popupRegisterRequest = document.getElementById(
        "popup-register-request"
      );
      const closeButton = document.querySelector(".close-button");

      // Show popup view detail register
      function viewDetailRegisterRequest() {
        popupRegisterRequest.classList.remove("hidden");
      }

      //Close popup view detail register
      function closeDetailRegisterRequest() {
        popupRegisterRequest.classList.add("hidden");
      }

      //Show popup view detail user
      function viewDetailUser() {
        popupRegisterRequest.classList.remove("hidden");
      }

      function adminResponse() {
        //update db --> is user activate/denied
      }
    </script>

    <!-- ---------------- END POPUP SECTION --------------------- -->
  </body>
</html>
