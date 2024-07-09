<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="jakarta.tags.core" prefix="c" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>RECS - Create Account Staff</title>

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
      <!-- START INCLUDE SIDEBAR -->
      <header>
        <jsp:include page="/views/manager/sidebar-man.jsp" />
      </header>
      <!-- END INCLUDE SIDEBAR -->

      <main class="main-content no-dash position-relative max-height-vh-100 h-100 border-radius-lg">
        <!-- START: INTRODUCTION HEADER -->
        <section class="min-vh-80 mb-4">
          <div class="page-header align-items-start min-vh-35 pt-1 pb-1 m-3 border-radius-lg" style="
            background-image: url(/template/assets/img/register-staff-bg.png);
          ">
            <span class="mask bg-gradient-dark opacity-6"></span>
            <div class="container">
              <div class="row justify-content-center">
                <div class="col-sm-12 col-md-8 col-lg-6 text-center mx-auto">
                  <h2 class="text-white mb-1 mt-sm-4">Create New Staff</h2>
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
                    <h5><b>Staff Create Form</b></h5>
                  </div>

                  <div class="card-body">
                    <form role="form text-left" name="register-staff-form"
                      action="${pageContext.request.contextPath}/manager/create-staff" method="post" modelAttribute="request">
                      <div class="mb-3 row">
                        <div class="col-sm-2">
                          <label for="fullName">Full Name:</label>
                        </div>
                        <div class="col-sm-4">
                          <input type="text" id="fullName" name="fullName"
                            class="form-control form-create-control col-10" placeholder="Enter full name" required />
                          <!-- ERROR MESSAGE BEING HIDDEN -->
                          <p class="text-danger text-error mb-0 text-center pt-1 error-name hidden">
                            name should only contains maximum 255 characters.
                          </p>
                        </div>

                        <div class="col-sm-2">
                          <label for="gender">Gender:</label>
                        </div>
                        <div class="col-sm-4">
                          <select class="form-control form-create-control col-10" id="gender" name="gender" required>
                            <option value="" disabled selected>
                              Select biological gender
                            </option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                          </select>
                        </div>
                      </div>

                      <div class="mb-3 row">
                        <div class="col-sm-2">
                          <label for="birthday">Date of Birth:</label>
                        </div>
                        <div class="col-sm-4">
                          <input type="date" id="birthday" name="birthDate"
                            class="form-control form-create-control col-10" required onchange="validateDateOfBirth()" />
                          <p class="text-danger text-error mb-0 text-center pt-1 error-bday hidden">
                            birthday has to be before current day.
                          </p>
                        </div>
                        <div class="col-sm-2">
                          <label for="email"> Email:</label>
                        </div>
                        <div class="col-sm-4">
                          <input type="email" id="email" name="email" class="form-control form-create-control col-10"
                            placeholder="Enter work email" required />
                          <p class="text-danger text-error mb-0 text-center pt-1 error-email hidden">
                            email is not in the correct format. (ie:
                            example@domain.com)
                          </p>
                        </div>
                      </div>

                      <div class="mb-3 row">
                        <div class="col-sm-2">
                          <label for="phone"> Phone:</label>
                        </div>
                        <div class="col-sm-4">
                          <input type="number" id="phone" name="phone" class="form-control form-create-control col-10"
                            placeholder="Enter phone number" min="1" required />
                            <p class="text-danger text-error mb-0 text-center pt-1 error-phone hidden">
                              Phone number must be between 10 and 11 digits long and contain only numbers.
                            </p>
                        </div>
                        <div class="col-sm-2">
                          <label for="address"> Address:</label>
                        </div>
                        <div class="col-sm-4">
                          <input type="text" id="address" name="address" class="form-control form-create-control col-10"
                            placeholder="Enter address" required />
                        </div>
                      </div>

                      <div class="mb-3 row">
                        <div class="col-sm-2">
                          <label for="password">Password:</label>
                        </div>
                        <div class="col-sm-4">
                          <input type="text" id="password" name="password"
                            class="form-control form-create-control col-10" placeholder="Enter password"
                            required />
                          <p class="text-danger text-error mb-0 text-center pt-1 error-pw hidden">
                            password must be: <br />
                            Minimum length of 8 characters.<br />
                            At least one lowercase letter.<br />
                            At least one uppercase letter.<br />
                            At least one digit.<br />
                            At least one special character from the set: @$!%*?&.
                          </p>
                        </div>
                        <div class="col-sm-2">
                          <label for="idCardNo"> ID Card No:</label>
                        </div>
                        <div class="col-sm-4">
                          <input type="number" id="idCardNo" name="idCard"
                            class="form-control form-create-control col-10" placeholder="Enter ID card number" min="1"
                            required />
                        </div>
                      </div>

                      <div class="mb-3 row">
                        <div class="col-sm-2">
                          <label for="role"> Role:</label>
                        </div>
                        <div class="col-sm-2">
                          <input type="text" id="role" class="form-control form-create-control col-10" value="Staff"
                            disabled required />
                        </div>

                        <!-- submit button -->
                        <div class="text-center container">
                          <div class="row">
                            <div class="col-sm-4"></div>
                            <div class="col-sm-4">
                              <button type="button" class="btn bg-gradient-dark w-100 my-4 mb-2"
                                onclick="submitRegister()">
                                Create
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
                    <h6>All Staffs Created</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-solid fa-house-user"></i>
                      <span class="font-weight-bold ms-1">${listStaff.size()} account(s)</span>
                      have created
                    </p>
                  </div>

                  <!-- search bar -->
                  <div class="ms-md-auto pe-md-3 d-flex align-items-center col-lg-4 col-3">
                    <div class="input-group">
                      <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
                      <input type="text" id="reqSearch" class="form-control" placeholder="Type username here..."
                        onkeyup="searchTable()" />
                    </div>
                  </div>
                </div>
              </div>

              <div class="card-body px-0 pb-2">
                <div class="table-responsive">
                  <table class="register-req-table table align-items-center mb-0">
                    <thead>
                      <tr>
                        <th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                          ID
                        </th>
                        <th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3">
                          FULL NAME
                        </th>
                        <th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-2">
                          USERNAME
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2">
                          Status
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                          View Details
                        </th>
                      </tr>
                    </thead>
                    <!--input list of validating requests here - only 1 row for reference-->
                    <tbody>
                      <c:forEach items="${listStaff}" var="staff">
                        <tr class="staff-row">
                          <td class="align-middle text-center text-sm">
                            <div class="d-flex px-2 py-1 justify-content-center">
                              <div class="d-flex flex-column justify-content-center">
                                <p id="staff-id" class="mb-0 text-sm fw-bold text-dark">
                                  ${staff.accountId}
                                </p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="d-flex justify-content-start">
                              <div class="d-flex flex-column justify-content-start">
                                <p id="staff-name" class="mb-0 text-sm fw-bold text-dark">
                                  ${staff.fullName}
                                </p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="d-flex justify-content-start">
                              <div class="d-flex flex-column justify-content-start">
                                <p id="staff-uname" class="mb-0 text-sm fw-bold text-dark">
                                  ${staff.username}
                                </p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="d-flex px-2 py-1 justify-content-center">
                              <div class="d-flex flex-column justify-content-center">
                                <p class="mb-0 text-sm fw-bold status-color" value="${staff.status}">
                                  ${staff.status}
                                </p>
                              </div>
                            </div>
                          </td>
                          <td class="align-middle">
                            <div class="d-flex px-2 py-1 justify-content-center">
                              <div class="d-flex flex-column justify-content-center">
                                <a onclick="viewDetail('${staff.accountId}')"><i class="fa-solid fa-eye"></i></a>
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
        <!-- END LIST REGISTER REQUEST-->

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
      <div id="popup-user" class="popup-container hidden z-index-3">
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
                        <li class="d-flex list-group-item border-0 ps-0 text-sm col-4">
                          <strong class="text-dark">Account ID: </strong>
                          <p id="popup-id"></p>
                        </li>
                        <li class="d-flex list-group-item border-0 ps-0 text-sm col-4">
                          <strong class="text-dark">Username:</strong>
                          <p id="popup-username"></p>
                        </li>
                        <li class="d-flex list-group-item border-0 ps-0 text-sm col-4">
                          <strong class="text-dark">Status:</strong>
                          <p id="popup-status"></p>
                        </li>
                      </div>

                      <div class="row">
                        <li class="d-flex list-group-item border-0 ps-0 text-sm col-4">
                          <strong class="text-dark">Role:</strong>
                          <p id="popup-role"></p>
                        </li>
                        <li class="d-flex list-group-item border-0 ps-0 text-sm col-4">
                          <strong class="text-dark">Email:</strong>
                          <p id="popup-email"></p>
                        </li>
                        <li class="d-flex list-group-item border-0 ps-0 text-sm col-4">
                          <strong class="text-dark">ID Number:</strong>
                          <p id="popup-id-number"></p>
                        </li>
                      </div>

                      <div class="row">
                        <li class="d-flex list-group-item border-0 ps-0 text-sm col-4">
                          <strong class="text-dark">Gender:</strong>
                          <p id="popup-gender"></p>
                        </li>
                        <li class="d-flex list-group-item border-0 ps-0 text-sm col-4">
                          <strong class="text-dark">Address:</strong>
                          <p id="popup-address"></p>
                        </li>
                        <li class="d-flex list-group-item border-0 ps-0 text-sm col-4">
                          <strong class="text-dark">Birth Date:</strong>
                          <p id="popup-birthdate"></p>
                        </li>
                      </div>

                      <div id="seller-section" class="row hidden">
                        <li class="d-flex list-group-item border-0 ps-0 text-sm col-4">
                          <strong class="text-dark">Company:</strong>
                          <p id="popup-company-seller"></p>
                        </li>
                      </div>

                      <div id="manager-section" class="row hidden">
                        <li class="d-flex list-group-item border-0 ps-0 text-sm col-4">
                          <strong class="text-dark">Years Of Experience:</strong>
                          <p id="popup-year-experience-man"></p>
                        </li>
                      </div>

                      <div id="staff-section" class="row hidden">
                        <li class="d-flex list-group-item border-0 ps-0 text-sm col-4">
                          <strong class="text-dark">Superior Manager: </strong>
                          <p id="popup-superior-staff"></p>
                        </li>
                        <li class="d-flex list-group-item border-0 ps-0 text-sm col-4">
                          <strong class="text-dark">Currently Handling Validation:
                          </strong>
                          <p id="popup-num-of-projects"></p>
                        </li>
                      </div>

                      <div id="agency-section" class="row hidden">
                        <div class="row">
                          <li class="d-flex list-group-item border-0 ps-0 text-sm col-4">
                            <strong class="text-dark">Company: </strong>
                            <p id="popup-company-agency"></p>
                          </li>
                          <li class="d-flex list-group-item border-0 ps-0 text-sm col-4">
                            <strong class="text-dark">Years Of Experience:</strong>
                            <p id="popup-year-experience-agency"></p>
                          </li>
                          <li class="d-flex list-group-item border-0 ps-0 text-sm col-4">
                            <strong class="text-dark">Completed Projects:
                            </strong>
                            <p id="popup-completed-projects"></p>
                          </li>
                        </div>

                        <div class="row">
                          <li class="d-flex list-group-item border-0 ps-0 text-sm col-12">
                            <strong class="text-dark">Description:</strong>
                            <p id="popup-description"></p>
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
      <!-- ---------------- END POPUP SECTION --------------------- -->


      <script type="text/javascript">

        function closeDetailRegisterRequest() {
          var popup = document.getElementById("popup-user");
          popup.classList.add("hidden");
        }

        //still forcely close every popup if clicked on somewhere else than close button
        window.onclick = function (event) {
          var popup = document.querySelector(".popup-container");
          if (event.target == popup) {
            popup.classList.add("hidden");
          }
        };

        function viewDetail(userID) {
          var popup = document.getElementById("popup-user");
          var company = document.querySelector(".company");

          // Send GET Request API to retrieve single user information
          $.ajax({
            url: "http://localhost:8085/api/user/" + userID,
            type: "GET",
            success: function (data) {
              // Update popup với information chosen User
              $("#popup-id").text(data.accountId);
              $("#popup-username").text(data.username);
              $("#popup-role").text(data.roleId);
              $("#popup-full-name").text(data.fullName);
              $("#popup-gender").text(data.gender);
              $("#popup-email").text(data.email);
              $("#popup-phone").text(data.phone);
              $("#popup-address").text(data.address);
              $("#popup-id-number").text(data.idCard);
              $("#popup-status").text(data.status);
              $("#popup-birthdate").text(
                new Date(data.birthDate).toLocaleDateString()
              );

              //if user is seller
              if (data.roleId === "ROLE_SELLER") {
                $("#seller-section").removeClass("hidden");
                $("#popup-company-seller").text(data.company);
              } else {
                $("#seller-section").addClass("hidden");
              }

              //if user is manager
              if (data.roleId === "ROLE_MANAGER") {
                $("#manager-section").removeClass("hidden");
                $("#popup-year-experience-man").text("4");
              } else {
                $("#manager-section").addClass("hidden");
              }

              //if user is staff
              if (data.roleId === "ROLE_STAFF") {
                $("#staff-section").removeClass("hidden");
                console.log(data.superiorId);
                $("#popup-superior-staff").text(data.superiorId);
                $("#popup-num-of-projects").text(data.superiorId);
              } else {
                $("#staff-section").addClass("hidden");
              }

              //if user is agency
              if (data.roleId === "ROLE_AGENCY") {
                console.log("In agency");
                $("#agency-section").removeClass("hidden");
                $("#popup-company-agency").text(data.company);
                $("#popup-year-experience-agency").text(data.agencyYearsOfExperience);
                $("#popup-completed-projects").text(data.completedProject);
                $("#popup-description").text(data.agencyDescription);
              } else {
                $("#agency-section").addClass("hidden");
              }

              popup.classList.remove("hidden");
            },
            error: function () {
              //Error when sending request
              console.error("Error fetching register request details");
            },
          });
        }

        //Function to format date 
        function formatDate(date){
          const d = new Date(date);
          const year = d.getFullYear();
          const month = String(d.getMonth + 1).padStart(2, '0');
          const day = String(d.getDate().padStart(2, '0'));
          return `${year}-${month}-${day}`;
        }

        //validate birthday of staff
        function validateDateOfBirth() {
          const birthdayInput = document.getElementById("birthday");
          const formattedDate = formatDate(birthdayInput);

          birthdayInput.value = formatDate;

          const birthDate = new Date(formatDate);
          const currentDate = new Date();

          if (birthDate.getTime() >= currentDate.getTime()) {
            document.querySelector(".error-bday").classList.remove("hidden"); //show errors
            birthdayInput.value = ""; // Delete bday value if invalid
          } else {
            document.querySelector(".error-bday").classList.add("hidden"); //hide errors
          }
        }

        //submit register new staff request to admin
        function submitRegister() {
          event.preventDefault(); //Stop form from default submitting

          // Check if all fields have values
          if (document.querySelector("form").checkValidity()) {
            const staffName = document.querySelector("#fullName");
            const emailInput = document.querySelector("#email");
            const passwordInput = document.querySelector("#password");
            const phoneInput = document.querySelector("#phone");
            const phoneError = document.querySelector(".error-phone");
            const nameError = document.querySelector(".error-name");
            const emailError = document.querySelector(".error-email");
            const pwError = document.querySelector(".error-pw");

            const validImageTypes = [
              "image/gif",
              "image/jpeg",
              "image/png",
              "image/jpg",
              "image/heic",
            ];

            if (staffName.value.length > 255) {
              //Check if property's name is longer than 255 characters
              nameError.classList.remove("hidden");
              return;
            } else {
              nameError.classList.add("hidden");
            }
            
            const phoneInputText = phoneInput.value.toString();
            if(phoneInputText.length > 11) {
              phoneError.classList.remove("hidden");
              return;
            } else {
              phoneError.classList.add("hidden");
            }

            if (!/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(emailInput.value)) {
              // Check if email is valid
              emailError.classList.remove("hidden");
              return;
            } else {
              emailError.classList.add("hidden");
            }

            if (
              !/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(
                passwordInput.value
              )
            ) {
              // Check if password is valid
              pwError.classList.remove("hidden");
              return;
            } else {
              pwError.classList.add("hidden");
            }


            // Ẩn tất cả các thông báo lỗi
            phoneError.classList.add("hidden");
            nameError.classList.add("hidden");
            emailError.classList.add("hidden");
            pwError.classList.add("hidden");

            // Create a Promise to wair for all errors to be hidden
            const hideErrorsPromise = new Promise((resolve) => {
              // Wait 500ms to make sure all errors are hidden
              setTimeout(resolve, 500);
            });

            // Waiting Promise to hide all errors then alert to user
            hideErrorsPromise.then(() => {
              alert("Successfully created a new Staff!");
              document.querySelector("form").submit();
            });

          } else {
            // If some fields are empty, show default errors
            document.querySelector("form").reportValidity();
          }
        }

        //display elements according to search value
        function searchTable() {
          // Lấy giá trị từ ô input
          var searchInput = document
            .getElementById("reqSearch")
            .value.toLowerCase();

          // Retrieve all rows in a table
          var tableRows = document.querySelectorAll(".staff-row");

          // Loop through each row and hide/unhide them based on search value
          tableRows.forEach(function (row) {
            var username = row.querySelector("#staff-uname").textContent.toLowerCase();
            var fullname = row.querySelector("#staff-name").textContent.toLowerCase();
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
      <script src="/template/assets/js/core/bootstrap.min.js"></script>
      <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="../../template/assets/js/general-features.js"></script>
    </body>

    </html>