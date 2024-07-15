<%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RECS - History</title>

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

  <body class="g-sidenav-show bg-gray-100">
    <!-- START: SIDEBAR -->
    <header>
      <jsp:include page="/views/staff/sidebar-staff.jsp"/>
    </header>
    <!-- END SIDEBAR -->

    <main
      class="main-content no-dash position-relative max-height-vh-100 h-100 border-radius-lg"
    >
    <!--Start List History Job assigned validate success-->
    <div class="container-fluid">
        <div class="row my-4">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-8 col-9">
                    <h6>History Properties Validated Success</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-regular fa-comment-dots"></i>
                      <span class="font-weight-bold ms-1"
                        >${listSuccess.size()} validated(s)</span
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
                        id="searchInput"
                        type="text"
                        class="form-control"
                        placeholder="Type property name here..."
                        onkeyup="searchTable('success')"
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
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                          >
                            TYPE
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                          >
                            DATE CREATED
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
                        <c:forEach items="${listSuccess}" var="success">
                          <tr class="success-row">
                            <td>
                              <div class="d-flex justify-content-start">
                                <div
                                  class="d-flex flex-column justify-content-start"
                                >
                                  <p
                                    id="success-name"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${success.realEstateInfo.name}
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
                                  <p  id = "success-type"
                                      class="mb-0 text-sm fw-bold text-dark">
                                    ${success.realEstateInfo.realEstateType}
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
                                    ${success.realEstateInfo.createDate}
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
                                  <p class="mb-0 text-sm fw-bold status-color" value="${success.status.value}">
                                    ${success.status.value}
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
                                    onclick="viewDetail('${success.jobId}')"
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
      <!--End History List Job Assigned Validated Success-->

      <!--Start List History Job assigned validate fail-->
    <div class="container-fluid">
      <div class="row my-4">
        <div class="mb-md-0 mb-4">
          <div class="card">
            <div class="card-header pb-0">
              <div class="row">
                <div class="col-lg-8 col-9">
                  <h6>History Properties Validated fail</h6>
                  <p class="text-sm mb-0">
                    <i class="fa-regular fa-comment-dots"></i>
                    <span class="font-weight-bold ms-1"
                      >${listFail.size()} validated(s)</span
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
                      id="searchFail"
                      type="text"
                      class="form-control"
                      placeholder="Type property name here..."
                      onkeyup="searchTable('fail')"
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
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                        >
                          TYPE
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                        >
                          DATE CREATED
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
                      <c:forEach items="${listFail}" var="fail">
                        <tr class="fail-row">
                          <td>
                            <div class="d-flex justify-content-start">
                              <div
                                class="d-flex flex-column justify-content-start"
                              >
                                <p
                                  id="fail-name"
                                  class="mb-0 text-sm fw-bold text-dark"
                                >
                                  ${fail.realEstateInfo.name}
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
                                <p class="mb-0 text-sm fw-bold text-dark">
                                  ${fail.realEstateInfo.realEstateType}
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
                                  ${fail.realEstateInfo.createDate}
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
                                <p class="mb-0 text-sm fw-bold status-color" value="${fail.status.value}">
                                  ${fail.status.value}
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
                                  onclick="viewDetail('${fail.jobId}')"
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
    <!--End History List Job Assigned Validated fail-->

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

    <!--------------------START: POPUP SECTIONS-------------------- -->
    <div id="popup-detail" class="popup-container z-index-3 hidden">
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
                      <div class="validation-only col-6 px-0">
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                        >
                          <strong class="text-dark">Assigned by:</strong>
                          <p id="manager"></p>
                        </li>
                      </div>

                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                      >
                        <strong class="text-dark">Created on:</strong>
                        <p id="popup-dateCreated"></p>
                      </li>
                    </div>
                    <div class="row">
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                      >
                        <strong class="text-dark">Address:</strong>
                        <p id="popup-address"></p>
                      </li>
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                      >
                        <strong class="text-dark">Area:</strong>
                        <p id="popup-area"></p>
                      </li>
                    </div>

                    <div class="row">
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-4 d-flex"
                      >
                        <strong class="text-dark">Price:</strong>
                        <p id="popup-price"></p>
                      </li>

                      <li
                        class="list-group-item border-0 ps-0 text-sm col-4 d-flex"
                      >
                        <strong class="text-dark">Property Type:</strong>
                        <p id="popup-type"></p>
                      </li>

                      <li
                        class="list-group-item border-0 ps-0 text-sm col-4 d-flex"
                      >
                        <strong class="text-dark">Status:</strong>
                        <p id="popup-status"></p>
                      </li>
                    </div>

                    <!-- image section for popup -->
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
                    <!-- End img section -->

                    <div id="land-info" class="row hidden">
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                      >
                        <strong class="text-dark">Land Type:</strong>
                        <p id="popup-land-type"></p>
                      </li>
                      <div class="validation-only col-6 px-0">
                        <li
                          class="list-group-item border-0 ps-0 text-sm d-flex"
                        >
                          <strong class="text-dark">Land Paperwork:</strong>
                          <a id="popup-land-pw" target="_blank" download></a>
                        </li>
                      </div>
                    </div>
                    <div id="house-info" class="hidden">
                      <div class="row">
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-4 d-flex"
                        >
                          <strong class="text-dark">House Type:</strong>
                          <p id="popup-house-type"></p>
                        </li>
                        <div class="validation-only col-8 px-0">
                          <li
                            class="list-group-item border-0 ps-0 text-sm"
                            id="housePaperwork"
                          >
                            <strong class="text-dark">House Paperwork:</strong>
                            <a id="popup-house-pw" target="_blank" download></a>
                          </li>
                        </div>
                      </div>
                      <div class="row">
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-4 d-flex"
                        >
                          <strong class="text-dark">Bedrooms:</strong>
                          <p id="popup-bed"></p>
                        </li>
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-4 d-flex"
                        >
                          <strong class="text-dark">Bathrooms:</strong>
                          <p id="popup-bath"></p>
                        </li>
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-4 d-flex"
                        >
                          <strong class="text-dark">Year Built:</strong>
                          <p id="popup-builtIn"></p>
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


    <!--   Core JS Files   -->
    <script src="/template/assets/js/core/bootstrap.min.js"></script>
    <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../../template/assets/js/general-features.js"></script>
    <script>

      //URL REAL ESTATE API
      const urlJobValidation = "https://recs.site/api/job/validation/";

      //to show detail job or listings popup
      function viewDetail(jobID) {
        var popup = document.getElementById("popup-detail");
        var landSection = popup.querySelector("#land-info");
        var houseSection = popup.querySelector("#house-info");

        // Send GET Request API to retrieve single property information
        $.ajax({
          url: urlJobValidation + jobID,
          type: "GET",
          success: function (data) {
            // Update popup với information chosen Property
            $("#manager").text(data.managerInfo.username);
            $("#popup-name").text(data.realEstateInfo.name);
            $("#popup-status").text(data.status);
            var createDate = new Date(data.realEstateInfo.createTimestamp);
            $("#popup-dateCreated").text(
              createDate.toLocaleDateString("vi-VN", {
                day: "2-digit",
                month: "2-digit",
                year: "numeric",
              })
            );
            $("#popup-desc").text(data.realEstateInfo.description);
            $("#popup-type").text(data.realEstateInfo.realEstateType);
            $("#popup-address").text(data.realEstateInfo.address);
            $("#popup-area").text(data.realEstateInfo.area + " m²");
            $("#popup-price").text(data.realEstateInfo.textPrice + " $");


            //only show land/house fields according to type
            if (data.realEstateInfo.realEstateType == "Land") {
              landSection.classList.remove("hidden");
              houseSection.classList.add("hidden");
              $("#popup-land-type").text(
                data.realEstateInfo.propertyLand.landType
              );
              $("#popup-land-pw").text("download this file to view paperwork");
              document
                .querySelector("#popup-land-pw")
                .setAttribute("href", data.realEstateInfo.paperWorks);
            } else {
              houseSection.classList.remove("hidden");
              landSection.classList.add("hidden");
              $("#popup-house-type").text(
                data.realEstateInfo.propertyHouse.houseType
              );
              $("#popup-house-pw").text("download this file to view paperwork");
              document
                .querySelector("#popup-house-pw")
                .setAttribute("href", data.realEstateInfo.paperWorks);
              $("#popup-builtIn").text(
                data.realEstateInfo.propertyHouse.builtIn
              );
              $("#popup-bed").text(
                data.realEstateInfo.propertyHouse.bedroom + " rooms"
              );
              $("#popup-bath").text(
                data.realEstateInfo.propertyHouse.bath + " rooms"
              );
            }

            //load images to carousel
            const carouselInner = document.querySelector(".carousel-inner");
            const carouselIndicators = document.querySelector(
              ".carousel-indicators"
            );

            // Reset images to be shown everytime popup is clicked
            carouselInner.innerHTML = "";
            carouselIndicators.innerHTML = "";

            data.realEstateInfo.propertyImagesList.forEach((image, index) => {
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

      //to close detail validation request popup
      function closeDetail() {
        var popup = document.getElementById("popup-detail");
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

      //display elements according to search value
      function searchTable(type) {
        if (type.includes("success")) {
          // Get values from input field
          var searchReq = document
            .getElementById("searchInput")
            .value.toLowerCase();

          //Get all rows in table
          var requests = document.querySelectorAll(".success-row");

          //Iterate through all rows and hide/show based on value
          requests.forEach(function (row) {
            var propName = row
              .querySelector("#success-name")
              .textContent.toLowerCase();
            var propType = row
              .querySelector("#success-type")
              .textContent.toLowerCase();
            if (propName.includes(searchReq) || propType.includes(searchReq)) {
              row.style.display = "";
            } else {
              row.style.display = "none";
            }
          });
        } else {
          // Get values from input field
          var searchListing = document
            .getElementById("searchFail")
            .value.toLowerCase();

          //Get all rows in table
          var listings = document.querySelectorAll(".fail-row");

          //Iterate through all rows and hide/show based on value
          listings.forEach(function (row) {
            var propName = row
              .querySelector("#fail-name")
              .textContent.toLowerCase();
            if (propName.includes(searchListing)) {
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
