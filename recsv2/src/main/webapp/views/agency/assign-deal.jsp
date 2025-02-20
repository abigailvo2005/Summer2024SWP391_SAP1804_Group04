<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>RECS - Assign Deal</title>

        <!-- Link CSS -->
        <link id="pagestyle" href="/template/assets/css/soft-ui-dashboard.css?v=1.0.7" rel="stylesheet" />

        <!--Web's favicon-->
        <link rel="icon" type="image/png" href="/template/assets/img/logos/logo-no-name.png" />

        <!-- Fonts-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />

        <!-- FontAwesome: icons used in website-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

        <!--Alert Custom-->
        <link rel="stylesheet" type="text/css" href="/template/assets/css/sweetalert2.css" />
      </head>

      <body class="g-sidenav-show bg-gray-100" onload="makeTableScroll()">
        <!-- START: SIDEBAR -->
        <header>
          <jsp:include page="/views/agency/sidebar-agency.jsp" />
        </header>
        <!-- END SIDEBAR -->

        <main class="no-dash main-content position-relative max-height-vh-100 h-100 border-radius-lg">
          <!-- START: DEAL LISTING AVAILABLE -->
          <div class="container-fluid">
            <div class="row my-4">
              <div class="mb-md-0 mb-4">
                <div class="card">
                  <div class="card-header pb-0">
                    <div class="row">
                      <div class="col-lg-8 col-9">
                        <h6>Handled Listing Available</h6>
                        <p class="text-sm mb-0">
                          <i class="fa-solid fa-house-user"></i>
                          <span class="font-weight-bold ms-1">${handledList.size()} listing(s)</span>
                          in total
                        </p>
                      </div>
                      <div class="ms-md-auto pe-md-3 d-flex align-items-center col-lg-4 col-3">
                        <div class="input-group">
                          <span class="input-group-text text-body"><i class="fas fa-search"
                              aria-hidden="true"></i></span>
                          <input id="dealSearch" type="text" class="form-control" placeholder="Type name/type here..."
                            onkeyup="searchTable()" />
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
                                class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2">
                                TYPE
                              </th>
                              <th
                                class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2">
                                DATE HANDLED
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
                            <c:forEach items="${handledList}" var="listing">
                              <tr class="listing-row">
                                <td>
                                  <div class="d-flex justify-content-start">
                                    <div class="d-flex flex-column justify-content-start">
                                      <p id="listing-name" class="mb-0 text-sm fw-bold text-dark">
                                        ${listing.realEstate.name}
                                      </p>
                                    </div>
                                  </div>
                                </td>
                                <td>
                                  <div class="d-flex px-2 py-1 justify-content-center">
                                    <div class="d-flex flex-column justify-content-center">
                                      <p id="listing-type" class="mb-0 text-sm fw-bold text-dark">
                                        ${listing.realEstate.realEstateType}
                                      </p>
                                    </div>
                                  </div>
                                </td>
                                <td class="align-middle">
                                  <div class="d-flex px-2 py-1 justify-content-center">
                                    <p id="listing-createDate" class="mb-0 text-sm fw-bold text-dark">
                                      ${listing.createDate}
                                    </p>
                                  </div>
                                </td>
                                <td class="align-middle">
                                  <div class="d-flex px-2 py-1 justify-content-center">
                                    <div class="d-flex flex-column justify-content-center">
                                      <p id="listing-status" class="mb-0 text-sm fw-bold status-color"
                                        value="${listing.status}">
                                        ${listing.status}
                                      </p>
                                    </div>
                                  </div>
                                </td>
                                <td class="align-middle">
                                  <div class="d-flex px-2 py-1 justify-content-center">
                                    <div class="d-flex flex-column justify-content-center">
                                      <a class="show-detail" onclick="viewDetail('${listing.requestId}')"><i
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
          <!-- END DEAL LISTING AVAILABLE-->

          <!--------------------START: POPUP SECTIONS-------------------- -->
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

              <!-- Request content -->
              <div class="row">
                <div class="col-12 mt-sm-1">
                  <div class="card h-100">
                    <div class="card-body p-3">
                      <ul class="list-group">
                        <div class="container-fluid">
                          <div class="row">
                          <div class="row">
                            <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                              <strong class="text-dark">Address:</strong>
                              <p id="popup-address"></p>
                            </li>
                            <li class="list-group-item border-0 ps-0 text-sm col-6 d-flex">
                              <strong class="text-dark">Area:</strong>
                              <p id="popup-area"></p>
                            </li>
                          </div>

                          <div class="row">
                            <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
                              <strong class="text-dark">Price:</strong>
                              <p id="popup-price"></p>
                            </li>

                            <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
                              <strong class="text-dark">Property Type:</strong>
                              <p id="popup-type"></p>
                            </li>

                            <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
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

                          <div id="land-info-section" class="row hidden">
                            <li class="list-group-item border-0 ps-0 text-sm col-4 d-flex">
                              <strong class="text-dark">Land Type:</strong>
                              <p id="popup-land-type"></p>
                            </li>
                            <div class="validation-only col-8 px-0">
                              <li class="list-group-item border-0 ps-0 text-sm d-flex">
                                <strong class="text-dark">Land Paperwork:</strong>
                                <a id="popup-land-pw" target="_blank" download></a>
                              </li>
                            </div>
                          </div>
                          <div id="house-info-section" class="hidden">
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
                          <!-- Buttons to decide if wanted to approve user or not -->
                          <div class="col-12 mt-1">
                            <div class="h-100 container-fluid mt-0">
                              <div class="row justify-content-center">
                                <div class="col-auto">
                                  <button title="" type="button" onclick="showFormAssignDeal()"
                                    class="btn btn-dark w-100 my-2 mb-2 btn-validation">
                                    Assign To Member
                                  </button>
                                </div>
                              </div>
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

          <!-- START: FORM ASSIGN DEAL LISTING AVAILABLE -->
          <div id="form-assign-job-container" class="container hidden">
            <div class="row">
              <div class="col-12 col-xl-11 mx-auto">
                <div class="card z-index-0">
                  <div class="card-header text-center pt-4">
                    <h5><b>Deal Assign Comfirmation</b></h5>
                  </div>
                  <div class="card-body">
                    <form id="form-assign-deal" role="form text-left" name="assign-deal-form"
                      action="${pageContext.request.contextPath}/agency/assign-deal" method="post">
                      <input id="reqID" type="hidden" name="requestId" />
                      <input id="realEstateID" type="hidden" name="realEstateId"/>

                      <div class="mb-3 row">
                        <div class="col-sm-2"><label>Property Name:</label></div>
                        <div class="col-sm-4">
                          <input id="form-name" type="text" name="name" class="form-control form-create-control col-10"
                            disabled />
                        </div>
                        <div class="col-sm-2"><label>Address:</label></div>
                        <div class="col-sm-4">
                          <input id="form-address" type="text" name="address"
                            class="form-control form-create-control col-10" disabled />
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <div class="col-sm-2"><label>Description:</label></div>
                        <div class="col-sm-10">
                          <textarea id="form-description" name="description" type="text"
                            class="form-control form-create-control" rows="5" disabled></textarea>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <div class="col-sm-2"><label>Property Type:</label></div>
                        <div class="col-sm-4">
                          <input id="form-propertyType" type="text" name="propertyType"
                            class="form-control form-create-control col-10" disabled />
                        </div>
                        <div class="col-sm-2"><label>Price:</label></div>
                        <div class="col-sm-3">
                          <input id="form-price" type="text" name="textprice"
                            class="form-control form-create-control col-10" disabled />
                        </div>
                        <div class="col-sm-1"><label>$</label></div>
                      </div>
                      <div class="mb-3 row">
                        <div class="col-sm-2"><label>Area:</label></div>
                        <div class="col-sm-3">
                          <input id="form-area" type="number" name="area"
                            class="form-control form-create-control col-10" disabled />
                        </div>
                        <div class="col-sm-1"><label>m²</label></div>
                      </div>
                      <div id="land-info" class="mb-3 row">
                        <div class="col-sm-2"><label>Land Type:</label></div>
                        <div class="col-sm-4">
                          <input id="form-landCategory" type="text" name="landCategory"
                            class="form-control form-create-control col-10" disabled />
                        </div>
                        <div class="col-sm-2"><label>Land Paperwork:</label></div>
                        <div class="col-sm-4">
                          <label><a id="form-land-pw" target="_blank" download></a></label>
                        </div>
                      </div>
                      <div id="house-info">
                        <div class="mb-3 row">
                          <div class="col-sm-2"><label>House Type:</label></div>
                          <div class="col-sm-4">
                            <input id="form-houseCategory" type="text" name="houseCategory"
                              class="form-control form-create-control col-10" disabled />
                          </div>
                          <div class="col-sm-2">
                            <label>House Paperwork:</label>
                          </div>
                          <div class="col-sm-4">
                            <label><a id="form-house-pw" target="_blank" download></a></label>
                          </div>
                        </div>
                        <div class="mb-3 row">
                          <div class="col-sm-2"><label>Bedrooms:</label></div>
                          <div class="col-sm-2">
                            <input id="form-bedrooms" type="text" name="bedrooms"
                              class="form-control form-create-control col-10" disabled />
                          </div>
                          <div class="col-sm-2"><label>room(s)</label></div>
                          <div class="col-sm-2"><label>Bathrooms:</label></div>
                          <div class="col-sm-2">
                            <input id="form-bathrooms" type="text" name="bathrooms"
                              class="form-control form-create-control col-10" disabled />
                          </div>
                          <div class="col-sm-2"><label>room(s)</label></div>
                        </div>
                        <div class="row mb-3">
                          <div class="col-sm-2"><label>Year Built:</label></div>
                          <div class="col-sm-4">
                            <input id="form-builtYear" type="text" name="builtYear"
                              class="form-control form-create-control col-10" disabled />
                          </div>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <div class="col-sm-2"><label>Member Assigned:</label></div>
                        <div class="col-sm-6">
                          <select class="form-control form-create-control" onchange="chooseMember(this.value)">
                            <option class="fs-6" value="">Choose Member</option>
                            <c:forEach items="${memberList}" var="member">
                              <option class="fs-6" value="${member.memberId}">
                                ${member.fullName}
                              </option>
                            </c:forEach>
                          </select>
                        </div>

                        <div class="col-sm-4">
                          <input id="form-chosen-member" type="text" name="memberId"
                            class="form-control form-create-control col-10" hidden />
                        </div>
                      </div>
                      <!-- submit button -->
                      <div class="text-center container">
                        <div class="row">
                          <div class="col-sm-4"></div>
                          <div class="col-sm-4">
                            <button type="button" class="btn bg-gradient-dark w-100 my-4 mb-2"
                              onclick="confirmAssign(event)">
                              Submit Request
                            </button>
                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- END: FORM ASSIGN DEAL LISTING AVAILABLE -->

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

        <script>
          const urlAgencyRequest = "https://recs.site/api/agency-request/";
          var chosenData = null;

          /* View Popup detail of each property */
          function viewDetail(requestID) {
            var popup = document.querySelector("#popup-detail");
            var landSection = document.querySelector("#land-info-section");
            var houseSection = document.querySelector("#house-info-section");

            // Send GET Request API to retrieve single property information
            $.ajax({
              url: urlAgencyRequest + requestID,
              type: "GET",
              success: function (data) {
                // Update popup với information chosen Property
                $("#popup-name").text(data.realEstate.name);
                $("#popup-status").text(data.status.toLowerCase());

                $("#popup-desc").text(data.realEstate.description);
                $("#popup-type").text(data.realEstate.realEstateType);
                $("#popup-address").text(data.realEstate.address);
                $("#popup-area").text(data.realEstate.area + " m²");
                $("#popup-price").text(data.realEstate.textPrice + " $");

                //update chosen data for form filling
                chosenData = data;

                //only show land/house fields according to type
                if (data.realEstate.realEstateType.toLowerCase() == "land") {
                  landSection.classList.remove("hidden");
                  houseSection.classList.add("hidden");
                  $("#popup-land-type").text(data.realEstate.propertyLand.landType);
                  $("#popup-land-pw").text("download this file to view paperwork");
                  document
                    .querySelector("#popup-land-pw")
                    .setAttribute("href", data.realEstate.paperWorks);
                } else {
                  houseSection.classList.remove("hidden");
                  landSection.classList.add("hidden");
                  $("#popup-house-type").text(
                    data.realEstate.propertyHouse.houseType
                  );
                  $("#popup-house-pw").text("download this file to view paperwork");
                  document
                    .querySelector("#popup-house-pw")
                    .setAttribute("href", data.realEstate.paperWorks);
                  $("#popup-builtIn").text(data.realEstate.propertyHouse.builtIn);
                  $("#popup-bed").text(
                    data.realEstate.propertyHouse.bedroom + " rooms"
                  );
                  $("#popup-bath").text(
                    data.realEstate.propertyHouse.bath + " rooms"
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
              error: function (xhr, status, error) {
                const errorMessage = `Error: ${xhr.status} - ${xhr.statusText}`;
                console.error(errorMessage);
                alert(errorMessage);
              },
            });
          }

          //to show form confirming job assigning after confirmed on popup & form is already loaded
          function showFormAssignDeal() {
            var formAssignJob = document.getElementById(
              "form-assign-job-container"
            );

            //to LOAD INFORMATION to form confirming job assigning for a staff
            var landSection = formAssignJob.querySelector("#land-info");
            var houseSection = formAssignJob.querySelector("#house-info");

            // Update popup with information of chosen property
            document
              .querySelector("#form-name")
              .setAttribute("value", chosenData.realEstate.name);
            document
              .querySelector("#reqID")
              .setAttribute("value", chosenData.requestId);

            document.querySelector("#realEstateID").setAttribute("value", chosenData.realEstate.realEstateId);
            console.log("realEstateID" + chosenData.realEstate.realEstateId);
            document.querySelector("#form-description").value =
              chosenData.realEstate.description;
            document
              .querySelector("#form-propertyType")
              .setAttribute("value", chosenData.realEstate.realEstateType);
            document
              .querySelector("#form-address")
              .setAttribute("value", chosenData.realEstate.address);
            document
              .querySelector("#form-area")
              .setAttribute("value", chosenData.realEstate.area);
            document
              .querySelector("#form-price")
              .setAttribute("value", chosenData.realEstate.textPrice);

            if (chosenData.realEstate.realEstateType == "Land") {
              landSection.classList.remove("hidden");
              houseSection.classList.add("hidden");
              document
                .querySelector("#form-landCategory")
                .setAttribute("value", chosenData.realEstate.propertyLand.landType);
              document.querySelector("#form-land-pw").text =
                "download this file to view paperwork";
              document
                .querySelector("#form-land-pw")
                .setAttribute("href", chosenData.realEstate.paperWorks);
            } else {
              houseSection.classList.remove("hidden");
              landSection.classList.add("hidden");
              document
                .querySelector("#form-houseCategory")
                .setAttribute(
                  "value",
                  chosenData.realEstate.propertyHouse.houseType
                );

              document
                .querySelector("#form-builtYear")
                .setAttribute("value", chosenData.realEstate.propertyHouse.builtIn);
              document
                .querySelector("#form-bedrooms")
                .setAttribute("value", chosenData.realEstate.propertyHouse.bedroom);
              document
                .querySelector("#form-bathrooms")
                .setAttribute("value", chosenData.realEstate.propertyHouse.bath);
            }
            document.querySelector("#form-house-pw").text =
              "download this file to view paperwork";
            document
              .querySelector("#form-house-pw")
              .setAttribute("href", chosenData.realEstate.paperWorks);
            formAssignJob.classList.remove("hidden");
            closeDetail();
          }

          //still forcely close every popup if clicked on somewhere else than close button
          window.onclick = function (event) {
            var popup = document.querySelector(".popup-container");
            if (event.target == popup) {
              popup.classList.add("hidden");
            }
          };

          //to close detail validation request popup
          function closeDetail() {
            var popup = document.getElementById("popup-detail");
            popup.classList.add("hidden");
          }

          function chooseMember(selectedMember) {
            // Retrieve the "chosen-member" input element
            console.log("memberID: " + selectedMember);
            const chosenMemberInput = document.getElementById("form-chosen-member");

            // Update the value of the "chosen-member" input
            chosenMemberInput.setAttribute("value", selectedMember);
          }

          //successfully assign a property as a job for member to validate -> redirect back to this page (hide form)
          function confirmAssign(event) {
            // Prevent the default button click behavior
            event.preventDefault();

            var form = document.getElementById("form-chosen-member");

            //check if no member is chosen
            if (form.value == "") {
              Swal.fire("No member has been chosen.");
              return;
            }

            //show success message
            Swal.fire({
              title: "Success Assign!",
              text: "Deal assigned successfully!",
              icon: "success"
            });

            //execute default submit
            document.querySelector("form").submit();
          }

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
          function searchTable() {
            var searchDeal = document
              .getElementById("dealSearch")
              .value.toLowerCase();

            //Get all rows in table
            var requests = document.querySelectorAll(".listing-row");

            //Iterate through all rows and hide/show based on value
            requests.forEach(function (row) {
              var dealName = row
                .querySelector("#listing-name")
                .textContent.toLowerCase();
              var dealType = row
                .querySelector("#listing-type")
                .textContent.toLowerCase();
              if (dealName.includes(searchDeal) || dealType.includes(searchDeal)) {
                row.style.display = "";
              } else {
                row.style.display = "none";
              }
            });
          }
        </script>
        <!--   Core JS Files   -->
        <script src="/template/assets/js/core/bootstrap.min.js"></script>
        <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="../../template/assets/js/general-features.js"></script>
        <script type="text/javascript" src="../../template/assets/js/sweetalert2.js"></script>
      </body>

      </html>