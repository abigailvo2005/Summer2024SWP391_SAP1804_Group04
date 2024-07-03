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

    <body class="g-sidenav-show bg-gray-100" ondload="makeTableScroll()">
      <!-- START: SIDEBAR -->
      <header>
        <jsp:include page="/views/agency/sidebar-agency.jsp" />
      </header>
      <!-- END SIDEBAR -->

      <main class="main-conten no-dash position-relative max-height-vh-100 h-100 border-radius-lg">

        <!--Start List History Job assigned validate success-->
        <div class="container-fluid">
          <div class="row my-4">
            <div class="mb-md-0 mb-4">
              <div class="card">
                <div class="card-header pb-0">
                  <div class="row">
                    <div class="col-lg-8 col-9">
                      <h6>History Properties Closed</h6>
                      <p class="text-sm mb-0">
                        <i class="fa-regular fa-comment-dots"></i>
                        <span class="font-weight-bold ms-1">${listAssigned.size()} Closed(s)</span>
                        in total
                      </p>
                    </div>
                    <div class="ms-md-auto pe-md-3 d-flex align-items-center col-lg-4 col-3">
                      <div class="input-group">
                        <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
                        <input id="searchInput" type="text" class="form-control"
                          placeholder="Type property name here..." onkeyup="searchTable('close')" />
                      </div>
                    </div>
                  </div>

                  <div class="card-body px-0 pb-2">
                    <div class="table-responsive">
                      <table class="table align-items-center mb-0">
                        <thead>
                          <tr>
                            <th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3">
                              PROPERTY NAME
                            </th>
                            <th
                              class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                              PRICE
                            </th>
                            <th
                              class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2">
                              TYPE
                            </th>
                            <th
                              class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                              STATUS
                            </th>
                            <th
                              class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                              VIEW DETAILS
                            </th>
                          </tr>
                        </thead>

                        <tbody>
                          <c:forEach items="${listAssigned}" var="assigned">
                            <tr class="close-row">
                              <td>
                                <div class="d-flex justify-content-start">
                                  <div class="d-flex flex-column justify-content-start">
                                    <p id="close-name" class="mb-0 text-sm fw-bold text-dark">
                                      ${assigned.realEstate.name}
                                    </p>
                                  </div>
                                </div>
                              </td>
                              <td>
                                <div class="d-flex px-2 py-1 justify-content-center">
                                  <div class="d-flex flex-column justify-content-center">
                                    <p class="mb-0 text-sm fw-bold text-dark">
                                      ${assigned.realEstate.textPrice}
                                    </p>
                                  </div>
                                </div>
                              </td>
                              <td class="align-middle">
                                <div class="d-flex px-2 py-1 justify-content-center">
                                  <div class="d-flex flex-column justify-content-center">
                                    <p id="close-type" class="mb-0 text-sm fw-bold text-dark">
                                      ${assigned.realEstate.realEstateType}
                                    </p>
                                  </div>
                                </div>
                              </td>
                              <td class="align-middle">
                                <div class="d-flex px-2 py-1 justify-content-center">
                                  <div class="d-flex flex-column justify-content-center">
                                    <p class="mb-0 text-sm fw-bold text-muted status-color" value="${assigned.status}">
                                      ${assigned.status}
                                    </p>
                                  </div>
                                </div>
                              </td>
                              <td class="align-middle">
                                <div class="d-flex px-2 py-1 justify-content-center">
                                  <div class="d-flex flex-column justify-content-center">
                                    <a class="show-detail" onclick="viewDetail('${assigned.dealId}', 'close')"><i
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
        <!--End History List Job Assigned Validated Success-->

        <!--Start List History Agency Request-->
        <div class="container-fluid">
          <div class="row my-4">
            <div class="mb-md-0 mb-4">
              <div class="card">
                <div class="card-header pb-0">
                  <div class="row">
                    <div class="col-lg-8 col-9">
                      <h6>History Agency Request</h6>
                      <p class="text-sm mb-0">
                        <i class="fa-regular fa-comment-dots"></i>
                        <span class="font-weight-bold ms-1">${historyList.size()} request(s)</span>
                        in total
                      </p>
                    </div>
                    <div class="ms-md-auto pe-md-3 d-flex align-items-center col-lg-4 col-3">
                      <div class="input-group">
                        <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
                        <input id="searchHistInput" type="text" class="form-control"
                          placeholder="Type property name here..." onkeyup="searchTable('hist')" />
                      </div>
                    </div>
                  </div>

                  <div class="card-body px-0 pb-2">
                    <div class="table-responsive">
                      <table class="table align-items-center mb-0">
                        <thead>
                          <tr>
                            <th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3">
                              PROPERTY NAME
                            </th>
                            <th
                              class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                              PRICE
                            </th>
                            <th
                              class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2">
                              TYPE
                            </th>
                            <th
                              class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                              STATUS
                            </th>
                            <th
                              class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                              VIEW DETAILS
                            </th>
                          </tr>
                        </thead>

                        <tbody>
                          <c:forEach items="${historyList}" var="history">
                            <tr class="history-row">
                              <td>
                                <div class="d-flex justify-content-start">
                                  <div class="d-flex flex-column justify-content-start">
                                    <p id="hist-name" class="mb-0 text-sm fw-bold text-dark">
                                      ${history.realEstate.name}
                                    </p>
                                  </div>
                                </div>
                              </td>
                              <td>
                                <div class="d-flex px-2 py-1 justify-content-center">
                                  <div class="d-flex flex-column justify-content-center">
                                    <p class="mb-0 text-sm fw-bold text-dark">
                                      ${history.realEstate.textPrice}
                                    </p>
                                  </div>
                                </div>
                              </td>
                              <td class="align-middle">
                                <div class="d-flex px-2 py-1 justify-content-center">
                                  <div class="d-flex flex-column justify-content-center">
                                    <p id="hist-type" class="mb-0 text-sm fw-bold text-dark">
                                      ${history.realEstate.realEstateType}
                                    </p>
                                  </div>
                                </div>
                              </td>
                              <td class="align-middle">
                                <div class="d-flex px-2 py-1 justify-content-center">
                                  <div class="d-flex flex-column justify-content-center">
                                    <p class="mb-0 text-sm fw-bold text-muted status-color" value="${history.status}">
                                      ${history.status}
                                    </p>
                                  </div>
                                </div>
                              </td>
                              <td class="align-middle">
                                <div class="d-flex px-2 py-1 justify-content-center">
                                  <div class="d-flex flex-column justify-content-center">
                                    <a class="show-detail" onclick="viewDetail('${history.requestId}', 'hist')"><i
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
        <!--End History List JAgency Request-->



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

      <!-- START POPUP -->
      <div id="popup-property-request" class="popup-container hidden z-index-3">
        <div class="popup-content container-fluid">
          <!-- Header -->
          <div class="popup-header row mx-1">
            <div class="col-11">
              <h4 id="popup-name" class="card-header font-weight-bolder mb-0"></h4>
            </div>
            <div class="col-1">
              <i class="fa-solid fa-xmark close-button" onclick="closeDetail()"></i>
            </div>
          </div>

          <!-- deal content -->
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
                        <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex deal-only hidden">
                          <strong class="text-dark">Handled by:</strong>
                          <p id="popup-handle"></p>
                        </li>
                      </div>

                      <!-- image section & description for popup -->
                      <div class="row">
                        <li class="list-group-item border-0 ps-0 text-sm col-5 d-flex">
                          <strong class="text-dark">Description:</strong>
                          <p id="popup-desc"></p>
                        </li>
                        <div id="image-section" class="carousel slide mb-3 col-7" data-bs-ride="carousel">
                          <div class="carousel-indicators"></div>
                          <div class="carousel-inner"></div>
                          <button class="carousel-control-prev" type="button" data-bs-target="#image-section"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                          </button>
                          <button class="carousel-control-next" type="button" data-bs-target="#image-section"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                          </button>
                        </div>
                      </div>
                      <!-- end: image carousel -->

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
                      </div>

                      <div class="house-info-section hidden">
                        <div class="row">
                          <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                            <strong class="text-dark">House Type: </strong>
                            <p id="popup-house-type"></p>
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

                      <div class="row">
                        <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                          <strong class="text-dark">Experienced Years: </strong>
                          <p id="popup-agency-experience"></p>
                        </li>
                          <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                            <strong class="text-dark">Completed Projects: </strong>
                            <p id="popup-agency-completed"></p>
                        </div>

                      <!-- Agency Request - Message to seller -->
                      <div class="row deal-message">
                        <li class="list-group-item border-0 ps-0 text-sm">
                          <strong class="text-dark">Your Message:</strong>
                          <p id="popup-agency-message"></p>
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
      <!-- END POPUP-->

      <!--   Core JS Files   -->
      <script src="/template/assets/js/core/popper.min.js"></script>
      <script src="/template/assets/js/core/bootstrap.min.js"></script>
      <script src="/template/assets/js/plugins/perfect-scrollbar.min.js"></script>
      <script src="/template/assets/js/plugins/smooth-scrollbar.min.js"></script>
      <script src="/template/assets/js/plugins/chartjs.min.js"></script>
      <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="../../template/assets/js/general-features.js"></script>
      <script>

        const urlDeal = "http://localhost:8085/api/deal/";
        const urlAgencyRequest = "http://localhost:8085/api/agency-request/";

        function viewDetail(propID, type) {
          var popup = document.querySelector("#popup-property-request");
          var landSection = document.querySelector(".land-info-section");
          var houseSection = document.querySelector(".house-info-section");
          var dealSection = document.querySelector(".deal-only");
          var dealMessage = document.querySelector(".deal-message");
          var url = null;
          if (type == "close") {
            url = urlDeal;
            // Send GET Request API to retrieve single property information
            $.ajax({
              url: url + propID,
              type: "GET",
              success: function (data) {
                // Update popup with information chosen Property
                $("#popup-name").text(data.realEstate.name);
                $("#popup-status").text(data.status);
                $("#popup-handle").text(data.member.fullName);
                $("#popup-desc").html(data.realEstate.description.replace(/\r\n/g, "<br>"));
                $("#popup-type").text(data.realEstate.realEstateType);
                $("#popup-address").text(data.realEstate.address);
                $("#popup-area").text(data.realEstate.area + " m²");
                $("#popup-price").text(data.realEstate.textPrice + " VND");
                $("#popup-agency-message").html(data.realEstate.agencyRequests.message);

                //only show land/house fields according to type
                if (data.realEstate.realEstateType == "Land") {
                  landSection.classList.remove("hidden");
                  houseSection.classList.add("hidden");
                  $("#popup-land-type").text(data.realEstate.propertyLand.landType);
                } else {
                  houseSection.classList.remove("hidden");
                  landSection.classList.add("hidden");
                  $("#popup-house-type").text(
                    data.realEstate.propertyHouse.houseType
                  );
                  $("#popup-builtIn").text(data.realEstate.propertyHouse.builtIn);
                  $("#popup-bed").text(
                    data.realEstate.propertyHouse.bedroom + " rooms"
                  );
                  $("#popup-bath").text(
                    data.realEstate.propertyHouse.bath + " rooms"
                  );
                }

                //only show deal information if Deal is clicked
                if (type == "close") {
                  dealSection.classList.remove("hidden");
                  dealMessage.classList.add("hidden");
                }

                //load images to carousel
                const carouselInner = document.querySelector(".carousel-inner");
                const carouselIndicators = document.querySelector(
                  ".carousel-indicators"
                );

                // Reset images to be shown everytime popup is clicked
                carouselInner.innerHTML = "";
                carouselIndicators.innerHTML = "";

                data.realEstate.propertyImagesList.forEach((image, index) => {
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
              error: function () {
                //Error when sending request
                console.error("Error fetching property details");
              },
            });
          } else {
            url = urlAgencyRequest;
            // Send GET Request API to retrieve single property information
            $.ajax({
              url: url + propID,
              type: "GET",
              success: function (data) {
                // Update popup with information chosen Property
                $("#popup-name").text(data.realEstate.name);
                $("#popup-status").text(data.status);
                $("#popup-desc").html(data.realEstate.description.replace(/\r\n/g, "<br>"));
                $("#popup-type").text(data.realEstate.realEstateType);
                $("#popup-address").text(data.realEstate.address);
                $("#popup-area").text(data.realEstate.area + " m²");
                $("#popup-price").text(data.realEstate.textPrice + " VND");
                $("#popup-agency-experience").text(data.agency.yearsOfExperience + " years");
                $("#popup-agency-completed").text(data.agency.completedProject + " successfully connected properties.");
                $("#popup-agency-message").html(data.message.replace(/\r\n/g, "<br>"));

                //only show land/house fields according to type
                if (data.realEstate.realEstateType == "Land") {
                  landSection.classList.remove("hidden");
                  houseSection.classList.add("hidden");
                  $("#popup-land-type").text(data.realEstate.propertyLand.landType);
                } else {
                  houseSection.classList.remove("hidden");
                  landSection.classList.add("hidden");
                  $("#popup-house-type").text(
                    data.realEstate.propertyHouse.houseType
                  );
                  $("#popup-builtIn").text(data.realEstate.propertyHouse.builtIn);
                  $("#popup-bed").text(
                    data.realEstate.propertyHouse.bedroom + " rooms"
                  );
                  $("#popup-bath").text(
                    data.realEstate.propertyHouse.bath + " rooms"
                  );
                }

                //only show deal information if Deal is clicked
                if (type == "deal") {
                  dealSection.classList.remove("hidden");
                }

                //load images to carousel
                const carouselInner = document.querySelector(".carousel-inner");
                const carouselIndicators = document.querySelector(
                  ".carousel-indicators"
                );

                // Reset images to be shown everytime popup is clicked
                carouselInner.innerHTML = "";
                carouselIndicators.innerHTML = "";

                data.realEstate.images.forEach((image, index) => {
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
              error: function () {
                //Error when sending request
                console.error("Error fetching property details");
              },
            });
          }

        }

        /* Close Popup */
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
        //display elements according to search value
        function searchTable(type) {
          //search for request register accounts
          if (type.includes("close")) {
            //Get values from input search
            var searchInput = document
              .getElementById("searchInput")
              .value.toLowerCase();

            // Get all rows in table
            var requests = document.querySelectorAll(".close-row");

            requests.forEach(function (row) {
              var name = row.querySelector("#close-name").textContent.toLowerCase();
              var type = row.querySelector("#close-type").textContent.toLowerCase();
              if (
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
              .getElementById("searchHistInput")
              .value.toLowerCase();

            // Get all rows in table
            var requests = document.querySelectorAll(".history-row");

            requests.forEach(function (row) {
              var name = row
                .querySelector("#hist-name")
                .textContent.toLowerCase();
              var type = row
                .querySelector("#hist-type")
                .textContent.toLowerCase();
              if (
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

        /* Automatically make every table scrollable */
        window.onload = function () {
          makeTableScroll();
        };
      </script>
    </body>

    </html>