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

  <body class="g-sidenav-show bg-gray-100" onload="makeTableScroll();">
    <!-- START INCLUDE SIDEBAR -->
    <header>
      <jsp:include page="/views/admin/sidebar-admin.jsp" />
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
                  <div class="col-lg-8 col-9">
                    <h6>All Register Requests</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-solid fa-house-user"></i>
                      <span class="font-weight-bold ms-1"
                        >${reqList.size()} request(s)</span
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
                        placeholder="Type username/full name/role here..."
                        onkeyup="searchTable('req')"
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
                            class="text-center text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                          >
                            accID
                          </th>
                          <th
                            class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3"
                          >
                            Name
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

                      <tbody>
                        <c:forEach items="${reqList}" var="req">
                          <tr class="req-row">
                            <td class="align-middle text-center text-sm">
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <p
                                    id="req-uname"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${req.accountId}
                                  </p>
                                </div>
                              </div>
                            </td>
                            <td>
                              <div class="d-flex justify-content-start">
                                <div
                                  class="d-flex flex-column justify-content-start"
                                >
                                  <p
                                    id="req-fname"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${req.fullName}
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
                                    id="req-role"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${req.roleId}
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
                                  <p class="mb-0 text-sm fw-bold text-dark"></p>
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
                                  <p class="mb-0 text-sm fw-bold text-muted">
                                    ${req.status}
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
                                    onclick="viewDetailRegisterRequest('${req.accountId}')"
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
      <!-- END LIST REGISTER REQUEST-->

      <!-- START: LIST ALL USERS IN SYSTEM -->
      <div class="container-fluid">
        <div class="row my-4">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-8 col-9">
                    <h6>All Users</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-solid fa-house-user"></i>
                      <span class="font-weight-bold ms-1"
                        >${allAccounts.size()} user(s)</span
                      >
                      in system
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
                        id="userSearch"
                        type="text"
                        class="form-control"
                        placeholder="Type username or full name here..."
                        onkeyup="searchTable('user')"
                      />
                    </div>
                  </div>
                </div>

                <div class="card-body px-0 pb-2">
                  <div class="table-responsive">
                    <table class="table align-items-center mb-0">
                      <thead>
                        <tr class="user-row">
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                          >
                            ID
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3"
                          >
                            Name
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
                      <tbody>
                        <c:forEach items="${allAccounts}" var="user">
                          <tr>
                            <td class="align-middle text-center text-sm">
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <p
                                    id="user-uname"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${user.accountId}
                                  </p>
                                </div>
                              </div>
                            </td>
                            <td>
                              <div class="d-flex justify-content-start">
                                <div
                                  class="d-flex flex-column justify-content-start"
                                >
                                  <p
                                    id="user-fname"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${user.fullName}
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
                                    id="user-role"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${user.roleId}
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
                                  <p class="mb-0 text-sm fw-bold text-dark">
                                    ${user.gender}
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
                                  <p class="mb-0 text-sm fw-bold text-muted">
                                    ${user.status}
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
                                    onclick="viewDetailUser()"
                                    class="show-detail"
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
    <script src="/template/assets/js/core/popper.min.js"></script>
    <script src="/template/assets/js/core/bootstrap.min.js"></script>
    <script src="/template/assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/chartjs.min.js"></script>
    <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- end: core js files -->

    <!--------------------START: POPUP SECTIONS-------------------- -->
    <div id="popup-register-request" class="popup-container hidden z-index-3">
      <div class="popup-content container-fluid">
        <!-- Header -->
        <div class="popup-header row mx-1">
          <div class="col-11">
            <h4
              id="popup-full-name"
              class="card-header font-weight-bolder mb-0"
            ></h4>
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
                        <strong class="text-dark">Superior ID:</strong>
                        <p id="popup-superior-id"></p>
                      </li>
                      <li class="list-group-item border-0 ps-0 text-sm">
                        <strong class="text-dark">Status:</strong>
                        <p id="popup-status"></p>
                      </li>
                    </div>

                    <div class="row">
                      <li class="list-group-item border-0 ps-0 text-sm col-6">
                        <strong class="text-dark">Username:</strong>
                        <p id="popup-username"></p>
                      </li>
                      <li class="list-group-item border-0 ps-0 text-sm col-6">
                        <strong class="text-dark">Email:</strong>
                        <p id="popup-email"></p>
                      </li>
                    </div>

                    <div class="row">
                      <li class="list-group-item border-0 ps-0 text-sm col-6">
                        <strong class="text-dark">Gender:</strong>
                        <p id="popup-gender"></p>
                      </li>
                      <li class="list-group-item border-0 ps-0 text-sm col-6">
                        <strong class="text-dark">Created on:</strong>
                        <p id="dateCreated">NaN</p>
                      </li>
                    </div>

                    <div class="row">
                      <li class="list-group-item border-0 ps-0 text-sm col-6">
                        <strong class="text-dark">Company ID:</strong>
                        <p id="popup-company-id"></p>
                      </li>
                      <li class="list-group-item border-0 ps-0 text-sm col-6">
                        <strong class="text-dark">role id</strong>
                        <p id="popup-id"></p>
                      </li>
                    </div>

                    <div class="row">
                      <li class="list-group-item border-0 ps-0 text-sm col-6">
                        <strong class="text-dark">Birth Date:</strong>
                        <p id="popup-birth-date"></p>
                      </li>
                      <li class="list-group-item border-0 ps-0 text-sm col-6">
                        <strong class="text-dark">Phone:</strong>
                        <p id="popup-phone"></p>
                      </li>
                    </div>

                    <div class="row">
                      <li class="list-group-item border-0 ps-0 text-sm col-6">
                        <strong class="text-dark">Role ID:</strong>
                        <p id="popup-role-id"></p>
                      </li>
                      <li class="list-group-item border-0 ps-0 text-sm">
                        <strong class="text-dark">ID Card:</strong>
                        <p id="popup-id-card"></p>
                      </li>
                    </div>

                    <div class="row">
                      <li class="list-group-item border-0 ps-0 col-6 text-sm">
                        <strong id="f-card" class="text-dark"
                          >ID Card (Front):</strong
                        >
                        &nbsp;
                        <img
                          class="id-card card-img mt-2"
                          src="/template/assets/img/id-front-demo.jpeg"
                          alt="id-front"
                        />
                      </li>
                      <li class="list-group-item border-0 ps-0 col-6 text-sm">
                        <strong id="b-card" class="text-dark"
                          >ID Card (Back):</strong
                        >
                        &nbsp;
                        <img
                          class="id-card card-img mt-2"
                          src="/template/assets/img/id-back-demo.jpeg"
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
    <!-- ---------------- END POPUP SECTION --------------------- -->

    <script type="text/javascript">
      function viewDetailRegisterRequest(userID) {
        console.log(userID);
        var popup = document.getElementById("popup-register-request");

        // Send GET Request API to retrieve single user information
        $.ajax({
          url: "http://localhost:8085/api/user/" + userID,
          type: "GET",
          success: function (data) {
            // Update popup với information chosen User
            $("#popup-username").text(data.username);
            $("#popup-role-id").text(data.roleId);
            $("#popup-full-name").text(data.fullName);
            $("#popup-gender").text(data.gender);
            $("#popup-email").text(data.email);
            $("#popup-phone").text(data.phone);
            $("#popup-address").text(data.address);
            $("#popup-id-card").text(data.idCard);
            $("#popup-status").text(data.status);
            $("#popup-birth-date").text(
              "Birthday: " + new Date(data.birthDate).toLocaleDateString()
            );
            $("#popup-superior-id").text(data.superiorId);
            $("#popup-member-id").text(data.memberId);
            $("#popup-company-id").text(data.companyId);

            popup.classList.remove("hidden");
          },
          error: function () {
            //Error when sending request
            console.error("Error fetching register request details");
          },
        });
      }

      function closeDetailRegisterRequest() {
        var popup = document.getElementById("popup-register-request");
        popup.classList.add("hidden");
      }

      //still forcely close every popup if clicked on somewhere else than close button
      window.onclick = function (event) {
        var popup = document.querySelector(".popup-container");
        if (event.target == popup) {
          popup.classList.add("hidden");
        }
      };

      //style table to have fixed heading and scrollable
      function makeTableScroll() {
        // Constant retrieved from server-side via JSP
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

      //display elements according to search value
      function searchTable(type) {
        //search for request register accounts
        if (type.includes("req")) {
          //Get values from input search
          var searchReq = document
            .getElementById("reqSearch")
            .value.toLowerCase();

          // Get all rows in table
          var requests = document.querySelectorAll(".req-row");

          requests.forEach(function (row) {
            var username = row
              .querySelector("#req-uname")
              .textContent.toLowerCase();
            var name = row
              .querySelector("#req-fname")
              .textContent.toLowerCase();
            var role = row.querySelector("#req-role").textContent.toLowerCase();
            if (
              username.includes(searchReq) ||
              name.includes(searchReq) ||
              role.includes(searchReq)
            ) {
              row.style.display = "";
            } else {
              row.style.display = "none";
            }
          });
        } else {
          //Get values from input search
          var searchReq = document
            .getElementById("userSearch")
            .value.toLowerCase();

          // Get all rows in table
          var requests = document.querySelectorAll(".user-row");

          requests.forEach(function (row) {
            var username = row
              .querySelector("#user-uname")
              .textContent.toLowerCase();
            var name = row
              .querySelector("#user-fname")
              .textContent.toLowerCase();
            var role = row
              .querySelector("#user-role")
              .textContent.toLowerCase();
            if (
              username.includes(searchReq) ||
              name.includes(searchReq) ||
              role.includes(searchReq)
            ) {
              row.style.display = "";
            } else {
              row.style.display = "none";
            }
          });
        }
      }
    </script>
  </body>
</html>
