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

  <body class="g-sidenav-show bg-gray-100" onload="makeTableScroll();">
    <!-- START INCLUDE SIDEBAR -->
    <header>
      <jsp:include page="/views/manager/sidebar-man.jsp" />
    </header>
    <!-- END INCLUDE SIDEBAR -->

    <main
      class="main-content no-dash position-relative max-height-vh-100 h-100 border-radius-lg"
    >
      <!-- START: INTRODUCTION HEADER -->
      <section class="min-vh-100 mb-4">
        <div
          class="page-header align-items-start min-vh-35 pt-1 pb-1 m-3 border-radius-lg"
          style="
            background-image: url(/template/assets/img/register-staff-bg.png);
          "
        >
          <span class="mask bg-gradient-dark opacity-6"></span>
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-sm-12 col-md-8 col-lg-6 text-center mx-auto">
                <h2 class="text-white mb-1 mt-sm-4">Register New Staff</h2>
              </div>
            </div>
          </div>
        </div>
        <!-- END: INTRODUCTION HEADER -->

        <!-- START: FORM TO REGISTER NEW STAFF -->
        <div class="container">
          <div class="row mt-lg-n8 mt-md-n8 mt-n7 mt-sm-n9">
            <div class="col-12 col-xl-11 mx-auto">
              <div class="card z-index-0">
                <div class="card-header text-center pt-4">
                  <h5><b>Staff Register Form</b></h5>
                </div>

                <div class="card-body">
                  <form role="form text-left" name="register-staff-form">
                    <div class="mb-3 row">
                      <div class="col-sm-2"><label>Full Name:</label></div>
                      <div class="col-sm-4">
                        <input
                          type="text"
                          name="fullName"
                          class="form-control form-create-control col-10"
                          placeholder="Enter full name"
                          required
                        />
                        <!-- ERROR MESSAGE BEING HIDDEN -->
                        <!-- <p
                  class="text-danger text-error mb-0 text-center pt-1 hidden"
                >
                  name should only contains 255 characters.
                </p> -->
                      </div>

                      <div class="col-sm-2">
                        <label>Gender:</label>
                      </div>
                      <div class="col-sm-4">
                        <select
                          class="form-control form-create-control col-10"
                          name="gender"
                          required
                        >
                          <option value="" disabled selected>
                            Select biological gender
                          </option>
                          <option value="male">Male</option>
                          <option value="female">Female</option>
                        </select>
                      </div>
                    </div>

                    <div class="mb-3 row">
                      <div class="col-sm-2"><label>Date of Birth:</label></div>
                      <div class="col-sm-4">
                        <input
                          type="date"
                          name="birthday"
                          class="form-control form-create-control col-10"
                          required
                        />
                      </div>
                      <div class="col-sm-2">
                        <label> Email:</label>
                      </div>
                      <div class="col-sm-4">
                        <input
                          type="email"
                          name="emai"
                          class="form-control form-create-control col-10"
                          placeholder="Enter work email"
                          required
                        />
                      </div>
                    </div>

                    <div class="mb-3 row">
                      <div class="col-sm-2">
                        <label> Phone:</label>
                      </div>
                      <div class="col-sm-4">
                        <input
                          type="number"
                          name="phone"
                          class="form-control form-create-control col-10"
                          placeholder="Enter phone number"
                          required
                        />
                      </div>
                      <div class="col-sm-2">
                        <label> Address:</label>
                      </div>
                      <div class="col-sm-4">
                        <input
                          type="text"
                          name="address"
                          class="form-control form-create-control col-10"
                          placeholder="your property's adress"
                          required
                        />
                      </div>
                    </div>

                    <div class="mb-3 row">
                      <div class="col-sm-2"><label>Password:</label></div>
                      <div class="col-sm-4">
                        <input
                          type="text"
                          name="password"
                          class="form-control form-create-control col-10"
                          placeholder="Enter expected password"
                          required
                        />
                      </div>
                      <div class="col-sm-2">
                        <label> ID Card No. :</label>
                      </div>
                      <div class="col-sm-4">
                        <input
                          type="number"
                          name="address"
                          class="form-control form-create-control col-10"
                          placeholder="Enter ID card number"
                          min="1"
                          required
                        />
                      </div>
                    </div>

                    <div class="mb-3 row">
                      <div class="col-sm-2">
                        <label> ID Card (Front):</label>
                      </div>
                      <div class="col-sm-4">
                        <input
                          class="form-control form-create-control col-10"
                          type="file"
                          name="frontID"
                        />
                      </div>

                      <div class="col-sm-2">
                        <label> ID Card (Back):</label>
                      </div>
                      <div class="col-sm-4">
                        <input
                          class="form-control form-create-control col-10"
                          type="file"
                          name="backID"
                        />
                      </div>
                    </div>

                    <div class="mb-3 row">
                      <div class="col-sm-2"><label> Role:</label></div>
                      <div class="col-sm-2">
                        <input
                          type="text"
                          class="form-control form-create-control col-10"
                          value="Staff"
                          disabled
                        />
                      </div>

                      <!-- submit button -->
                      <div class="text-center container">
                        <div class="row">
                          <div class="col-sm-4"></div>
                          <div class="col-sm-4">
                            <button
                              type="button"
                              class="btn bg-gradient-dark w-100 my-4 mb-2"
                            >
                              Submit Request
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- END: FORM TO REGISTER NEW STAFF -->

      <!-- START: LIST REGISTER REQUEST -->
      <div class="row my-4 mx-2">
        <div class="mb-md-0 mb-4">
          <div class="card">
            <div class="card-header pb-0">
              <div class="row">
                <div class="col-lg-8 col-9">
                  <h6>Your Staff Register Requests</h6>
                  <p class="text-sm mb-0">
                    <i class="fa-solid fa-house-user"></i>
                    <span class="font-weight-bold ms-1">1 request(s)</span>
                    being handled
                  </p>
                </div>

                <!-- search bar -->
                <div
                  class="ms-md-auto pe-md-3 d-flex align-items-center col-lg-4 col-3"
                >
                  <div class="input-group">
                    <span class="input-group-text text-body"
                      ><i class="fas fa-search" aria-hidden="true"></i
                    ></span>
                    <input
                      type="text"
                      id="reqSearch"
                      class="form-control"
                      placeholder="Type username here..."
                      onkeyup="searchTable()"
                    />
                  </div>
                </div>
              </div>
            </div>

            <div class="card-body px-0 pb-2">
              <div class="table-responsive">
                <table class="register-req-table table align-items-center mb-0">
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
                        FULL NAME
                      </th>
                      <th
                        class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-2"
                      >
                        USERNAME
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
                    <% for(int i = 0; i < 20; i+=1) { %>
                    <tr class="tbl-row">
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
                            <p
                              class="mb-0 text-sm fw-bold text-dark"
                            >
                              Hoàng Việt Hùng
                            </p>
                          </div>
                        </div>
                      </td>
                      <td>
                        <div class="d-flex justify-content-start">
                          <div class="d-flex flex-column justify-content-start">
                            <p 
                            id="uname" class="mb-0 text-sm fw-bold text-dark">HungVH</p>
                          </div>
                        </div>
                      </td>
                      <td>
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
                    <% } %>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- END LIST REGISTER REQUEST-->

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

    <script type="text/javascript">
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
          if (username.includes(searchInput)) {
            row.style.display = "";
          } else {
            row.style.display = "none";
          }
        });
      }

      //make table scrollable & fixed header
      function makeTableScroll() {
        // Constant retrieved from server-side via JSP
        var maxRows = 6;

        var table = document.querySelector(".table");
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
      }
    </script>

    <!--   Core JS Files   -->
    <script src="/template/assets/js/core/popper.min.js"></script>
    <script src="/template/assets/js/core/bootstrap.min.js"></script>
    <script src="/template/assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/chartjs.min.js"></script>
    <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
  </body>
</html>
