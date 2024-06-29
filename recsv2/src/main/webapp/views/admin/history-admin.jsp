<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>RECS - History</title>

            <!-- Link CSS -->
            <link id="pagestyle" href="/template/assets/css/soft-ui-dashboard.css?v=1.0.7" rel="stylesheet" />

            <!--Web's favicon-->
            <link rel="icon" type="image/png" href="/template/assets/img/logos/logo-no-name.png" />

            <!-- Fonts-->
            <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />

            <!-- FontAwesome: icons used in website-->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
        </head>

        <body class="g-sidenav-show bg-gray-100" onload="makeTableScroll();">
            <!-- START: SIDEBAR -->
            <header>
                <jsp:include page="/views/admin/sidebar-admin.jsp" />
            </header>
            <!-- END SIDEBAR -->


            <main class="main-content no-dash position-relative max-height-vh-100 h-100 border-radius-lg">
                <!--Start history list account approved-->
                <div class="container-fluid">
                    <div class="row my-4">
                        <div class="mb-md-0 mb-4">
                            <div class="card">
                                <div class="card-header pb-0">
                                    <div class="row">
                                        <div class="col-lg-8 col-9">
                                            <h6>History Account Created</h6>
                                            <p class="text-sm mb-0">
                                                <i class="fa-regular fa-comment-dots"></i>
                                                <span class="font-weight-bold ms-1">${listAccountActive.size()}
                                                    available(s)</span>
                                                in total
                                            </p>
                                        </div>
                                        <div class="ms-md-auto pe-md-3 d-flex align-items-center col-lg-4 col-3">
                                            <div class="input-group">
                                                <span class="input-group-text text-body"><i class="fas fa-search"
                                                        aria-hidden="true"></i></span>
                                                <input id="searchInput" type="text" class="form-control"
                                                    placeholder="Type property name here..." onkeyup="searchTable('active')" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card-body px-0 pb-2">
                                        <div class="table-responsive">
                                            <table class="table align-items-center mb-0">
                                                <thead>
                                                    <tr>
                                                        <th
                                                            class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3">
                                                            ID
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            Name
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2">
                                                            Role
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            Gender
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            Status
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            View Details
                                                        </th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:forEach items="${listAccountActive}" var="active">
                                                        <tr class="validate-row">
                                                            <td>
                                                                <div class="d-flex justify-content-start">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-start">
                                                                        <p id="account-name"
                                                                            class="mb-0 text-sm fw-bold text-dark">
                                                                            ${active.accountId}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p  id = "account-fullname"
                                                                            class="mb-0 text-sm fw-bold text-dark">
                                                                            ${active.fullName}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p  id = "account-role"
                                                                            class="mb-0 text-sm fw-bold text-dark">
                                                                            ${active.roleId}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p class="mb-0 text-sm fw-bold text-muted">
                                                                            ${active.gender}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p class="mb-0 text-sm fw-bold text-muted">
                                                                            ${active.status}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <a class="show-detail"
                                                                            onclick="viewDetail('${active.accountId}')"><i
                                                                                class="fa-solid fa-eye"></i></a>
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
                <!--End history list account approved-->
                <!--Start history list account banned-->
                <div class="container-fluid">
                    <div class="row my-4">
                        <div class="mb-md-0 mb-4">
                            <div class="card">
                                <div class="card-header pb-0">
                                    <div class="row">
                                        <div class="col-lg-8 col-9">
                                            <h6>History Account Declined</h6>
                                            <p class="text-sm mb-0">
                                                <i class="fa-regular fa-comment-dots"></i>
                                                <span class="font-weight-bold ms-1">${listAccountBan.size()}
                                                    account declined</span>
                                                in total
                                            </p>
                                        </div>
                                        <div class="ms-md-auto pe-md-3 d-flex align-items-center col-lg-4 col-3">
                                            <div class="input-group">
                                                <span class="input-group-text text-body"><i class="fas fa-search"
                                                        aria-hidden="true"></i></span>
                                                <input id="searchInputDecl" type="text" class="form-control"
                                                    placeholder="Type property name here..." onkeyup="searchTable('decline')" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card-body px-0 pb-2">
                                        <div class="table-responsive">
                                            <table class="table align-items-center mb-0">
                                                <thead>
                                                    <tr>
                                                        <th
                                                            class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3">
                                                            ID
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            Name
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2">
                                                            Role
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            Gender
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            Status
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            View Details
                                                        </th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:forEach items="${listAccountDeclined}" var="declined">
                                                        <tr class="decline-row">
                                                            <td>
                                                                <div class="d-flex justify-content-start">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-start">
                                                                        <p id="decline-name"
                                                                            class="mb-0 text-sm fw-bold text-dark">
                                                                            ${declined.accountId}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p  id="decline-fullname"
                                                                            class="mb-0 text-sm fw-bold text-dark">
                                                                            ${declined.fullName}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p id = "decline-role"
                                                                            class="mb-0 text-sm fw-bold text-dark">
                                                                            ${declined.roleId}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p class="mb-0 text-sm fw-bold text-muted">
                                                                            ${declined.gender}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p class="mb-0 text-sm fw-bold text-muted">
                                                                            ${declined.status}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <a class="show-detail"
                                                                            onclick="viewDetail('${declined.accountId}')"><i
                                                                                class="fa-solid fa-eye"></i></a>
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
                <!--End history list account banned-->
                <!-- START FOOTER-->
                <footer class="footer pt-3">
                    <div class="container-fluid">
                        <div class="row align-items-center justify-content-lg-between">
                            <div class="col-lg-6 mb-lg-0 mb-4">
                                <div class="copyright text-center text-sm text-muted text-lg-start">
                                    ©
                                    <script>
                                        document.write(new Date().getFullYear());
                                    </script>
                                    , made with <i class="fa fa-heart"></i> by
                                    <b>Team 4 - SAP1801</b>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                                    <li class="nav-item">
                                        <a href="#" class="nav-link text-muted" target="_blank">About Us</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link text-muted" target="_blank">Team</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- END: FOOTER -->
            </main>
            <!--------------------START: POPUP SECTIONS-------------------- -->
            <div id="popup-user-request" class="popup-container hidden z-index-3">
                <div class="popup-content container-fluid">
                    <!-- Header -->
                    <div class="popup-header row mx-1">
                        <div class="col-11">
                            <h4 id="popup-full-name" class="card-header font-weight-bolder mb-0"></h4>
                        </div>
                        <div class="col-1">
                            <i class="fa-solid fa-xmark close-button" onclick="closeDetailRegisterRequest()"></i>
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
                                                    <strong class="text-dark">User ID: </strong>
                                                    <p id="popup-id"></p>
                                                </li>
                                                <li class="list-group-item border-0 ps-0 text-sm col-6">
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
                                                <li class="list-group-item border-0 ps-0 text-sm col-6 company hidden">
                                                    <strong class="text-dark">Company ID:</strong>
                                                    <p id="popup-company-id"></p>
                                                </li>
                                                <li class="list-group-item border-0 ps-0 text-sm col-6 superior hidden">
                                                    <strong class="text-dark">Superior ID:</strong>
                                                    <p id="popup-superior-id"></p>
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
                                                    <strong id="f-card" class="text-dark">ID Card (Front):</strong>
                                                    &nbsp;
                                                    <img class="id-card card-img mt-2"
                                                        src="/template/assets/img/id-front-demo.jpeg" alt="id-front" />
                                                </li>
                                                <li class="list-group-item border-0 ps-0 col-6 text-sm">
                                                    <strong id="b-card" class="text-dark">ID Card (Back):</strong>
                                                    &nbsp;
                                                    <img class="id-card card-img mt-2"
                                                        src="/template/assets/img/id-back-demo.jpeg" alt="id-back" />
                                                </li>
                                            </div>
                                        </div>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ---------------- END POPUP SECTION --------------------- -->
            <!--   Core JS Files   -->
            <script src="/template/assets/js/core/popper.min.js"></script>
            <script src="/template/assets/js/core/bootstrap.min.js"></script>
            <script src="/template/assets/js/plugins/perfect-scrollbar.min.js"></script>
            <script src="/template/assets/js/plugins/smooth-scrollbar.min.js"></script>
            <script src="/template/assets/js/plugins/chartjs.min.js"></script>
            <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <!--end: core js files-->

            <script type="text/javascript">
                function viewDetail(userID) {
                    var popup = document.getElementById("popup-user-request");
                    var superior = document.querySelector(".superior");
                    var company = document.querySelector(".company");

                    // Send GET Request API to retrieve single user information
                    $.ajax({
                        url: "http://localhost:8085/api/user/" + userID,
                        type: "GET",
                        success: function (data) {
                            // Update popup với information chosen User
                            $("#popup-id").text(data.accountId);
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
                                new Date(data.birthDate).toLocaleDateString()
                            );

                            //only shows company data if is agency/member
                            if (
                                data.roleId === "ROLE_AGENCY" ||
                                data.roleId === "ROLE_MEMBER"
                            ) {
                                $("#popup-company-id").text(data.companyId);
                                company.classList.remove("hidden");
                            }

                            //only shows superior data if is member/staff
                            if (data.roleId === "ROLE_STAFF") {
                                $("#popup-superior-id").text(data.managerId);
                                superior.classList.remove("hidden");
                            } else if (data.roleId === "ROLE_MEMBER") {
                                $("#popup-superior-id").text(data.agencyId);
                                superior.classList.remove("hidden");
                            }

                            popup.classList.remove("hidden");
                        },
                        error: function () {
                            //Error when sending request
                            console.error("Error fetching register request details");
                        },
                    });
                }

                function closeDetailRegisterRequest() {
                    var popup = document.getElementById("popup-user-request");
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
        if(type.includes("active")) {
          //Get values from input search
          var searchUser = document
            .getElementById("searchInput")
            .value.toLowerCase();

          // Get all rows in table
          var user = document.querySelectorAll(".validate-row");


          user.forEach(function (row) {
            var username = row
              .querySelector("#account-name")
              .textContent.toLowerCase();
            var name = row
              .querySelector("#account-fullname")
              .textContent.toLowerCase();
            var role = row
              .querySelector("#account-role")
              .textContent.toLowerCase();

              console.log("Checking row:", row, "Username:", username, "Full Name:", name);
            if (
              username.includes(searchUser) ||
              name.includes(searchUser) ||
              role.includes(searchUser)
            ) {
              row.style.display = "";
            } else {
              row.style.display = "none";
            }
          });
        } else {
            //Get values from input search
          var searchAccount = document
            .getElementById("searchInputDecl")
            .value.toLowerCase();

          // Get all rows in table
          var user = document.querySelectorAll(".decline-row");


          user.forEach(function (row) {
            var usernamedecl = row
              .querySelector("#decline-name")
              .textContent.toLowerCase();
            var namedecl = row
              .querySelector("#decline-fullname")
              .textContent.toLowerCase();
            var roledecl = row
              .querySelector("#decline-role")
              .textContent.toLowerCase();

              console.log("Checking row:", row, "Username:", usernamedecl, "Full Name:", namedecl);
            if (
              usernamedecl.includes(searchAccount) ||
              namedecl.includes(searchAccount) ||
              roledecl.includes(searchAccount)
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