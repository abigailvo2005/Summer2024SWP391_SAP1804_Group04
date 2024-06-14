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
                        placeholder="Type id/name/type here..."
                        onkeyup="searchTable('prop')"
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
                                    class="mb-0 text-sm fw-bold text-muted"
                                  >
                                    ${prop.status}
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
                        id="propSearch"
                        type="text"
                        class="form-control"
                        placeholder="Type id/name/type here..."
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
                                    class="mb-0 text-sm fw-bold text-muted"
                                  >
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
                      <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                        <strong class="text-dark">Status:</strong>
                        <p id="popup-status"></p>
                      </li>
                      <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                        <strong class="text-dark">Handled by: </strong>
                        <p id="popup-manager"></p>
                      </li>
                    </div>

                    <!-- image carousel -->
                    <div class="row mb-3">
                      <div
                        id="image-section"
                        class="carousel slide"
                        data-bs-ride="carousel"
                      >
                        <!-- buttons to directly see an image -->
                        <div class="carousel-indicators">
                          <button
                            type="button"
                            data-bs-target="#image-section"
                            data-bs-slide-to="0"
                            class="active"
                            aria-current="true"
                            aria-label="Slide 1"
                          ></button>
                          <button
                            type="button"
                            data-bs-target="#image-section"
                            data-bs-slide-to="1"
                            aria-label="Slide 2"
                          ></button>
                          <button
                            type="button"
                            data-bs-target="#image-section"
                            data-bs-slide-to="2"
                            aria-label="Slide 3"
                          ></button>
                        </div>
                        <div class="carousel-inner">
                          <div class="carousel-item active">
                            <img
                              src="../../template/assets/img/home-decor-1.jpg"
                              class="d-block w-100 rounded"
                              alt="Real Estate Image 1"
                            />
                          </div>
                          <div class="carousel-item">
                            <img
                              src="../../template/assets/img/home-decor-2.jpg"
                              class="d-block w-100 rounded"
                              alt="Real Estate Image 2"
                            />
                          </div>
                          <div class="carousel-item">
                            <img
                              src="../../template/assets/img/home-decor-3.jpg"
                              class="d-block w-100 rounded"
                              alt="Real Estate Image 3"
                            />
                          </div>
                        </div>
                        <!-- button fd/backwards -->
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

                    <div class="row">
                      <li class="list-group-item border-0 ps-0 text-sm col-12 d-flex">
                        <strong class="text-dark">Description:</strong>
                        <p id="popup-desc"></p>
                      </li>
                    </div>

                    <div class="row">
                      <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                        <strong class="text-dark">Type:</strong>
                        <p id="popup-type"></p>
                      </li>
                      <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                        <strong class="text-dark">Address:</strong>
                        <p id="popup-address"></p>
                      </li>
                    </div>

                    <div class="row">
                      <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                        <strong class="text-dark">Area:</strong>
                        <p id="popup-area"></p>
                      </li>
                      <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                        <strong class="text-dark">Price:</strong>
                        <p id="popup-price"></p>
                      </li>
                    </div>

                    <div class="row land-info-section hidden">
                      <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                        <strong class="text-dark">Land Type: </strong>
                        <p id="popup-land-type"></p>
                      </li>
                      <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                        <strong class="text-dark">Paperwork: </strong>
                        <a id="popup-land-pw" target="_blank" download></a>
                      </li>
                    </div>

                    <div class="house-info-section hidden">
                      <div class="row">
                        <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                          <strong class="text-dark">House Type: </strong>
                          <p id="popup-house-type"></p>
                        </li>
                        <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                          <strong class="text-dark">Paperwork: </strong>
                          <a id="popup-house-pw" target="_blank" download></a>
                        </li>
                      </div>

                      <div class="row">
                        <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
                          <strong class="text-dark">Built in: </strong>
                          <p id="popup-builtIn"></p>
                        </li>
                        <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
                          <strong class="text-dark">Bedrooms: </strong>
                          <p id="popup-bed"></p>
                        </li>
                        <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
                          <strong class="text-dark">Bathrooms: </strong>
                          <p id="popup-bath"></p>
                        </li>
                      </div>
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
                          </tr>
                        </thead>
                        <tbody>
                          <% for (int i = 0; i < 5; i++) { %>
                          <tr>
                            <td>
                              <input type="checkbox" class="agency-checkbox" />
                            </td>
                            <td>Agency 1</td>
                            <td>ABC Corp</td>
                            <td>10</td>
                            <td>50</td>
                            <td class="description">
                              Lorem ipsum dolor sit amet, consectetur adipiscing
                              elit. Sed ut risus in velit commodo bibendum.
                              Donec vel eros vitae magna congue rhoncus. Proin
                              egestas mattis nulla, vel efficitur velit molestie
                              eget.
                            </td>
                          </tr>
                          <% } %>
                        </tbody>
                      </table>
                      <div class="d-flex justify-content-end">
                        <button
                          class="btn btn-secondary confirm-agency"
                          onclick="confirmAgency(event)"
                        >
                          Confirm
                        </button>
                      </div>
                    </div>

                    <!-- Table shows list of Buyer wants to handle this property -->
                    <div id="buyer-list" class="row hidden">
                      <div class="title-table mb-2 px-0">
                        <strong>Buyer Profiles</strong>
                      </div>
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                            <tr>
                              <th class="text-center">Select</th>
                              <th class="text-center">Buyer Name</th>
                              <th class="text-center">Phone Number</th>
                              <th class="text-center message">Message</th>
                            </tr>
                          </thead>
                          <tbody>
                            <% for (int i = 0; i < 5; i++) { %>
                            <tr>
                              <td class="text-center">
                                <input type="checkbox" class="buyer-checkbox" />
                              </td>
                              <td class="text-center">Buyer 1</td>
                              <td class="text-center">123-456-7890</td>
                              <td class="message">
                                Lorem ipsum dolor sit amet, consectetur
                                adipiscing elit. Sed ut risus in velit commodo
                                bibendum. Donec vel eros vitae magna congue
                                rhoncus. Proin egestas mattis nulla, vel
                                efficitur velit molestie eget.
                              </td>
                            </tr>
                            <% } %>
                          </tbody>
                        </table>
                      </div>
                      <div class="d-flex justify-content-end mt-2">
                        <button
                          class="btn btn-secondary confirm-buyer"
                          onclick="confirmBuyer(event)"
                        >
                          Confirm
                        </button>
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
    <script src="/template/assets/js/plugins/chartjs.min.js'/>"></script>
    <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Internal JS -->
    <script>
      //URL REAL ESTATE API
      const urlRealEstate = "http://localhost:8085/api/real-estate/";

      // Automatically disable other choices in agency table when 1 is clicked
      $(".agency-checkbox").change(function () {
        if (this.checked) {
          $(".agency-checkbox").not(this).prop("disabled", true);
        } else {
          $(".agency-checkbox").not(this).prop("disabled", false);
        }
      });

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

      /* View Popup detail of each property */
      function viewDetailProperty(propID, type) {
        var popup = document.querySelector("#popup-property-request");
        var landSection = document.querySelector(".land-info-section");
        var houseSection = document.querySelector(".house-info-section");
        var agencyList = document.querySelector("#agency-list");
        var buyerList = document.querySelector("#buyer-list");

        // Send GET Request API to retrieve single property information
        $.ajax({
          url: urlRealEstate + propID,
          type: "GET",
          success: function (data) {
            // Update popup với information chosen Property
            $("#popup-name").text(data.name);
            $("#popup-status").text(data.status);
            $("#popup-desc").text(data.description);
            $("#popup-type").text(
              data.realEstateType 
            );
            $("#popup-address").text(data.address);
            $("#popup-area").text(data.area + " m²");
            $("#popup-price").text(data.textPrice + " VND");
            $("#popup-manager").text(data.managerInfo.username);
            console.log(data.realEstateType);

            //only show land/house fields according to type
            if (data.realEstateType == 'land') {
              landSection.classList.remove("hidden");
              houseSection.classList.add("hidden");
              $("#popup-land-type").text(data.propertyLand.landType);
              $("#popup-land-pw").text("sample-pdf-land");
              document.querySelector("#popup-land-pw").setAttribute('href', 'sample.pdf');
              
            } else {
              houseSection.classList.remove("hidden");
              landSection.classList.add("hidden");
              $("#popup-house-type").text(data.propertyHouse.houseType);
              $("#popup-house-pw").text("sample-zip-house");
              document.querySelector("#popup-house-pw").setAttribute('href', 'sample.zip');
              $("#popup-builtIn").text(data.propertyHouse.builtIn);
              $("#popup-bed").text(data.propertyHouse.bedroom + " rooms");
              $("#popup-bath").text(data.propertyHouse.bath + " rooms");
            }

            //only show list of Agency/Buyer Profiles if it's list of owned Properties
            if (data.status.toLowerCase() == "agency_approving") {
                agencyList.classList.remove("hidden");
            } else if (data.status.toLowerCase() == "buyer_approving") {
              buyerList.classList.remove("hidden");
            }

            popup.classList.remove("hidden");
          },
          error: function () {
            //Error when sending request
            console.error("Error fetching property details");
          },
        });
      }

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
        if (type.includes("prop")) {
          //Get values from input search
          var searchInput = document
            .getElementById("propSearch")
            .value.toLowerCase();

          // Get all rows in table
          var requests = document.querySelectorAll(".req-row");

          requests.forEach(function (row) {
            var id = row.querySelector("#req-id").textContent.toLowerCase();
            var name = row.querySelector("#req-name").textContent.toLowerCase();
            var type = row.querySelector("#req-type").textContent.toLowerCase();
            if (
              id.includes(searchInput) ||
              name.includes(searchInput) ||
              type.includes(searchInput)
            ) {
              row.style.display = "";
            } else {
              row.style.display = "none";
            }
          });
        } else {
          //Get values from input search
          var searchInput = document
            .getElementById("ownSearch")
            .value.toLowerCase();

          // Get all rows in table
          var requests = document.querySelectorAll(".prop-row");

          requests.forEach(function (row) {
            var id = row.querySelector("#prop-id").textContent.toLowerCase();
            var name = row
              .querySelector("#prop-name")
              .textContent.toLowerCase();
            var type = row
              .querySelector("#prop-type")
              .textContent.toLowerCase();
            if (
              id.includes(searchInput) ||
              name.includes(searchInput) ||
              type.includes(searchInput)
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
