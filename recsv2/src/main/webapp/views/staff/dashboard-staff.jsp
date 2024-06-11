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

  <body class="g-sidenav-show bg-gray-100">
    <!-- START INCLUDE SIDEBAR -->
    <header>
      <jsp:include page="/views/staff/sidebar-staff.jsp" />
    </header>
    <!-- END INCLUDE SIDEBAR -->

    <main
      class="main-content position-relative max-height-vh-100 h-100 border-radius-lg no-dash"
    >
      <!-- START: LIST VALIDATION REQUEST -->
      <div class="container-fluid">
        <div class="row my-4">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-8 col-9">
                    <h6>All Property Validation Requests</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-regular fa-comment-dots"></i>
                      <span class="font-weight-bold ms-1"
                        >${jobList.size()} request(s)</span
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
                        id="jobSearch"
                        type="text"
                        class="form-control"
                        placeholder="Type property name/type here..."
                        onkeyup="searchTable('job')"
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
                        <c:forEach items="${jobList}" var="job">
                          <tr class="validate-row">
                            <td>
                              <div class="d-flex justify-content-start">
                                <div
                                  class="d-flex flex-column justify-content-start"
                                >
                                  <p
                                    id="req-name"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${job.realEstateInfo.name}
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
                                    ${job.realEstateInfo.realEstateType}
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
                                    ${job.createTimeStamp}
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
                                    ${job.status}
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
                                    onclick="viewDetail('${job.jobId}','job')"
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
      <!-- END LIST VALIDATION REQUEST-->

      <!-- START: LIST LISTINGS -->
      <div class="container-fluid">
        <div class="row my-4">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-8 col-9">
                    <h6>Your Listings</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-regular fa-comment-dots"></i>
                      <span class="font-weight-bold ms-1"
                        >${listingList.size()} listing(s)</span
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
                        id="listingSearch"
                        type="text"
                        class="form-control"
                        placeholder="Type listing name here..."
                        onkeyup="searchTable('listing')"
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
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                          >
                            PRICE
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
                        <c:forEach items="${listingList}" var="listing">
                          <tr class="listing-row">
                            <td>
                              <div class="d-flex justify-content-start">
                                <div
                                  class="d-flex flex-column justify-content-start"
                                >
                                  <p
                                    id="listing-name"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${listing.realEstateInfo.name}
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
                                    ${listing.realEstateInfo.realEstateType}
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
                                    id="listing-manID"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${listing.realEstateInfo.textPrice}
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
                                    ${listing.createTimeStamp}
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
                                    ${listing.status}
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
                                    onclick="viewDetail('${listing.id}', 'list')"
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
      <!-- END LIST LISTING-->

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
                          class="list-group-item border-0 ps-0 text-sm d-flex"
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

                    <div class="row">
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-12 d-flex"
                      >
                        <strong class="text-dark">Description:</strong>
                        <p id="popup-desc"></p>
                      </li>
                    </div>

                    <!-- image section for popup -->
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
                          <a id="popup-land-pw" target="_blank"></a>
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
                            <a id="popup-house-pw" target="_blank"></a>
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
                    <!-- Buttons to decide if property is appropriate or not -->
                    <form action="${pageContext.request.contextPath}/staff/validate-property" method="post">
                      <div class="row">
                        <div class="row">
                          <li
                            class="list-group-item border-0 ps-0 text-sm d-flex col-6"
                          >
                            <strong class="text-dark"
                              >Validation Status:</strong
                            >
                          </li>
                          <li
                            class="list-group-item border-0 ps-0 text-sm d-flex col-6"
                          >
                            <strong class="text-dark">Notes:</strong>
                          </li>
                        </div>
                        <div class="row">
                          <ul class="list-group col-6">
                            <li
                              class="list-group-item border-0 ps-0 text-sm d-flex"
                            >
                              <select
                                class="form-control ms-auto"
                                id="validateStatus"
                                name="validateStatus"
                                onchange="showNote()"
                              >
                                <option value="successful">Successful</option>
                                <option value="fail">Fail</option>
                              </select>
                            </li>
                            <li
                              id="successful-note"
                              class="list-group-item border-0 ps-0 text-sm d-flex"
                            >
                              <p class="text-muted fs-6 ms-auto">
                                The property paperwork have been successfully
                                validated. It is now certified and posted as a
                                Listing.
                              </p>
                            </li>
                            <li
                              id="fail-note"
                              class="list-group-item border-0 ps-0 text-sm d-flex hidden"
                            >
                              <p class="text-muted fs-6 ms-auto">
                                The property paperwork validation process
                                encountered an issue or. It is now cancelled.
                              </p>
                            </li>
                          </ul>

                          <div class="col-6 border-0 ps-0 text-sm">
                              <textarea
                                class="form-control"
                                id="notes"
                                name="notes"
                                rows="3"
                                placeholder="Enter any additional notes here..."
                              ></textarea>
                            </div>
                        </div>
                      </div>
                      <div class="row justify-content-center">
                        <div class="col-auto">
                          <button
                            type="submit"
                            onclick="alert('Successfully Confirm Property Validation!');"
                            class="btn btn-dark w-100 my-2 mb-2 btn-validation"
                          >
                            Confirm
                          </button>
                        </div>
                      </div>
                    </form>
                    <!--  -->
                  </div>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- ---------------- END POPUP SECTION --------------------- -->

    <!-- JS MODIFY POPUP -->
    <script>
      //URL REAL ESTATE API
      const urlJobValidation = "http://localhost:8085/api/job/validation/";

      /* Display validation status note according to chosen option */
      function showNote() {
        var validateStatus = document.getElementById("validateStatus").value;
        var successfulNote = document.getElementById("successful-note");
        var failNote = document.getElementById("fail-note");

        if (validateStatus == "successful") {
          successfulNote.classList.remove("hidden");
          failNote.classList.add("hidden");
        } else {
          successfulNote.classList.add("hidden");
          failNote.classList.remove("hidden");
        }
      }

      //to show detail job or listings popup
      function viewDetail(jobID, type) {
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
            $("#popup-desc").text(data.realEstateInfo.description);
            $("#popup-type").text(data.realEstateInfo.realEstateType);
            $("#popup-address").text(data.realEstateInfo.address);
            $("#popup-area").text(data.realEstateInfo.area + " m²");
            $("#popup-price").text(data.realEstateInfo.textPrice + " VND");

            //update chosen Job ID according to the chosen one
            $("#popup-jobID").value = data.jobId;

            //only show land/house fields accxording to type
            if (data.realEstateInfo.realEstateType == "land") {
              landSection.classList.remove("hidden");
              houseSection.classList.add("hidden");
              $("#popup-land-type").text(
                data.realEstateInfo.propertyLand.landType
              );
              $("#popup-land-pw").text("sample-gg-drive-link-land");
              document
                .querySelector("#popup-land-pw")
                .setAttribute(
                  "href",
                  "https://drive.google.com/drive/folders/1qXWhq9rQTjsq3ms_6NFoI_I63Dno7Acz?usp=drive_link"
                );
            } else {
              houseSection.classList.remove("hidden");
              landSection.classList.add("hidden");
              $("#popup-house-type").text(
                data.realEstateInfo.propertyHouse.houseType
              );
              $("#popup-house-pw").text("sample-gg-drive-link-house");
              document
                .querySelector("#popup-house-pw")
                .setAttribute(
                  "href",
                  "https://drive.google.com/drive/folders/1qXWhq9rQTjsq3ms_6NFoI_I63Dno7Acz?usp=drive_link"
                );
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
        if (type.includes("validation")) {
          // Get values from input field
          var searchReq = document
            .getElementById("validationSearch")
            .value.toLowerCase();

          //Get all rows in table
          var requests = document.querySelectorAll(".validate-row");

          //Iterate through all rows and hide/show based on value
          requests.forEach(function (row) {
            var propName = row
              .querySelector("#req-name")
              .textContent.toLowerCase();
            var manID = row
              .querySelector("#req-manID")
              .textContent.toLowerCase();
            if (propName.includes(searchReq) || manID.includes(searchReq)) {
              row.style.display = "";
            } else {
              row.style.display = "none";
            }
          });
        } else {
          // Get values from input field
          var searchListing = document
            .getElementById("listingSearch")
            .value.toLowerCase();

          //Get all rows in table
          var listings = document.querySelectorAll(".listing-row");

          //Iterate through all rows and hide/show based on value
          listings.forEach(function (row) {
            var propName = row
              .querySelector("#listing-name")
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

    <!--   Core JS Files   -->
    <script src="/template/assets/js/core/popper.min.js"></script>
    <script src="/template/assets/js/core/bootstrap.min.js"></script>
    <script src="/template/assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/chartjs.min.js"></script>
    <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </body>
</html>
