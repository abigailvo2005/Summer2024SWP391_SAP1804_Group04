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

      <!--Alert Custom-->
      <link rel="stylesheet" type="text/css" href="/template/assets/css/sweetalert2.css" />
    
      <!--Alert Custom-->
      <link rel="stylesheet" type="text/css" href="/template/assets/css/sweetalert2.css"/> 
    </head>

    <body class="g-sidenav-show bg-gray-100" onload="makeTableScroll();">
      <!-- START INCLUDE SIDEBAR -->
      <header>
        <jsp:include page="/views/member/sidebar-member.jsp" />
      </header>
      <!-- END INCLUDE SIDEBAR -->

      <main class="main-content no-dash position-relative max-height-vh-100 h-100 border-radius-lg">
        <!-- START: LIST ASSIGNED DEAL -->
        <div class="container-fluid">
          <div class="row my-4">
            <div class="mb-md-0 mb-4">
              <div class="card">
                <div class="card-header pb-0">
                  <div class="row">
                    <div class="col-lg-8 col-9">
                      <h6>Your Assigned Deals</h6>
                      <p class="text-sm mb-0">
                        <i class="fa-solid fa-house-user"></i>
                        <span class="font-weight-bold ms-1">${dealList.size()} deals(s)</span>
                        being assigned in total
                      </p>
                    </div>
                    <div class="ms-md-auto pe-md-3 d-flex align-items-center col-lg-4 col-3">
                      <div class="input-group">
                        <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
                        <input id="dealSearch" type="text" class="form-control" placeholder="Type id/name/type here..."
                          onkeyup="searchTable('deal')" />
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
                          <c:forEach items="${dealList}" var="deal">
                            <tr class="deal-row">
                              <td>
                                <div class="d-flex justify-content-start">
                                  <div class="d-flex flex-column justify-content-start">
                                    <p id="deal-name" class="mb-0 text-sm fw-bold text-dark">
                                      ${deal.realEstate.name}
                                    </p>
                                  </div>
                                </div>
                              </td>
                              <td>
                                <div class="d-flex px-2 py-1 justify-content-center">
                                  <div class="d-flex flex-column justify-content-center">
                                    <p id="deal-price" class="mb-0 text-sm fw-bold text-dark">
                                      ${deal.realEstate.textPrice}
                                    </p>
                                  </div>
                                </div>
                              </td>
                              <td class="align-middle">
                                <div class="d-flex px-2 py-1 justify-content-center">
                                  <div class="d-flex flex-column justify-content-center">
                                    <p id="deal-type" class="mb-0 text-sm fw-bold text-dark">
                                      ${deal.realEstate.realEstateType}
                                    </p>
                                  </div>
                                </div>
                              </td>
                              <td class="align-middle">
                                <div class="d-flex px-2 py-1 justify-content-center">
                                  <div class="d-flex flex-column justify-content-center">
                                    <p id="deal-status" class="mb-0 text-sm fw-bold status-color"
                                      value="${deal.status}">
                                      ${deal.status}
                                    </p>
                                  </div>
                                </div>
                              </td>
                              <td class="align-middle">
                                <div class="d-flex px-2 py-1 justify-content-center">
                                  <div class="d-flex flex-column justify-content-center">
                                    <a class="show-detail" onclick="viewDetailProperty('${deal.dealId}')"><i
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
        <!-- END LIST ASSIGNED DEAL -->

        <!-- START: FORM REQUEST BUYER-->
        <div class="container hidden" id="form-create-buyer-request">
          <div class="row">
            <div class="col-12 col-xl-11 mx-auto">
              <div class="card z-index-0">
                <div class="card-header text-center pt-4">
                  <h5><b>Buyer Profile</b></h5>
                </div>

                <div class="card-body">
                  <form role="form text-left" name="submit-buyer-profile"
                    action="${pageContext.request.contextPath}/member/create-buyer" method="post">
                    <div class="mb-3 row">
                      <div class="col-sm-2">
                        <label for="fullname">Fullname:</label>
                      </div>
                      <div class="col-sm-4">
                        <input type="text" id="fullname" name="fullName" class="form-control form-create-control col-10"
                          placeholder="Enter full name" required />
                        <!-- ERROR MESSAGE BEING HIDDEN -->
                        <p class="text-danger text-error mb-0 text-center pt-1 error-name hidden">
                          name should only contains maximum 32 characters.
                        </p>
                      </div>

                      <div class="col-sm-2">
                        <label for="phone"> Phone:</label>
                      </div>
                      <div class="col-sm-4">
                        <input type="number" id="phone" name="phoneNumber"
                          class="form-control form-create-control col-10" placeholder="Enter phone number" min="1"
                          required />
                      </div>
                    </div>

                    <div class="mb-3 row">
                      <div class="col-sm-2">
                        <label for="birthday">Introduction Message:</label>
                      </div>
                      <div class="col-sm-10">
                        <textarea id="message" name="message" class="form-control form-create-control col-10"
                          required></textarea>
                      </div>
                    </div>

                    <!-- drop down chosen real estate to submit buyer to -->
                    <!-- <div class="row mb-3">
                    <div class="col-sm-2">
                      <label>Deal Submitted To:</label>
                    </div>

                    <div class="col-sm-6">
                      <select
                        class="form-control form-create-control"
                        onchange="chooseRealEstate(this.value)"
                      >
                        <option class="fs-6" value="">Choose Deal</option>
                        <c:forEach items="${dealList}" var="deal">
                          <option class="fs-6" value="${deal.dealId}">
                            ${deal.realEstate.name}
                          </option>
                        </c:forEach>
                      </select>
                    </div>
                    <div class="col-sm-4">
                      <input
                        id="form-chosen-deal"
                        type="hidden"
                        name="dealId"
                        class="form-control form-create-control col-10"
                      />
                      <input
                        id="form-chosen-realEstate-Id"
                        type="hidden"
                        name="realEstateId"
                        class="form-control form-create-control col-10"
                      />
                    </div>
                  </div> -->
                    <div class="row mb-3">
                      <div class="col-sm-2">
                        <label>Deal Submitted To: </label>
                      </div>
                      <div class="col-sm-4">
                        <input id="form-chosen-realEstate-Id" type="hidden" name="realEstateId"
                          class="form-control form-create-control col-10" />
                        <input id="form-chosen-deal" type="hidden" name="dealId"
                          class="form-control form-create-control col-10" />
                        <input id="member-id" type="hidden" name="memberId"
                          class="form-control form-create-control col-10" />
                        <input id="form-realEstate-name" type="text" name="realEstateName"
                          class="form-control form-create-control col-10" disabled />
                      </div>
                    </div>

                    <!-- submit button -->
                    <div class="text-center container">
                      <div class="row">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-4">
                          <button type="button" class="btn bg-gradient-dark w-100 my-4 mb-2" onclick="submitRegister()">
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
        <!-- END: FORM CREATE NEW MEMBER REQUEST -->

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

      <!-- START POPUP REQUESTS -->
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
                          <strong class="text-dark">Assigned by: </strong>
                          <p id="popup-agency"></p>
                        </li>
                      </div>

                      <!-- image carousel & description -->
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
                          <a class="landpw" id="popup-land-pw" target="_blank" download></a>
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
                      <div class="col-12 mt-1">
                        <div class="h-100 container-fluid mt-0">
                          <div class="row justify-content-center">
                            <div class="col-auto">
                              <button type="button" onclick="showFormCreateBuyer();"
                                class="btn btn-dark w-100 my-2 mb-2 btn-validation">
                                Submit New Buyer
                              </button>
                            </div>
                          </div>
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
                              <% for (int i=0; i < 5; i++) { %>
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
                          <button class="btn btn-secondary confirm-buyer" onclick="confirmBuyer(event)">
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

      <script type="text/javascript">
        //show form create buyer
        function showFormCreateBuyer(realEstateId) {
          var formCreateBuyer = document.getElementById(
            "form-create-buyer-request"
          );

          formCreateBuyer.classList.remove("hidden");
          closeDetail();
        }

        //load deal ID to submit to controller
        function chooseRealEstate(dealID) {
          // Retrieve the "chosen-deal" input element
          const chosenDealInput = document.getElementById("form-chosen-deal");

          // Update the value of the "chosen-deal" input
          chosenDealInput.setAttribute("value", dealID);
        }

        //submit register new staff request to admin
        function submitRegister() {
          event.preventDefault(); //Stop form from default submitting

          // Check if all fields have values
          if (document.querySelector("form").checkValidity()) {
            const fullname = $("#fullname");
            const phone = $("#phone");
            const message = $("#message");
            const nameError = document.querySelector(".error-name");

            if (fullname.val().length > 32) {
              //Check if buyer's name is longer than 32 characters
              nameError.classList.remove("hidden");
              return;
            } else {
              nameError.classList.add("hidden");
            }

            // Create a Promise to wait for all errors to be hidden
            const hideErrorsPromise = new Promise((resolve) => {
              // Wait 500ms to make sure all errors are hidden
              setTimeout(resolve, 500);
            });

            // Waiting Promise to hide all errors then alert to user
            hideErrorsPromise.then(() => {

              Swal.fire({
                title: "Success Submitted!",
                text: "Successfully submitted a new potential buyer!",
                icon: "success",
                confirmButtonText: "OK"
              }).then((result) => {
                if(result.isConfirmed) {
                  document.querySelector("form").submit();
                }
              });
             
            });
          } else {
            // If some fields are empty, show default errors
            document.querySelector("form").reportValidity();
          }
        }

        //display elements according to search value
        function searchTable(type) {
          //search for request register accounts
          if (type.includes("deal")) {
            //Get values from input search
            var searchInput = document
              .getElementById("dealSearch")
              .value.toLowerCase();

            // Get all rows in table
            var requests = document.querySelectorAll(".deal-row");

            requests.forEach(function (row) {
              var name = row
                .querySelector("#deal-name")
                .textContent.toLowerCase();
              var type = row
                .querySelector("#deal-type")
                .textContent.toLowerCase();
              if (name.includes(searchInput) || type.includes(searchInput)) {
                row.style.display = "";
              } else {
                row.style.display = "none";
              }
            });
          }
        }

        //URL DEAL API
        const urlDeal = "http://recs.site/api/deal/";

        /* View Popup detail of each property */
        function viewDetailProperty(dealId) {
          var popup = document.querySelector("#popup-property-request");
          var landSection = document.querySelector(".land-info-section");
          var houseSection = document.querySelector(".house-info-section");
          var buyerList = document.querySelector("#buyer-list");

          // Send GET Request API to retrieve single property information
          $.ajax({
            url: urlDeal + dealId,
            type: "GET",
            success: function (data) {
              // Update popup with information chosen Property
              $("#popup-name").text(data.realEstate.name);
              $("#popup-status").text(data.status);
              $("#popup-desc").text(data.realEstate.description);
              $("#popup-type").text(data.realEstate.realEstateType);
              $("#popup-address").text(data.realEstate.address);
              $("#popup-area").text(data.realEstate.area + " m²");
              $("#popup-price").text(data.realEstate.textPrice + " $");
              $("#popup-agency").text(data.agency.fullName);
              //load Ids for controller submission
              $("#form-chosen-realEstate-Id").val(data.realEstate.realEstateId);
              $("#form-realEstate-name").val(data.realEstate.name);
              $("#form-chosen-deal").val(data.dealId);
              $("#memberId").val(data.member.memberId);

              console.log($("#form-chosen-realEstate-Id").val());

              //only show land/house fields according to type
              if (data.realEstate.realEstateType == "Land") {
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

              //Reset images to be shown everytime popup is clicked
              (carouselInner.innerHTML = ""), (carouselIndicators.innerHTML = "");

              data.realEstate.propertyImagesList.forEach((image, index) => {
                //create slide
                const slideElement = document.createElement("div");
                slideElement.classList.add("carousel-item");
                if (index == 0) {
                  slideElement.classList.add("active");
                }
                const imgElement = document.createElement("img");
                imgElement.src = image;
                imgElement.classList.add("d-block", "w-100", "rounded");
                slideElement.appendChild(imgElement);
                carouselInner.appendChild(slideElement);

                //create indexes
                const indicatorElement = document.createElement("button");
                indicatorElement.type = "button";
                indicatorElement.dataset.bsTarget = "#image-section";
                indicatorElement.dataset.bsSlideTo = index;
                if (index == 0) {
                  indicatorElement.classList.add("acticve");
                  indicatorElement.setAttribute("aria-current", "true");
                }
                indicatorElement.setAttribute("aria-label", `Slide ${index + 1}`);
                carouselIndicators.appendChild(indicatorElement);
              });

              const carousel = new bootstrap.Carousel("#image-section");

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
      <script type="text/javascript" src="../../template/assets/js/sweetalert2.js"></script>
    </body>

    </html>