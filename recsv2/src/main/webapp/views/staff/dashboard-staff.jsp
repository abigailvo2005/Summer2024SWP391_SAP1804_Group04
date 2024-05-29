<%@ include file="/common/taglib.jsp" %> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ include
file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RECS - Dashboard</title>

    <!-- Link CSS -->
    <link
      id="pagestyle"
      href="<c:url value='/template/assets/css/soft-ui-dashboard.css?v=1.0.7' />"
      rel="stylesheet"
    />

    <!--Web's favicon-->
    <link
      rel="icon"
      type="image/png"
      href="<c:url value='/template/assets/img/logos/logo-no-name.png' />"
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
      <jsp:include page="/WEB-INF/views/staff/sidebar-staff.jsp" />
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
                        id="validationSearch"
                        type="text"
                        class="form-control"
                        placeholder="Type property name or manID here..."
                        onkeyup="searchTable('validation')"
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
                            class="text-center text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                          >
                            ReqID
                          </th>
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
                            ManID
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
                        <c:forEach items="${reqList}" var="req">
                          <tr class="validate-row">
                            <td class="align-middle text-center text-sm">
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <p class="mb-0 text-sm fw-bold text-dark">
                                    ${req.id}
                                  </p>
                                </div>
                              </div>
                            </td>
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
                                  <p class="mb-0 text-sm fw-bold text-dark">
                                    ${req.type}
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
                                    id="req-manID"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${req.manID}
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
                                    ${req.dateCreated}
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
                                  <script>
                                    var reqListJson =
                                      '<c:out value="${reqListJson}" />';
                                  </script>
                                  <a
                                    class="show-detail"
                                    onclick="viewDetail('${req.id}','validation')"
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
                            class="text-center text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                          >
                            ListingID
                          </th>
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
                            <td class="align-middle text-center text-sm">
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <p class="mb-0 text-sm fw-bold text-dark">
                                    ${listing.id}
                                  </p>
                                </div>
                              </div>
                            </td>
                            <td>
                              <div class="d-flex justify-content-start">
                                <div
                                  class="d-flex flex-column justify-content-start"
                                >
                                  <p
                                    id="listing-name"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${listing.name}
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
                                    ${listing.type}
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
                                    ${listing.price}
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
                                    ${listing.dateCreated}
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
                                  <!--  <script>
                                    var reqListJson =
                                      '<c:out value="${reqListJson}" />';
                                  </script> -->
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
    <div id="popup-detail" class="popup-container hidden z-index-3">
      <div class="popup-content container-fluid">
        <!-- Header -->
        <div class="popup-header row mx-1">
          <div class="col-11">
            <h4
              id="registered-name"
              class="card-header font-weight-bolder mb-0"
            >
              [Property Name]
            </h4>
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
                          class="list-group-item border-0 ps-0 text-sm"
                          id="assignedID"
                        >
                          <strong class="text-dark">Assigned by:</strong> &nbsp;
                          ManID
                        </li>
                      </div>
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6"
                        id="dateCreated"
                      >
                        <strong class="text-dark">Created on:</strong> &nbsp;
                        [Date Created]
                      </li>
                    </div>
                    <div class="row">
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6"
                        id="address"
                      >
                        <strong class="text-dark">Address:</strong> &nbsp;
                        [Address]
                      </li>
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6"
                        id="area"
                      >
                        <strong class="text-dark">Area:</strong> &nbsp; [Area]
                      </li>
                    </div>
                    <div class="row">
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6"
                        id="price"
                      >
                        <strong class="text-dark">Price:</strong> &nbsp; [Price]
                      </li>
                    </div>
                    <div class="row">
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-12"
                        id="description"
                      >
                        <strong class="text-dark">Description:</strong> &nbsp;
                        [Description]
                      </li>
                    </div>
                    <div class="row mb-2">
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6"
                        id="status"
                      >
                        <strong class="text-dark">Status:</strong> &nbsp;
                        [Status]
                      </li>
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6"
                        id="type"
                      >
                        <strong class="text-dark">Property Type:</strong> &nbsp;
                        House/land
                      </li>
                    </div>
                    <div class="row mb-2">
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-2"
                        id="images"
                      >
                        <strong class="text-dark">Images:</strong>
                      </li>
                      <li class="list-group-item border-0 ps-0 text-sm col-10">
                        <div
                          id="carouselExampleIndicators"
                          class="carousel slide"
                          data-bs-ride="carousel"
                        >
                          <div class="carousel-indicators">
                            <button
                              type="button"
                              data-bs-target="#carouselExampleIndicators"
                              data-bs-slide-to="0"
                              class="active"
                              aria-current="true"
                              aria-label="Slide 1"
                            ></button>
                            <button
                              type="button"
                              data-bs-target="#carouselExampleIndicators"
                              data-bs-slide-to="1"
                              aria-label="Slide 2"
                            ></button>
                            <button
                              type="button"
                              data-bs-target="#carouselExampleIndicators"
                              data-bs-slide-to="2"
                              aria-label="Slide 3"
                            ></button>
                          </div>
                          <div class="carousel-inner">
                            <div class="carousel-item active">
                              <img
                                src="../../assets/img/home-decor-1.jpg"
                                class="d-block w-100"
                                alt="Image 1"
                              />
                            </div>
                            <div class="carousel-item">
                              <img
                                src="../../assets/img/home-decor-2.jpg"
                                class="d-block w-100"
                                alt="Image 2"
                              />
                            </div>
                            <div class="carousel-item">
                              <img
                                src="../../assets/img/home-decor-3.jpg"
                                class="d-block w-100"
                                alt="Image 3"
                              />
                            </div>
                          </div>
                          <button
                            class="carousel-control-prev"
                            type="button"
                            data-bs-target="#carouselExampleIndicators"
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
                            data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="next"
                          >
                            <span
                              class="carousel-control-next-icon"
                              aria-hidden="true"
                            ></span>
                            <span class="visually-hidden">Next</span>
                          </button>
                        </div>
                      </li>
                    </div>
                    <div id="land-info" class="row hidden">
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-4"
                        id="landType"
                      >
                        <strong class="text-dark">Land Type:</strong> &nbsp;
                        [Land Type]
                      </li>
                      <div class="validation-only col-8 px-0">
                        <li
                          class="list-group-item border-0 ps-0 text-sm"
                          id="landPaperwork"
                        >
                          <strong class="text-dark">Land Paperwork:</strong>
                          &nbsp; [Zip of Land Paperwork to Download]
                        </li>
                      </div>
                    </div>
                    <div id="house-info" class="hidden">
                      <div class="row">
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-4"
                          id="houseType"
                        >
                          <strong class="text-dark">House Type:</strong> &nbsp;
                          [House Type]
                        </li>
                        <div class="validation-only col-8 px-0">
                          <li
                            class="list-group-item border-0 ps-0 text-sm"
                            id="housePaperwork"
                          >
                            <strong class="text-dark">House Paperwork:</strong>
                            &nbsp; [Zip of House Paperwork to Download]
                          </li>
                        </div>
                      </div>
                      <div class="row">
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-4"
                          id="bedrooms"
                        >
                          <strong class="text-dark">Bedrooms:</strong> &nbsp;
                          [Num Bedrooms]
                        </li>
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-4"
                          id="bathrooms"
                        >
                          <strong class="text-dark">Bathrooms:</strong> &nbsp;
                          [Num Bathrooms]
                        </li>
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-4"
                          id="yearBuilt"
                        >
                          <strong class="text-dark">Year Built:</strong> &nbsp;
                          [Year Built]
                        </li>
                      </div>
                    </div>
                    <div class="validation-only">
                      <!-- Buttons to decide if wanted to approve user or not -->
                      <div class="col-12 mt-1">
                        <div class="h-100 container-fluid mt-0">
                          <div class="row justify-content-center">
                            <div class="col-auto">
                              <button
                                title="Validate Successfully. Added as Listing"
                                type="button"
                                onclick="adminResponse()"
                                class="btn btn-success w-100 my-2 mb-2 btn-validation"
                              >
                                Approve
                              </button>
                            </div>

                            <div class="col-auto">
                              <button
                                title="Validate Fail."
                                type="button"
                                onclick="adminResponse()"
                                class="btn btn-danger w-100 my-2 mb-2 btn-validation"
                              >
                                Decline
                              </button>
                            </div>
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

    <!-- JS MODIFY POPUP -->
    <script>
      //to show detail register request popup
      function viewDetail(id, type) {
        var popup = document.getElementById("popup-detail");

        if (type.includes("list")) {
          popup
            .querySelectorAll(".validation-only")
            .forEach(function (element) {
              element.classList.add("hidden");
            });
        } else {
          popup
            .querySelectorAll(".validation-only")
            .forEach(function (element) {
              element.classList.remove("hidden");
            });
        }

        var propType = popup
          .querySelector("#type")
          .textContent.toLowerCase()
          .trim();

        if (propType.includes("land")) {
          popup.querySelector("#land-info").classList.remove("hidden");
        }

        if (propType.includes("house")) {
          popup.querySelector("#house-info").classList.remove("hidden");
        }

        // Translate reqList from a JSON String into an Array (reqList being passed in as a JSON String in JSP)
        //var reqList = JSON.stringify(reqListStr);

        //retrieve request from corresponding id received
        // Check if reqListStr is a valid JSON string
        /* try {
          var reqList = JSON.parse(reqListStr);

          var item = reqList.find(function (item) {
            return item.id === reqID;
          });

          if (item) {
            //load information on popup - sample data
            document.getElementById("username").innerText =
              "Username: &nbsp;" + item.id;
            document.getElementById("registered-name").innerText = item.name;
            document.getElementById("role").innerText =
              "Role: &nbsp;" + item.role;
            document.getElementById("dateCreated").innerText =
              "Created on: &nbsp;" + item.dateCreated;
            document.getElementById("status").innerText =
              "Status: &nbsp;" + item.status;
            document.getElementById("password").innerText = "Password: ";
            document.getElementById("email").innerText = "Email: ";
            document.getElementById("gender").innerText = "Gender: ";
            document.getElementById("birthday").innerText = "Birthday: ";
            document.getElementById("idNum").innerText = "ID Number: ";

            popup.classList.remove("hidden");
          } else {
            console.log("item does not exists");
          }
        } catch (e) {
          // If the JSON parse fails, try to use reqListStr as an array directly
          console.error("Error parsing reqListJson:", e);
        }
 */
        popup.classList.remove("hidden");
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
    <script src="<c:url value='/template/assets/js/core/popper.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/core/bootstrap.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/plugins/perfect-scrollbar.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/plugins/smooth-scrollbar.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/plugins/chartjs.min.js'/>"></script>
    <script src="<c:url value='/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7' />"></script>
  </body>
</html>
