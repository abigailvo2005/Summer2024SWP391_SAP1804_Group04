<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="jakarta.tags.core" prefix="c" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>RECS - Dashboard</title>

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
        <!-- START: List Processing Job -->
        <div class="row my-4 mx-2">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-8 col-9">
                    <h6>Jobs On Hold</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-solid fa-hourglass-start"></i>
                      <span class="font-weight-bold ms-1">${valList.size()} job(s)</span>
                      pending
                    </p>
                  </div>
                  <!-- search bar -->
                  <div class="ms-md-auto pe-md-3 d-flex align-items-center col-lg-4 col-3">
                    <div class="input-group">
                      <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
                      <input id="jobSearch" type="text" class="form-control" placeholder="Type name/status here..."
                        onkeyup="searchTable('job')" />
                    </div>
                  </div>
                </div>
              </div>

              <div class="card-body px-0 pb-2">
                <div class="table-responsive">
                  <table class="table align-items-center mb-0">
                    <thead>
                      <tr>
                        <th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                          STAFF
                        </th>
                        <th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3">
                          PROPERTY NAME
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                          TYPE
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                          PRICE
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2">
                          STATUS
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2">
                          DATE CREATED
                        </th>

                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                          VIEW DETAILS
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${valList}" var="val">
                        <tr class="job-row">
                          <td class="align-middle text-center text-sm">
                            <div class="d-flex px-2 py-1 justify-content-center">
                              <div class="d-flex flex-column justify-content-center">
                                <p class="mb-0 text-sm fw-bold text-dark">${val.staffInfo.username}</p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="d-flex justify-content-start">
                              <div class="d-flex flex-column justify-content-start">
                                <p id="job-name" class="mb-0 text-sm fw-bold text-dark">
                                  ${val.realEstateInfo.name}
                                </p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="d-flex px-2 py-1 justify-content-center">
                              <div class="d-flex flex-column justify-content-center">
                                <p class="mb-0 text-sm fw-bold text-dark">
                                  ${val.realEstateInfo.realEstateType}
                                </p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="d-flex px-2 py-1 justify-content-center">
                              <div class="d-flex flex-column justify-content-center">
                                <p class="mb-0 text-sm fw-bold text-dark">
                                  ${val.realEstateInfo.textPrice}
                                </p>
                              </div>
                            </div>
                          </td>
                          <td class="align-middle">
                            <div class="d-flex px-2 py-1 justify-content-center">
                              <div class="d-flex flex-column justify-content-center">
                                <p id="job-status" class="mb-0 text-sm fw-bold text-warning">
                                  ${val.status}
                                </p>
                              </div>
                            </div>
                          </td>
                          <td class="align-middle">
                            <div class="d-flex px-2 py-1 justify-content-center">
                              <div class="d-flex flex-column justify-content-center">
                                <p class="mb-0 text-sm fw-bold text-dark">
                                  ${val.realEstateInfo.createDate}
                                </p>
                              </div>
                            </div>
                          </td>
                          <td class="align-middle">
                            <div class="d-flex px-2 py-1 justify-content-center">
                              <div class="d-flex flex-column justify-content-center">
                                <a class="show-detail" onclick="viewDetail('${val.jobId}')"><i class="fa-solid fa-eye"></i></a>
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
        <!-- END LIST 1-->

        <!-- START: List Processing Properties -->

        <!-- END LIST 2-->

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

      <!--Start Popup-->
      <div id="popup-detail" class="popup-container hidden z-index-3">
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

          <!--Job validate content-->
          <div class="row">
            <div class="col-12 mt-sm-1">
              <div class="card h-100">
                <div class="card-body p-3">
                  <ul class="list-group">
                    <div class="container-fluid">
                      <div class="row">
                        <div class="validation-only col-4 px-0">
                          <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
                            <strong class="text-dark">Validate by:</strong>
                            <p id="popup-uname"></p>
                          </li>
                        </div>
                        <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
                          <strong class="text-dark">Created on:</strong>
                          <p id="popup-dateCreated"></p>
                        </li>
                        <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
                          <strong class="text-dark">Status:</strong>
                          <p id="popup-status"></p>
                        </li>
                      </div>
                      <div class="row">
                        <li class="list-group-item border-0 ps-0 text-sm col-12 d-flex">
                          <strong class="text-dark">Address:</strong>
                          <p id="popup-address"></p>
                        </li>
                      </div>

                      <div class="row">
                        <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
                          <strong class="text-dark">Area:</strong>
                          <p id="popup-area"></p>
                        </li>

                        <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
                          <strong class="text-dark">Price:</strong>
                          <p id="popup-price"></p>
                        </li>

                        <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
                          <strong class="text-dark">Type:</strong>
                          <p id="popup-type"></p>
                        </li>
                      </div>

                      <div class="row">
                        <li class="list-group-item border-0 ps-0 text-sm col-12 d-flex">
                          <strong class="text-dark">Description:</strong>
                          <p id="popup-desc"></p>
                        </li>
                      </div>

                      <div id="land-info" class="row hidden">
                        <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                          <strong class="text-dark">Land Type:</strong>
                          <p id="popup-land-type"></p>
                        </li>
                        <div class="validation-only col-6 px-0">
                          <li class="list-group-item border-0 ps-0 text-sm d-flex">
                            <strong class="text-dark">Land Paperwork:</strong>
                            <a id="popup-land-pw" target="_blank" download></a>
                          </li>
                        </div>
                      </div>

                    </div>
                    <div id="house-info" class="hidden">
                      <div class="row">
                        <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
                          <strong class="text-dark">House Type:</strong>
                          <p id="popup-house-type"></p>
                        </li>
                        <div class="validation-only col-8 px-0">
                          <li class="list-group-item border-0 ps-0 text-sm" id="housePaperwork">
                            <strong class="text-dark">House Paperwork:</strong>
                            <a id="popup-house-pw" target="_blank" download></a>
                          </li>
                        </div>
                      </div>
                      <div class="row">
                        <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
                          <strong class="text-dark">Bedrooms:</strong>
                          <p id="popup-bed"></p>
                        </li>
                        <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
                          <strong class="text-dark">Bathrooms:</strong>
                          <p id="popup-bath"></p>
                        </li>
                        <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
                          <strong class="text-dark">Year Built:</strong>
                          <p id="popup-builtIn"></p>
                        </li>
                      </div>
                    </div>

                    <!-- image section for popup -->
                    <div class="row mb-3">
                      <div id="image-section" class="carousel slide" data-bs-ride="carousel">
                        <!-- buttons to directly see an image -->
                        <div class="carousel-indicators">
                          <button type="button" data-bs-target="#image-section" data-bs-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                          <button type="button" data-bs-target="#image-section" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                          <button type="button" data-bs-target="#image-section" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                          <div class="carousel-item active">
                            <img src="../../template/assets/img/home-decor-1.jpg" class="d-block w-100 rounded"
                              alt="Real Estate Image 1" />
                          </div>
                          <div class="carousel-item">
                            <img src="../../template/assets/img/home-decor-2.jpg" class="d-block w-100 rounded"
                              alt="Real Estate Image 2" />
                          </div>
                          <div class="carousel-item">
                            <img src="../../template/assets/img/home-decor-3.jpg" class="d-block w-100 rounded"
                              alt="Real Estate Image 3" />
                          </div>
                        </div>
                        <!-- button fd/backwards -->
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
                </div>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--End Popup-->

      <script>

        function closeDetail() {
          var popup = document.getElementById("popup-detail");
          popup.classList.add("hidden");
        }
        //URL REAL ESTATE API 
        const urlJobValidate = "http://localhost:8085/api/job/validation/";
        
        function viewDetail(jobID) {
          var popup = document.getElementById("popup-detail");
          var landSection = popup.querySelector("#land-info");
          var houseSection = popup.querySelector("#house-info");

          $.ajax({
            url: urlJobValidate + jobID,
            type: "GET",
            success: function (data) {
              $("#popup-uname").text(data.staffInfo.staffId);
              $("#popup-dateCreated").text(data.realEstateInfo.createDate);
              $("#popup-status").text(data.status);
              $("#popup-address").text(data.realEstateInfo.address);
              $("#popup-area").text(data.realEstateInfo.area + " m²");
              $("#popup-price").text(data.realEstateInfo.textPrice + " VND");
              $("#popup-type").text(data.realEstateInfo.realEstateType);
              $("#popup-desc").text(data.realEstateInfo.description);

              if(data.realEstateInfo.realEstateType == "Land") {
                landSection.classList.remove("hidden");
                houseSection.classList.add("hidden");
                $("#popup-land-type").text(data.realEstateInfo.propertyLand.landType);
                $("#popup-land-pw").text("sample-pdf-land");
                document.querySelector("#popup-land-pw").setAttribute("href", "sample.pdf");
              } else {
                houseSection.classList.remove("hidden");
                landSection.classList.add("hidden");
                $("popup-house-pw").text("sample-zip-house");
                document.querySelector("#popup-house-pw").setAttribute("href", "sample.zip");
                $("#popup-bed").text(data.realEstateInfo.propertyHouse.bedroom);
                $("#popup-bath").text(data.realEstateInfo.propertyHouse.bath);
                $("#popup-builtIn").text(data.realEstateInfo.propertyHouse.builtIn);
              }
              popup.classList.remove("hidden");
            },
            error: function() {
              console.error("Error fetching job details");
            },
          });
          
        }

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
          //Get values from input search
          var searchInput = document
            .getElementById("jobSearch")
            .value.toLowerCase();

          // Get all rows in table
          var jobs = document.querySelectorAll(".job-row");

          jobs.forEach(function (row) {
            var jobName = row
              .querySelector("#job-name")
              .textContent.toLowerCase();
            var jobStatus = row
              .querySelector("#job-status")
              .textContent.toLowerCase();
            if (
              jobName.includes(searchInput) ||
              jobStatus.includes(searchInput)
            ) {
              row.style.display = "";
            } else {
              row.style.display = "none";
            }
          });
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