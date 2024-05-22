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

  <body class="g-sidenav-show bg-gray-100">
    <!-- START INCLUDE SIDEBAR -->
    <header>
      <jsp:include page="/WEB-INF/views/manager/sidebar-man.jsp" />
    </header>
    <!-- END INCLUDE SIDEBAR -->

    <main
      class="main-content no-dash position-relative max-height-vh-100 h-100 border-radius-lg"
    >
      <!-- START: List Processing Job -->
      <div class="row my-4 mx-2">
        <div class="mb-md-0 mb-4">
          <div class="card">
            <div class="card-header pb-0">
              <div class="row">
                <div class="col-lg-6 col-7">
                  <h6>Jobs On Hold</h6>
                  <p class="text-sm mb-0">
                    <i class="fa-solid fa-hourglass-start"></i>
                    <span class="font-weight-bold ms-1">4 requests</span>
                    pending
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
                        class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-5"
                      >
                        PROPERTY NAME
                      </th>
                      <th
                        class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                      >
                        Price
                      </th>
                      <th
                        class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                      >
                        Status
                      </th>
                      <th
                        class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                      >
                        Date Created
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
                    <!-- row 1: example request just submitted -->
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
                          <div class="d-flex flex-column justify-content-start">
                            <p class="mb-0 text-sm fw-bold text-dark">
                              Căn hộ studio 30m full đồ sang xịn ở Vinhome Smart
                              City Tây Mỗ
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
                              1.75 tỷ
                            </p>
                          </div>
                        </div>
                      </td>
                      <td class="align-middle">
                        <div class="d-flex px-2 py-1 justify-content-center">
                          <div
                            class="d-flex flex-column justify-content-center"
                          >
                            <p class="mb-0 text-sm fw-bold text-warning">
                              Submitted
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
                            <a href="#"><i class="fa-solid fa-eye"></i></a>
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
      <!-- END LIST 1-->

      <!-- START: List Processing Properties -->
      <div class="row my-4 mx-2">
        <div class="mb-md-0 mb-4">
          <div class="card">
            <div class="card-header pb-0">
              <div class="row">
                <div class="col-lg-6 col-7">
                  <h6>Responsibled Properties</h6>
                  <p class="text-sm mb-0">
                    <i class="fa-solid fa-house-user"></i>
                    <span class="font-weight-bold ms-1">3 properties</span>
                    being handled
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
                        class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-5"
                      >
                        PROPERTY NAME
                      </th>
                      <th
                        class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                      >
                        Price
                      </th>
                      <th
                        class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                      >
                        Status
                      </th>
                      <th
                        class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-3"
                      >
                        Date Created
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
                          <div class="d-flex flex-column justify-content-start">
                            <p class="mb-0 text-sm fw-bold text-dark">
                              Căn hộ studio 30m full đồ sang xịn ở Vinhome Smart
                              City Tây Mỗ
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
                              1.75 tỷ
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
                              Available
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
                            <a href="#"><i class="fa-solid fa-eye"></i></a>
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
      <!-- END LIST 2-->

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
    <script src="<c:url value='/template/assets/js/plugins/chartjs.min.js'/>"></script>
    <script src="<c:url value='/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7' />"></script>
  </body>
</html>
