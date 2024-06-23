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
      <jsp:include page="/views/seller/sidebar-seller.jsp" />
    </header>
    <!-- END INCLUDE SIDEBAR -->

    <main
      class="main-content no-dash position-relative max-height-vh-100 h-100 border-radius-lg"
    >
      <!-- START: LIST OWNED PROPERTIES (1) -->
      <div class="container-fluid">
        <div class="row my-4">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-8 col-9">
                    <h6>Your Properties</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-solid fa-house-user"></i>
                      <span class="font-weight-bold ms-1"
                        >${propList.size()} request(s)</span
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
                        id="ownSearch"
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
                            TYPE
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
                        <c:forEach items="${propList}" var="prop">
                          <tr class="prop-row">
                            <td>
                              <div class="d-flex justify-content-start">
                                <div
                                  class="d-flex flex-column justify-content-start"
                                >
                                  <p
                                    id="prop-name"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${prop.name}
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
                                    id="prop-price"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${prop.textPrice}
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
                                    id="prop-type"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${prop.realEstateType}
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
                                    id="prop-status"
                                    class="mb-0 text-sm fw-bold status-color"
                                    value="${prop.status.value}"
                                  >
                                    ${prop.status.value}
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
                                    onclick="viewDetailProperty('${prop.realEstateId}', 'prop')"
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
      <!-- END LIST OWNED PROPERTIES (1)-->

      <!-- START: LIST VALIDATING REQUEST (2)-->
      <div class="container-fluid">
        <div class="row my-4">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-8 col-9">
                    <h6>All Validating Requests</h6>
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
                        placeholder="Type name/type here..."
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
                        <c:forEach items="${reqList}" var="req">
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
                                    ${req.name}
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
                                    ${req.textPrice}
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
                                    ${req.realEstateType}
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
                                    onclick="viewDetailProperty('${req.realEstateId}', 'req')"
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
      <!-- END LIST VALIDATING REQUEST (2) -->

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
                      <li class="list-group-item border-0 ps-0 text-sm d-flex">
                        <strong class="text-dark">Status:</strong>
                        <p id="popup-status"></p>
                      </li>
                    </div>
                    <div id="note-section" class="row hidden mb-1">
                      <li class="list-group-item border-0 ps-0 text-sm d-flex">
                        <strong class="text-dark"
                          >Reason Validate Fail:
                        </strong>
                        <p id="popup-note"></p>
                      </li>
                    </div>

                    <div class="row unqualified hidden">
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                      >
                        <strong class="text-dark">Notes:</strong>
                        <p id="popup-note"></p>
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
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                      >
                        <strong class="text-dark">Paperwork: </strong>
                        <a class="landpw" id="popup-land-pw" target="_blank" download></a>
                        <form 
                          action="${pageContext.request.contextPath}/seller/dashboard" method="post"
                          class="hidden change">
                          <input name="realEstateID" id="popup-id" class="hidden"/>
                          <input
                            id="prop-pw-land"
                            type="file"
                            accept="application/pdf, application/zip"
                            class="form-control form-create-control "
                            name="url"
                            required
                          />
                          <button class="btn btn-padding">Change</button>
                          <input
                            class="hidden"
                            id="land-pw-container"
                            name="landPw"
                            type="text"
                          />
                        </form>
                        <a class="hidden pen" onclick="changePW()">
                          <i class="fa-solid fa-pencil"></i>
                        </a>
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
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                        >
                          <strong class="text-dark">Paperwork: </strong>
                          <a id="popup-house-pw" target="_blank" download></a>
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

                    <!-- Button allows user hide/show list of agencies -->
                    <div
                      id="show-agency-permission"
                      class="d-flex justify-content-center hidden"
                    >
                      <button class="show-btn" onclick="showAgencies()">
                        Show Agency List
                      </button>
                    </div>
                    <!-- Table shows list of Agency wants to handle this property -->
                    <div id="agency-list" class="row hidden">
                      <div class="title-table mb-2 px-0">
                        <strong>Agency Profiles</strong>
                      </div>
                      <table class="table table-responsive">
                        <thead>
                          <tr>
                            <th class="text-center">Select</th>
                            <th class="text-center">Name</th>
                            <th class="text-center">Company</th>
                            <th class="text-center">Years of Experience</th>
                            <th class="text-center">Completed Projects</th>
                            <th class="text-center description">Description</th>
                            <th class="text-center description">
                              View Message
                            </th>
                          </tr>
                        </thead>
                        <tbody id="agency-container"></tbody>
                      </table>
                      <div class="row">
                        <form id="agency-form" action="" method="post">
                          <input
                            id="selected-agency-id"
                            type="hidden"
                            value=""
                          />
                          <div class="d-flex justify-content-end">
                            <button
                              type="submit"
                              class="btn btn-secondary confirm-agency"
                              onclick="confirmAgency(event)"
                            >
                              Confirm
                            </button>
                          </div>
                        </form>
                      </div>
                    </div>

                    <!-- Table shows list of Buyer wants to handle this property -->
                    <div
                      id="show-buyer-permission"
                      class="d-flex justify-content-center hidden"
                    >
                      <button class="show-btn" onclick="showBuyers()">
                        Show Buyer List
                      </button>
                    </div>
                    <div id="buyer-list" class="row hidden">
                      <div class="title-table mb-2 px-0">
                        <strong>Buyer Profiles</strong>
                      </div>
                      <table class="table table-responsive">
                        <thead>
                          <tr>
                            <th class="text-center">Select</th>
                            <th class="text-center">Buyer Name</th>
                            <th class="text-center">Phone Number</th>
                            <th class="text-center message">Message</th>
                          </tr>
                        </thead>
                        <tbody id="buyer-container"></tbody>
                      </table>
                      <div class="row">
                        <form id="buyer-form" action="" method="post">
                          <div id="selected-buyer-id" class="hidden"></div>
                          <div class="d-flex justify-content-end">
                            <button
                              type="submit"
                              class="btn btn-secondary confirm-buyer"
                              onclick="confirmBuyer(event)"
                            >
                              Confirm
                            </button>
                          </div>
                        </form>
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

    <!--End Form-->

    <!--   Core JS Files   -->
    <script src="/template/assets/js/core/popper.min.js"></script>
    <script src="/template/assets/js/core/bootstrap.min.js"></script>
    <script src="/template/assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/chartjs.min.js'/>"></script>
    <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Internal JS -->
    <script>
      //URL REAL ESTATE API
      const urlRealEstate = "http://localhost:8085/api/real-estate/";

      // Submit chosen Agency Profile to system
      function confirmAgency(e) {
        e.preventDefault();

        // Get all checkboxes values in table
        const checkboxes = document.querySelectorAll(".agency-checkbox");

        // Find the selected agency
        const selectedCheckbox = document.querySelector(
          ".agency-checkbox:checked"
        );

        if (selectedCheckbox) {
          //add agency id to container for controller submission
          const agencyId = $(checkbox).data("agency-id");
          document
            .querySelector("#chosen-agency-id")
            .setAttribute("value", agencyId);

          // Only get info of buyer that is selected
          const agencyName = selectedCheckbox
            .closest("tr")
            .querySelector("td:nth-child(2)").textContent;
          const agencyContact = selectedCheckbox
            .closest("tr")
            .querySelector("td:nth-child(3)").textContent;

          // Add info of agency vào into an object
          const selectedAgency = { name: agencyName, contact: agencyContact };

          console.log(selectedAgency);

          document.querySelector("#agency-form").submit();
        } else {
          // If no agency is selected - display error
          alert("Please select an agency.");
        }
      }

      // Submit chosen Agency Profile to system
      function confirmBuyer(e) {
        e.preventDefault();

        // Get all checkboxes values in table
        const checkboxes = document.querySelectorAll(".buyer-checkbox");
        const selectedBuyers = [];

        // Check which buyer is selected
        checkboxes.forEach((checkbox) => {
          if (checkbox.checked) {
            // Only get info of buyer that is checked
            const buyerName = checkbox
              .closest("tr")
              .querySelector("td:nth-child(2)").textContent;
            const buyerContact = checkbox
              .closest("tr")
              .querySelector("td:nth-child(3)").textContent;

            // Add chosen buyer to selectedBuyers
            selectedBuyers.push({ name: buyerName, contact: buyerContact });
          }
        });

        console.log(selectedBuyers);

        alert(
          "Congratulations! You have successfully connected with the buyer. The property will be automatically hidden from the system."
        );

        $("#popup-property-request").addClass("hidden");
      }

      /* Set color for different status value */
      const statusElements = document.querySelectorAll(".status-color");
      statusElements.forEach((element) => {
        element.classList.remove(
          "status-reviewing",
          "status-validating",
          "status-unqualified",
          "status-displayed",
          "status-closed",
          "status-handled",
          "status-agency-approving",
          "status-buyer-approving"
        );
      });
      // Display colors according to status value
      statusElements.forEach((element) => {
        const statusValue = element.getAttribute("value");
        switch (statusValue) {
          case "Reviewing":
            element.classList.add("status-reviewing");
            break;
          case "Validating":
            element.classList.add("status-validating");
            break;
          case "Unqualified":
            element.classList.add("status-unqualified");
            break;
          case "Displayed":
          case "Closed":
          case "Handled":
            element.classList.add("status-displayed");
            break;
          case "Agency_Approving":
          case "Buyer_Approving":
            element.classList.add("status-agency-approving");
            break;
          default:
            break;
        }
      });

      /* View Popup detail of each property */
      function viewDetailProperty(propID, type) {
        var popup = document.querySelector("#popup-property-request");
        var landSection = document.querySelector(".land-info-section");
        var houseSection = document.querySelector(".house-info-section");
        var agencyBtn = document.querySelector("#show-agency-permission");
        var buyerBtn = document.querySelector("#show-buyer-permission");
        var unqualified = document.querySelector(".unqualified");

        // Send GET Request API to retrieve single property information
        $.ajax({
          url: urlRealEstate + propID,
          type: "GET",
          success: function (data) {
            // Update popup với information chosen Property
            $("#popup-name").text(data.name);
            if (data.status == "UNQUALIFIED") {
              document
                .querySelector("#note-section")
                .classList.remove("hidden");
              $("#popup-note").text(data.notes);
            }
            $("#popup-status").text(data.status);

            $("#popup-desc").text(data.description);
            $("#popup-type").text(data.realEstateType);
            $("#popup-address").text(data.address);
            $("#popup-area").text(data.area + " m²");
            $("#popup-price").text(data.textPrice + " VND");

            //update chooser realEstateID 
            document.querySelector("#popup-id").setAttribute("value", data.realEstateId);

            //show notes when property unqualified
            if (data.status == "UNQUALIFIED") {
              unqualified.classList.remove("hidden");
              $("popup-note").text(data.notes);
            } else {
              unqualified.classList.add("hidden");
            }

            //only show land/house fields according to type
            if (data.realEstateType == "Land") {
              landSection.classList.remove("hidden");
              houseSection.classList.add("hidden");
              $("#popup-land-type").text(data.propertyLand.landType);
              $("#popup-land-pw").text("download this file to view paperwork");
              document
                .querySelector("#popup-land-pw")
                .setAttribute("href", data.paperWorks);
            } else {
              houseSection.classList.remove("hidden");
              landSection.classList.add("hidden");
              $("#popup-house-type").text(data.propertyHouse.houseType);
              $("#popup-house-pw").text("download this file to view paperwork");
              document
                .querySelector("#popup-house-pw")
                .setAttribute("href", data.paperWorks);
              $("#popup-builtIn").text(data.propertyHouse.builtIn);
              $("#popup-bed").text(data.propertyHouse.bedroom + " rooms");
              $("#popup-bath").text(data.propertyHouse.bath + " rooms");
            }

            //only show list of Agency/Buyer Profiles if it's list of owned Properties
            if (data.status.toLowerCase() == "agency_approving") {
              agencyBtn.classList.remove("hidden");
            } else if (data.status.toLowerCase() == "buyer_approving") {
              buyerBtn.classList.remove("hidden");
            }

            //load list of agencies for seller if any agency requested handle listing
            $("#agency-container").empty(); //clear data of previous property
            const agencyContainer = $("#agency-container");
            data.agencyRequests.forEach((request) => {
              //create rows with checkboxes - for controller submission - and information to view
              const row = $("<tr>");

              //information of agencies to submit back to controller
              const checkbox = $("<input>")
                .attr("type", "checkbox")
                .attr("data-request-id", request.requestId)
                .attr("data-agency-id", request.agencyId)
                .attr("data-real-estate-id", request.realEstateId)
                .addClass("agency-checkbox");

              row.append($("<td>").append(checkbox));
              row.append($("<td>").text(request.agency.fullName));
              row.append($("<td>").text(request.agency.company));
              row.append($("<td>").text(request.agency.yearsOfExperience));
              row.append($("<td>").text(request.agency.yearsOfExperience));
              row.append($("<td>").text(request.agency.completedProject));
              row.append($("<td>").text(request.agency.description));

              //part to view introduction message from agency seperately
              const viewMessageCell = $("<td>")
                .append(
                  $("<button>")
                    .addClass("btn btn-primary btn-sm view-message-btn")
                    .text("View")
                    .attr("data-message", request.message)
                )
                .addClass("text-center");
              row.append(viewMessageCell);

              //action handler for view message button
              $(".view-message-btn").click(function () {
                const message = $(this).data("message");
                $("#popup-message-content").text(request.agency.message);
                $("#popup-message").removeClass("hidden");
              });

              function closePopup(popupId) {
                $(`#${popupId}`).addClass("hidden");
              }

              agencyContainer.append(row);
            });

            /*suppose to have information like this: 
            <td id="agency-name">${agency.name}</td>
            <td id="agency-company">${agency.company}</td>
            <td id="agency-years-of-experience">${agency.yearsOfExperience}</td>
            <td id="agency-completed-projects">${agency.completedProjects}</td>
            <td id="agency-description">${agency.description}</td>
    */

            //load images to carousel
            const carouselInner = document.querySelector(".carousel-inner");
            const carouselIndicators = document.querySelector(
              ".carousel-indicators"
            );

            // Reset images to be shown everytime popup is clicked
            carouselInner.innerHTML = "";
            carouselIndicators.innerHTML = "";

            data.propertyImagesList.forEach((image, index) => {
              // create slide
              const slideElement = document.createElement("div");
              slideElement.classList.add("carousel-item");
              if (index === 0) {
                slideElement.classList.add("active");
              }
              const imgElement = document.createElement("img");
              imgElement.src = image;
              imgElement.classList.add("d-block", "w-100", "rounded");
              slideElement.appendChild(imgElement);
              carouselInner.appendChild(slideElement);

              // create indexes
              const indicatorElement = document.createElement("button");
              indicatorElement.type = "button";
              indicatorElement.dataset.bsTarget = "#image-section";
              indicatorElement.dataset.bsSlideTo = index;
              if (index === 0) {
                indicatorElement.classList.add("active");
                indicatorElement.setAttribute("aria-current", "true");
              }
              indicatorElement.setAttribute("aria-label", `Slide ${index + 1}`);
              carouselIndicators.appendChild(indicatorElement);
            });

            // init Bootstrap Carousel
            const carousel = new bootstrap.Carousel("#image-section");

            popup.classList.remove("hidden");
          },
          error: function (xhr, status, error) {
            const errorMessage = `Error: ${xhr.status} - ${xhr.statusText}`;
            console.error(errorMessage);
            alert(errorMessage);
          },
        });
      }

      var isAgencyDisplayed = false;
      //only show list of agencies when seller click show
      function showAgencies() {
        if (!isAgencyDisplayed) {
          document.querySelector("#agency-list").classList.remove("hidden");
          document.querySelector("#show-agency-permission button").textContent =
            "Hide Agency List";
          isAgencyDisplayed = true;
        } else {
          document.querySelector("#agency-list").classList.add("hidden");
          document.querySelector("#show-agency-permission button").textContent =
            "Show Agency List";
          isAgencyDisplayed = false;
        }
      }

      //only show list of buyers when seller click show
      var isBuyersDisplayed = false;
      function showBuyers() {
        if (!isBuyersDisplayed) {
          document.querySelector("#buyer-list").classList.remove("hidden");
          document.querySelector("#show-buyer-permission button").textContent =
            "Hide Buyer List";
          isBuyersDisplayed = true;
        } else {
          document.querySelector("#buyer-list").classList.add("hidden");
          document.querySelector("#show-buyer-permission button").textContent =
            "Show Buyer List";
          isBuyersDisplayed = false;
        }
      }

      //to close popup
      function closeDetail() {
        document
          .getElementById("popup-property-request")
          .classList.add("hidden");
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
      function searchTable(type) {
        //search for request register accounts
        if (type.includes("own")) {
          //Get values from input search
          var searchInput = document
            .getElementById("ownSearch")
            .value.toLowerCase();

          // Get all rows in table
          var requests = document.querySelectorAll(".prop-row");

          requests.forEach(function (row) {
            var name = row
              .querySelector("#prop-name")
              .textContent.toLowerCase();
            var type = row
              .querySelector("#prop-type")
              .textContent.toLowerCase();
            if (name.includes(searchInput) || type.includes(searchInput)) {
              row.style.display = "";
            } else {
              row.style.display = "none";
            }
          });
        } else {
          //Get values from input search
          var searchInput = document
            .getElementById("reqSearch")
            .value.toLowerCase();

          // Get all rows in table
          var requests = document.querySelectorAll(".req-row");

          requests.forEach(function (row) {
            var name = row.querySelector("#req-name").textContent.toLowerCase();
            var type = row.querySelector("#req-type").textContent.toLowerCase();
            if (name.includes(searchInput) || type.includes(searchInput)) {
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
