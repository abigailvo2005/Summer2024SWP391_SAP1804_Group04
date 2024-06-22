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
      <jsp:include page="/views/agency/sidebar-agency.jsp" />
    </header>
    <!-- END INCLUDE SIDEBAR -->

    <main
      class="main-content no-dash position-relative max-height-vh-100 h-100 border-radius-lg"
    >
      <!-- START: LIST LISTINGS -->
      <div class="container-fluid">
        <div class="row my-4">
          <div class="col-12">
            <div class="card-body px-0 pb-2">
              <div class="row">
                <c:forEach items="${propList}" var="prop">
                  <div class="col-md-6 mb-4">
                    <a
                      onclick="viewDetailProperty('${prop.realEstateId}', 'view')"
                      class="card-property-link"
                    >
                      <div class="card card-property card-property-hover">
                        <div class="row no-gutters">
                          <div class="col-4">
                            <img
                              src="${prop.propertyImagesList.get(0)}"
                              class="card-img"
                              alt="${prop.name}"
                            />
                          </div>
                          <div class="col-8">
                            <div class="card-body p-3">
                              <div class="row">
                                <p
                                  class="text-sm mb-0 text-capitalize font-weight-bold"
                                >
                                  ${prop.name}
                                </p>
                                <h5 class="font-weight-bolder mb-0">
                                  ${prop.textPrice} VND
                                  <span
                                    class="text-success text-sm font-weight-bolder"
                                    >/ ${prop.realEstateType}</span
                                  >
                                </h5>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </a>
                  </div>
                </c:forEach>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- END LIST LISTINGS -->

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
                      <div class="col-5" id="img-section">
                        <!-- image carousel -->
                        <div
                          id="image-section"
                          class="carousel slide mb-3"
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

                      <div class="col-6 ms-4" id="info-section">
                        <div class="row">
                          <li
                            class="list-group-item border-0 ps-0 text-sm d-flex"
                          >
                            <strong class="text-dark">Description:</strong>
                            <p id="popup-desc"></p>
                          </li>
                        </div>

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
                            <li
                              class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                            >
                              <strong class="text-dark">Built in: </strong>
                              <p id="popup-builtIn"></p>
                            </li>
                          </div>

                          <div class="row mt-2">
                            <li
                              class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                            >
                              <strong class="text-dark">Bedrooms: </strong>
                              <p id="popup-bed"></p>
                            </li>
                            <li
                              class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                            >
                              <strong class="text-dark">Bathrooms: </strong>
                              <p id="popup-bath"></p>
                            </li>
                          </div>
                        </div>
                        <div
                          id="handle-listing-btn"
                          class="row justify-content-end mt-3"
                        >
                          <button
                            class="btn btn-outline-dark"
                            onclick="showAgencyForm()"
                          >
                            Handle Listing
                          </button>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <form id="agency-profile-form" action="${pageContext.request.contextPath}/agency/agency-request" method="post" class="hidden">
                        <div class="row d-flex justify-content-center mb-2">
                          <div class="col-12 text-center">
                            <strong>Agency Profile</strong>
                          </div>
                        </div>
                        <input
                          type="hidden"
                          id="realEstateId"
                          name="realEstateId"
                        />
                        <div class="row mb-3">
                          <div class="col-6">
                            <label for="agency-name" class="form-label"
                              >Agency Name</label
                            >
                            <input
                              type="text"
                              class="form-control"
                              id="agency-name"
                              value="${name}"
                              readonly
                            />
                          </div>
                          <div class="col-6">
                            <label for="agency-contact" class="form-label"
                              >Company</label
                            >
                            <input
                              type="text"
                              class="form-control"
                              id="agency-company"
                              value="${agency.company}"
                              readonly
                            />
                          </div>
                        </div>

                        <div class="row mb-3">
                          <div class="col-6">
                            <label for="agency-name" class="form-label"
                              >Experienced Years</label
                            >
                            <input
                              type="text"
                              class="form-control"
                              id="agency-experience"
                              value="${agency.yearsOfExperience}"
                              readonly
                            />
                          </div>
                          <div class="col-6">
                            <label for="agency-contact" class="form-label"
                              >Completed Projects</label
                            >
                            <input
                              type="text"
                              class="form-control"
                              id="agency-projects"
                              value="${agency.completedProject}"
                              readonly
                            />
                          </div>
                        </div>
                        <div class="row mb-3">
                          <div class="col-12">
                            <label for="agency-name" class="form-label"
                              >Description/Message to Seller</label
                            >
                            <textarea
                              class="form-control"
                              id="agency-desc"
                              name="agencyMessage"
                            ></textarea>
                          </div>
                        </div>
                        <div class="mb-3 row justify-content-center">
                          <label class="form-label text-center"
                            ><i
                              >All details will be sent to the Seller for
                              confirmation of the Listing handling.</i
                            ></label
                          >
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-auto">
                            <button
                              type="button"
                              class="btn btn-dark"
                              onclick="submitAgencyProfile()"
                            >
                              Submit
                            </button>
                            <button
                              type="button"
                              class="btn btn-secondary"
                              onclick="hideAgencyForm()"
                            >
                              Cancel
                            </button>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END POPUP -->

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

      /* View Popup detail of each property */
      function viewDetailProperty(propID, action) {
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
            $("#popup-desc").text(data.description);
            $("#popup-type").text(data.realEstateType);
            $("#popup-address").text(data.address);
            $("#popup-area").text(data.area + " m²");
            $("#popup-price").text(data.textPrice + " VND");

            //only show land/house fields according to type
            if (data.realEstateType == "Land") {
              landSection.classList.remove("hidden");
              houseSection.classList.add("hidden");
              $("#popup-land-type").text(data.propertyLand.landType);
            } else {
              houseSection.classList.remove("hidden");
              landSection.classList.add("hidden");
              $("#popup-house-type").text(data.propertyHouse.houseType);
              $("#popup-builtIn").text(data.propertyHouse.builtIn);
              $("#popup-bed").text(data.propertyHouse.bedroom + " rooms");
              $("#popup-bath").text(data.propertyHouse.bath + " rooms");
            }

            //load real estate ID for submitting agency request
            document.querySelector("#realEstateId").setAttribute("value", data.realEstateId);

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
              imgElement.classList.add("d-block", "w-100", "rounded", "marketplace");
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

      /* Handle Submit Agency Profile */
      function submitAgencyProfile(e) {
        event.preventDefault();

        alert("Request submitted successfully!");
        closeDetail();
        hideAgencyForm();

        document.querySelector("#agency-profile-form").submit();

      }

      /* Show form to submit agency profile to seller */
      function showAgencyForm() {
        document
          .querySelector("#agency-profile-form")
          .classList.remove("hidden");
        document.querySelector("#handle-listing-btn").classList.add("hidden");
      }

      /* Hide form to submit agency profile to seller */
      function hideAgencyForm() {
        document.querySelector("#agency-profile-form").classList.add("hidden");
        document
          .querySelector("#handle-listing-btn")
          .classList.remove("hidden");
      }

      /* close popup view detail */
      function closeDetail() {
        document
          .getElementById("popup-property-request")
          .classList.add("hidden");
        hideAgencyForm();
      }

      //still forcely close every popup if clicked on somewhere else than close button
      window.onclick = function (event) {
        var popup = document.querySelector(".popup-container");
        if (event.target == popup) {
          popup.classList.add("hidden");
          hideAgencyForm();
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
