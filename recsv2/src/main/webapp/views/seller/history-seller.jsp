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

    <body class="g-sidenav-show bg-gray-100" onload="makeTableScroll()">
      <!-- START: SIDEBAR -->
      <header>
        <jsp:include page="/views/seller/sidebar-seller.jsp" />
      </header>
      <!-- END SIDEBAR -->

      <main class="main-conten no-dash position-relative max-height-vh-100 h-100 border-radius-lg">
        <!--Start List History Property connected successfully-->
        <div class="container-fluid">
          <div class="row my-4">
            <div class="mb-md-0 mb-4">
              <div class="card">
                <div class="card-header pb-0">
                  <div class="row">
                    <div class="col-lg-8 col-9">
                      <h6>History Property Close</h6>
                      <p class="text-sm mb-0">
                        <i class="fa-regular fa-comment-dots"></i>
                        <span class="font-weight-bold ms-1">${listClose.size()} property(s)</span>
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
                          <c:forEach items="${listClose}" var="close">
                            <tr class="close-row">
                              <td>
                                <div class="d-flex justify-content-start">
                                  <div class="d-flex flex-column justify-content-start">
                                    <p id="close-name" class="mb-0 text-sm fw-bold text-dark">
                                      ${close.name}
                                    </p>
                                  </div>
                                </div>
                              </td>
                              <td>
                                <div class="d-flex px-2 py-1 justify-content-center">
                                  <div class="d-flex flex-column justify-content-center">
                                    <p class="mb-0 text-sm fw-bold text-dark">
                                      ${close.textPrice}
                                    </p>
                                  </div>
                                </div>
                              </td>
                              <td class="align-middle">
                                <div class="d-flex px-2 py-1 justify-content-center">
                                  <div class="d-flex flex-column justify-content-center">
                                    <p id="close-type" class="mb-0 text-sm fw-bold text-dark">
                                      ${close.realEstateType}
                                    </p>
                                  </div>
                                </div>
                              </td>
                              <td class="align-middle">
                                <div class="d-flex px-2 py-1 justify-content-center">
                                  <div class="d-flex flex-column justify-content-center">
                                    <p class="mb-0 text-sm fw-bold status-color"
                                      value="${close.status.value}">
                                      ${close.status.value}
                                    </p>
                                  </div>
                                </div>
                              </td>
                              <td class="align-middle">
                                <div class="d-flex px-2 py-1 justify-content-center">
                                  <div class="d-flex flex-column justify-content-center">
                                    <a class="show-detail" onclick="viewDetail('${close.realEstateId}')"><i
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
        <!--End List History Property connected successfully-->

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

      <!--START POPUP-->
      <!-- START POPUP REQUESTS -->
      <div id="popup-property-request" class="popup-container hidden z-index-3">
        <div class="popup-content container-fluid">
          <!-- Header -->
          <div class="popup-header row mx-1">
            <div class="col-11">
              <h4 id="popup-name" class="card-header font-weight-bolder mb-0"></h4>
            </div>
            <div class="col-1">
              <i class="fa-solid fa-xmark close-button" onclick="closeDetail('popup-property-request')"></i>
            </div>
          </div>

          <!--Property content-->
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
                      <!-- image section & description for popup -->
                      <div class="row">
                        <li class="list-group-item border-0 ps-0 text-sm col-5 d-flex">
                          <strong class="text-dark">Description:</strong>
                          <p id="popup-desc"></p>
                        </li>
                        <div id="image-section" class="carousel slide mb-3 col-7 mt-2" data-bs-ride="carousel">
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
                          <a class="landpw" id="popup-land-pw" target="_blank" download></a>
                      </div>
                      <div class="house-info-section hidden">
                        <div class="row">
                          <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                            <strong class="text-dark">House Type: </strong>
                            <p id="popup-house-type"></p>
                          </li>
                          <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                            <strong class="text-dark">Paperwork: </strong>
                            <a class="housepw" id="popup-house-pw" target="_blank" download></a>
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
                    </div>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--END POPUP-->

      <!--   Core JS Files   -->
      <script src="/template/assets/js/core/bootstrap.min.js"></script>
      <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="../../template/assets/js/general-features.js"></script>
      <script>
        //URL REAL ESTATE API
        const urlRealEstate = "http://localhost:8085/api/real-estate/";
        /* View Popup detail of each property */
        function viewDetail(propID, type) {
          var popup = document.querySelector("#popup-property-request");
          var landSection = document.querySelector(".land-info-section");
          var houseSection = document.querySelector(".house-info-section");
          // Send GET Request API to retrieve single property information
          $.ajax({
            url: urlRealEstate + propID,
            type: "GET",
            success: function (data) {
              // Update popup với information chosen Property
              $("#popup-name").text(data.name);
              $("#popup-status").text(data.status.toLowerCase());

              $("#popup-desc").text(data.description);
              $("#popup-type").text(data.realEstateType);
              $("#popup-address").text(data.address);
              $("#popup-area").text(data.area + " m²");
              $("#popup-price").text(data.textPrice + " VND");

              //only show land/house fields according to type
              if (data.realEstateType == "Land") {
                console.log(data.realEstateType)
                landSection.classList.remove("hidden");
                houseSection.classList.add("hidden");
                $("#popup-land-type").text(data.propertyLand.landType);
                $("#popup-land-pw").text("download this file to view paperwork");
                document
                  .querySelector("#popup-land-pw")
                  .setAttribute("href", data.paperWorks);
              } else {
                console.log(data.realEstateType)
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
        //to close popup
        function closeDetail(id) {
          document.getElementById(id).classList.add("hidden");
        }

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
          if (type.includes("close")) {
            //Get values from input search
            var searchInput = document
              .getElementById("searchInput")
              .value.toLowerCase();

            // Get all rows in table
            var requests = document.querySelectorAll(".close-row");

            requests.forEach(function (row) {
              var name = row
                .querySelector("#close-name")
                .textContent.toLowerCase();
              var type = row
                .querySelector("#close-type")
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
              .getElementById("search")
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