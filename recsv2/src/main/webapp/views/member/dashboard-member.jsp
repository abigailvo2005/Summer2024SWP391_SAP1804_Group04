<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="jakarta.tags.core" prefix="c" %>

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

  <body class="g-sidenav-show bg-gray-100" onload="makeTableScroll()">
    <!-- START INCLUDE SIDEBAR -->
    <header>
      <jsp:include page="/views/member/sidebar-member.jsp" />
    </header>
    <!-- END INCLUDE SIDEBAR -->

    <main
      class="main-content no-dash position-relative max-height-vh-100 h-100 border-radius-lg"
    >
      <!-- START: LIST DEALS -->
      <div class="container-fluid">
        <div class="row my-4">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-8 col-9">
                    <h6>All Assigned Deals</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-solid fa-house-user"></i>
                      <span class="font-weight-bold ms-1"
                        >${dealList.size()} deal(s) were assigned</span
                      >
                      in total
                    </p>
                  </div>
                  <div
                    class="ms-md-auto pe-md-3 d-flex align-items-center col-lg-4 col-3"
                  >
                    <div class="input-group">
                      <span class="input-group-text text-body"
                        ><i class="fas fa-search" aria-hidden="true"></i
                      ></span>
                      <input
                        id="dealSearch"
                        type="text"
                        class="form-control"
                        placeholder="Type name/type here..."
                        onkeyup="searchTable('deal')"
                      />
                    </div>
                  </div>
                </div>

                <div class="card-body px-0 pb-2">
                  <div class="table-responsive">
                    <table class="table align-items-center mb-0">
                      <thead>
                        <tr>
                          <th
                            class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3"
                          >
                            PROPERTY NAME
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                          >
                            PRICE
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                          >
                            TYPE
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                          >
                            SUBMITTED DATE
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                          >
                            STATUS
                          </th>

                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                          >
                            VIEW DETAILS
                          </th>
                        </tr>
                      </thead>

                      <tbody>
                        <c:forEach items="${dealList}" var="deal">
                          <tr class="deal-row">
                            <td>
                              <div class="d-flex justify-content-start">
                                <div
                                  class="d-flex flex-column justify-content-start"
                                >
                                  <p
                                    id="req-name"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${deal.realEstate.name}
                                  </p>
                                </div>
                              </div>
                            </td>
                            <td>
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <p
                                    id="deal-price"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${deal.realEstate.textPrice}
                                  </p>
                                </div>
                              </div>
                            </td>
                            <td class="align-middle">
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <p
                                    id="deal-type"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${deal.realEstate.realEstateType}
                                  </p>
                                </div>
                              </div>
                            </td>
                            <td class="align-middle">
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <p
                                    id="deal-status"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${deal.createDate}
                                  </p>
                                </div>
                              </div>
                            </td>
                            <td class="align-middle">
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <p
                                    id="deal-status"
                                    class="mb-0 text-sm fw-bold status-color"
                                    value="${deal.status}"
                                  >
                                    ${deal.status}
                                  </p>
                                </div>
                              </div>
                            </td>

                            <td class="align-middle">
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <a
                                    class="show-detail"
                                    onclick="viewDetailProperty('${deal.realEstate.realEstateId}', 'deal')"
                                    ><i class="fa-solid fa-eye"></i
                                  ></a>
                                </div>
                              </div>
                            </td>
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
      <!-- END LIST DEALS-->

      <!-- START: LIST BUYER REQUESTS -->
      <div class="container-fluid">
        <div class="row my-4">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-8 col-9">
                    <h6>All Buyer Requests</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-solid fa-house-user"></i>
                      <span class="font-weight-bold ms-1"
                        >${buyerRequestList.size()} request(s) were
                        submitted</span
                      >
                      in total
                    </p>
                  </div>
                  <div
                    class="ms-md-auto pe-md-3 d-flex align-items-center col-lg-4 col-3"
                  >
                    <div class="input-group">
                      <span class="input-group-text text-body"
                        ><i class="fas fa-search" aria-hidden="true"></i
                      ></span>
                      <input
                        id="reqSearch"
                        type="text"
                        class="form-control"
                        placeholder="Type name/type here..."
                        onkeyup="searchTable('own')"
                      />
                    </div>
                  </div>
                </div>

                <div class="card-body px-0 pb-2">
                  <div class="table-responsive">
                    <table class="table align-items-center mb-0">
                      <thead>
                        <tr>
                          <th
                            class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3"
                          >
                            PROPERTY NAME
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                          >
                            PRICE
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                          >
                            BUYER
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                          >
                            SUBMITTED DATE
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                          >
                            STATUS
                          </th>

                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                          >
                            VIEW DETAILS
                          </th>
                        </tr>
                      </thead>

                      <tbody>
                        <c:forEach items="${buyerRequestList}" var="req">
                          <tr class="req-row">
                            <td>
                              <div class="d-flex justify-content-start">
                                <div
                                  class="d-flex flex-column justify-content-start"
                                >
                                  <p
                                    id="req-name"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${req.realEstateDTO.name}
                                  </p>
                                </div>
                              </div>
                            </td>
                            <td>
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <p
                                    id="req-price"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${req.realEstateDTO.textPrice}
                                  </p>
                                </div>
                              </div>
                            </td>
                            <td class="align-middle">
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <p
                                    id="req-type"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${req.fullName}
                                  </p>
                                </div>
                              </div>
                            </td>
                            <td class="align-middle">
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <p
                                    id="req-status"
                                    class="mb-0 text-sm fw-bold"
                                  >
                                    ${req.createDate}
                                  </p>
                                </div>
                              </div>
                            </td>
                            <td class="align-middle">
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <p
                                    id="req-status"
                                    class="mb-0 text-sm fw-bold status-color"
                                    value="${req.status.value}"
                                  >
                                    ${req.status.value}
                                  </p>
                                </div>
                              </div>
                            </td>

                            <td class="align-middle">
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <a
                                    class="show-detail"
                                    onclick="viewDetailProperty('${req.realEstateDTO.realEstateId}', 'req')"
                                    ><i class="fa-solid fa-eye"></i
                                  ></a>
                                </div>
                              </div>
                            </td>
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
      <!-- END LIST BUYER REQUESTS -->

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

    <!-- START POPUP REQUESTS -->
    <div id="popup-property-request" class="popup-container hidden z-index-3">
      <div class="popup-content container-fluid">
        <!-- Header -->
        <div class="popup-header row mx-1">
          <div class="col-11">
            <h4
              id="popup-name"
              class="card-header font-weight-bolder mb-0"
            ></h4>
          </div>
          <div class="col-1">
            <i
              class="fa-solid fa-xmark close-button"
              onclick="closeDetail()"
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
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                      >
                        <strong class="text-dark">Status:</strong>
                        <p id="popup-status"></p>
                      </li>
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6 d-flex req-only hidden"
                      >
                        <strong class="text-dark">Handled by:</strong>
                        <p id="popup-handle"></p>
                      </li>
                    </div>

                    <!-- image section & description for popup -->
                    <div class="row">
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-5 d-flex"
                      >
                        <strong class="text-dark">Description:</strong>
                        <p id="popup-desc"></p>
                      </li>
                      <div
                        id="image-section"
                        class="carousel slide mb-3 col-7"
                        data-bs-ride="carousel"
                      >
                        <div class="carousel-indicators"></div>
                        <div class="carousel-inner"></div>
                        <button
                          class="carousel-control-prev"
                          type="button"
                          data-bs-target="#image-section"
                          data-bs-slide="prev"
                        >
                          <span
                            class="carousel-control-prev-icon"
                            aria-hidden="true"
                          ></span>
                          <span class="visually-hidden">Previous</span>
                        </button>
                        <button
                          class="carousel-control-next"
                          type="button"
                          data-bs-target="#image-section"
                          data-bs-slide="next"
                        >
                          <span
                            class="carousel-control-next-icon"
                            aria-hidden="true"
                          ></span>
                          <span class="visually-hidden">Next</span>
                        </button>
                      </div>
                    </div>
                    <!-- end: image carousel -->

                    <div class="row">
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                      >
                        <strong class="text-dark">Type:</strong>
                        <p id="popup-type"></p>
                      </li>
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                      >
                        <strong class="text-dark">Address:</strong>
                        <p id="popup-address"></p>
                      </li>
                    </div>

                    <div class="row">
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                      >
                        <strong class="text-dark">Area:</strong>
                        <p id="popup-area"></p>
                      </li>
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                      >
                        <strong class="text-dark">Price:</strong>
                        <p id="popup-price"></p>
                      </li>
                    </div>

                    <div class="row land-info-section hidden">
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                      >
                        <strong class="text-dark">Land Type: </strong>
                        <p id="popup-land-type"></p>
                      </li>
                    </div>

                    <div class="house-info-section hidden">
                      <div class="row">
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                        >
                          <strong class="text-dark">House Type: </strong>
                          <p id="popup-house-type"></p>
                        </li>
                      </div>

                      <div class="row">
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-4 d-flex"
                        >
                          <strong class="text-dark">Built in: </strong>
                          <p id="popup-builtIn"></p>
                        </li>
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-4 d-flex"
                        >
                          <strong class="text-dark">Bedrooms: </strong>
                          <p id="popup-bed"></p>
                        </li>
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-4 d-flex"
                        >
                          <strong class="text-dark">Bathrooms: </strong>
                          <p id="popup-bath"></p>
                        </li>
                      </div>
                    </div>
                  </div>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END POPUP REQUESTS -->

    <!--   Core JS Files   -->
    <script src="/template/assets/js/core/popper.min.js"></script>
    <script src="/template/assets/js/core/bootstrap.min.js"></script>
    <script src="/template/assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/chartjs.min.js"></script>
    <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../../template/assets/js/general-features.js"></script>

    <!-- Internal JS -->
    <script>
      

      //style table to have fixed heading and scrollable
      function makeTableScroll() {
        var maxRows = 6;

        var tables = document.querySelectorAll(".table");

        tables.forEach(function (table) {
          var wrapper = table.parentNode;
          var rowsInTable = table.rows.length;
          var height = 20;

          if (rowsInTable > maxRows) {
            // Create a new wrapper element for the table
            var newWrapper = document.createElement("div");
            newWrapper.style.maxHeight = height + "rem";
            newWrapper.style.overflowY = "scroll";

            // Move the table into the new wrapper
            wrapper.parentNode.insertBefore(newWrapper, wrapper);
            newWrapper.appendChild(table);

            // Set the header to be fixed
            var header = table.getElementsByTagName("thead")[0];
            header.style.position = "sticky";
            header.style.top = "0";
            header.style.backgroundColor = "#fff"; // Set a background color to make the header visible
          }
        });
      }
      window.onload = function () {
        makeTableScroll();
      };

      //display elements according to search value
      function searchTable() {
        // Lấy giá trị từ ô input
        var searchInput = document
          .getElementById("reqSearch")
          .value.toLowerCase();

        // Retrieve all rows in a table
        var tableRows = document.querySelectorAll(".tbl-row");

        // Loop through each row and hide/unhide them based on search value
        tableRows.forEach(function (row) {
          var username = row.querySelector("#uname").textContent.toLowerCase();
          var fullname = row.querySelector("#fname").textContent.toLowerCase();
          if (
            username.includes(searchInput) ||
            fullname.includes(searchInput)
          ) {
            row.style.display = "";
          } else {
            row.style.display = "none";
          }
        });
      }
    </script>
  </body>
</html>
