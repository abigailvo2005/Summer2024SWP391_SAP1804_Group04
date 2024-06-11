<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="jakarta.tags.core" prefix="c" %> <%@
taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RECS - Assign Job</title>

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
    <!-- START: SIDEBAR -->
    <header>
      <jsp:include page="/views/manager/sidebar-man.jsp" />
    </header>
    <!-- END SIDEBAR -->

    <main
      class="no-dash main-content position-relative max-height-vh-100 h-100 border-radius-lg"
    >
      <!-- START: LIST VALIDATION REQUEST -->
      <div class="container-fluid">
        <div class="row my-4">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-8 col-9">
                    <h6>Properties Validation Required</h6>
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
                            class="text-center text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                          >
                            SELLER
                          </th>
                          <th
                            class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3"
                          >
                            PROPERTY NAME
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
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
                        <c:forEach items="${reqList}" var="req">
                          <tr class="req-row">
                            <td class="align-middle text-center text-sm">
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <p
                                    id="req-id"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${req.sellerInfo.username}
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
                                <p
                                  id="req-createDate"
                                  class="mb-0 text-sm fw-bold text-dark"
                                >
                                  ${req.createDate}
                                </p>
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
                                    onclick="viewDetail('${req.realEstateId}', '${staffList}')"
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

      <!-- START: FORM TO ASSIGN JOB TO A STAFF -->
      <div id="form-assign-job-container" class="container hidden">
        <div class="row">
          <div class="col-12 col-xl-11 mx-auto">
            <div class="card z-index-0">
              <div class="card-header text-center pt-4">
                <h5><b>Job Assigning Confirmation</b></h5>
              </div>
              <div class="card-body">
                <form
                  id="form-assign-job"
                  role="form text-left"
                  name="assign-job-form"
                  action="${pageContext.request.contextPath}/manager/assign-job"
                  method="post"
                >
                  <input id="reID" type="text" name="realEstateId" hidden />

                  <div class="mb-3 row">
                    <div class="col-sm-2"><label>Property Name:</label></div>
                    <div class="col-sm-4">
                      <input
                        id="form-name"
                        type="text"
                        name="name"
                        class="form-control form-create-control col-10"
                        disabled
                      />
                    </div>
                    <div class="col-sm-2"><label>Address:</label></div>
                    <div class="col-sm-4">
                      <input
                        id="form-address"
                        type="text"
                        name="address"
                        class="form-control form-create-control col-10"
                        disabled
                      />
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <div class="col-sm-2"><label>Description:</label></div>
                    <div class="col-sm-10">
                      <input
                        id="form-description"
                        name="description"
                        type="text"
                        class="form-control form-create-control"
                        rows="5"
                        disabled
                      />
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <div class="col-sm-2"><label>Property Type:</label></div>
                    <div class="col-sm-4">
                      <input
                        id="form-propertyType"
                        type="text"
                        name="propertyType"
                        class="form-control form-create-control col-10"
                        disabled
                      />
                    </div>
                    <div class="col-sm-2"><label>Price:</label></div>
                    <div class="col-sm-3">
                      <input
                        id="form-price"
                        type="text"
                        name="textprice"
                        class="form-control form-create-control col-10"
                        disabled
                      />
                    </div>
                    <div class="col-sm-1"><label>VND</label></div>
                  </div>
                  <div class="mb-3 row">
                    <div class="col-sm-2"><label>Area:</label></div>
                    <div class="col-sm-3">
                      <input
                        id="form-area"
                        type="number"
                        name="area"
                        class="form-control form-create-control col-10"
                        disabled
                      />
                    </div>
                    <div class="col-sm-1"><label>m²</label></div>
                  </div>
                  <div id="land-info" class="mb-3 row">
                    <div class="col-sm-2"><label>Land Type:</label></div>
                    <div class="col-sm-4">
                      <input
                        id="form-landCategory"
                        type="text"
                        name="landCategory"
                        class="form-control form-create-control col-10"
                        disabled
                      />
                    </div>
                    <div class="col-sm-2"><label>Land Paperwork:</label></div>
                    <div class="col-sm-4">
                      <input
                        id="form-land-pw"
                        type="file"
                        name="paperwork"
                        class="form-control form-create-control col-10"
                        disabled
                        hidden
                      />
                      <label
                        ><a
                          href="https://drive.google.com/drive/folders/1qXWhq9rQTjsq3ms_6NFoI_I63Dno7Acz?usp=drive_link"
                          target="_blank"
                          ><i>sample-paperwork-gg-drive-link</i></a
                        ></label
                      >
                    </div>
                  </div>
                  <div id="house-info">
                    <div class="mb-3 row">
                      <div class="col-sm-2"><label>House Type:</label></div>
                      <div class="col-sm-4">
                        <input 
                          id="form-houseCategory"
                          type="text"
                          name="houseCategory"
                          class="form-control form-create-control col-10"
                          disabled
                        />
                      </div>
                      <div class="col-sm-2">
                        <label>House Paperwork:</label>
                      </div>
                      <div class="col-sm-4">
                        <input
                          id="form-house-pw"
                          type="file"
                          name="paperwork"
                          class="form-control form-create-control col-10"
                          disabled
                          hidden
                        />
                        <label
                          ><a
                            href="https://drive.google.com/drive/folders/1qXWhq9rQTjsq3ms_6NFoI_I63Dno7Acz?usp=drive_link"
                            target="_blank"
                            ><i>sample-paperwork-gg-drive-link</i></a
                          ></label
                        >
                      </div>
                    </div>
                    <div class="mb-3 row">
                      <div class="col-sm-2"><label>Bedrooms:</label></div>
                      <div class="col-sm-2">
                        <input
                          id="form-bedrooms"
                          type="text"
                          name="bedrooms"
                          class="form-control form-create-control col-10"
                          disabled
                        />
                      </div>
                      <div class="col-sm-2"><label>room(s)</label></div>
                      <div class="col-sm-2"><label>Bathrooms:</label></div>
                      <div class="col-sm-2">
                        <input
                          id="form-bathrooms"
                          type="text"
                          name="bathrooms"
                          class="form-control form-create-control col-10"
                          disabled
                        />
                      </div>
                      <div class="col-sm-2"><label>room(s)</label></div>
                    </div>
                    <div class="row mb-3">
                      <div class="col-sm-2"><label>Year Built:</label></div>
                      <div class="col-sm-4">
                        <input
                          id="form-builtYear"
                          type="text"
                          name="builtYear"
                          class="form-control form-create-control col-10"
                          disabled
                        />
                      </div>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <div class="col-sm-2"><label>Staff Assigned:</label></div>
                    <div class="col-sm-4">
                      <input
                        id="form-chosen-staff"
                        type="text"
                        name="chosen-staff"
                        class="form-control form-create-control col-10"
                        disabled
                      />
                    </div>
                    <div class="col-sm-6">
                      <select
                      
                        class="form-control form-create-control"
                        onchange="chooseStaff(this.value)"
                      >
                        <option class="fs-6" value="">Choose Staff</option>
                        <c:forEach items="${staffList}" var="staff">
                          <option class="fs-6" value="${staff.username}">
                            ${staff.staffId} - ${staff.username}
                          </option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <!-- submit button -->
                  <div class="text-center container">
                    <div class="row">
                      <div class="col-sm-4"></div>
                      <div class="col-sm-4">
                        <button
                          type="button"
                          class="btn bg-gradient-dark w-100 my-4 mb-2"
                          onclick="confirmAssign(event)"
                        >
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
                          <strong class="text-dark">Owner:</strong>
                          <p id="owner"></p>
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
                        class="list-group-item border-0 ps-0 text-sm col-4 d-flex"
                      >
                        <strong class="text-dark">Land Type:</strong>
                        <p id="popup-land-type"></p>
                      </li>
                      <div class="validation-only col-8 px-0">
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
                    <!-- Buttons to decide if wanted to approve user or not -->
                    <div class="col-12 mt-1">
                      <div class="h-100 container-fluid mt-0">
                        <div class="row justify-content-center">
                          <div class="col-auto">
                            <button
                              title="Validate Successfully. Added as Listing"
                              type="button"
                              onclick="showFormAssignJob()"
                              class="btn btn-dark w-100 my-2 mb-2 btn-validation"
                            >
                              Assign To Staff
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

    <!-- JS MODIFY POPUP -->
    <script>
      //URL REAL ESTATE API
      const urlRealEstate = "http://localhost:8085/api/real-estate/";

      //to show detail register request popup
      function viewDetail(propID, staffList) {
        console.log("STAFFF LISSTTTT: " + staffList);
        var popup = document.getElementById("popup-detail");
        var landSection = popup.querySelector("#land-info");
        var houseSection = popup.querySelector("#house-info");

        // Send GET Request API to retrieve single property information
        $.ajax({
          url: urlRealEstate + propID,
          type: "GET",
          success: function (data) {
            // Update popup với information chosen Property
            $("#owner").text(data.sellerInfo.sellerId);
            $("#popup-name").text(data.name);
            $("#popup-status").text(data.status);
            $("#popup-desc").text(data.description);
            $("#popup-type").text(data.realEstateType);
            $("#popup-address").text(data.address);
            $("#popup-area").text(data.area + " m²");
            $("#popup-price").text(data.textPrice + " VND");

            //only show land/house fields according to type
            if (data.realEstateType == "land") {
              landSection.classList.remove("hidden");
              houseSection.classList.add("hidden");
              $("#popup-land-type").text(data.propertyLand.landType);
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
              $("#popup-house-type").text(data.propertyHouse.houseType);
              $("#popup-house-pw").text("sample-gg-drive-link-house");
              document
                .querySelector("#popup-house-pw")
                .setAttribute(
                  "href",
                  "https://drive.google.com/drive/folders/1qXWhq9rQTjsq3ms_6NFoI_I63Dno7Acz?usp=drive_link"
                );
              $("#popup-builtIn").text(data.propertyHouse.builtIn);
              $("#popup-bed").text(data.propertyHouse.bedroom + " rooms");
              $("#popup-bath").text(data.propertyHouse.bath + " rooms");
            }
            //also load form with same data
            loadFormAssignJob(data);
            popup.classList.remove("hidden");
          },
          error: function () {
            //Error when sending request
            console.error("Error fetching property details");
          },
        });
      }

      //to show form confirming job assigning after confirmed on popup & form is already loaded
      function showFormAssignJob() {
        document
          .getElementById("form-assign-job-container")
          .classList.remove("hidden");
        closeDetail();
      }

      //to LOAD INFORMATION to form confirming job assigning for a staff
      function loadFormAssignJob(data) {
        var formAssignJob = document.getElementById(
          "form-assign-job-container"
        );

        var landSection = formAssignJob.querySelector("#land-info");
        var houseSection = formAssignJob.querySelector("#house-info");

        // Update popup with information of chosen property
        document.querySelector("#form-name").setAttribute("value", data.name);
        document
          .querySelector("#form-description")
          .setAttribute("value", data.description);
        document
          .querySelector("#form-propertyType")
          .setAttribute("value", data.realEstateType);
        document
          .querySelector("#form-address")
          .setAttribute("value", data.address);
        document.querySelector("#form-area").setAttribute("value", data.area);
        document
          .querySelector("#form-price")
          .setAttribute("value", data.textPrice);

        if (data.realEstateType == "land") {
          landSection.classList.remove("hidden");
          houseSection.classList.add("hidden");
          document
            .querySelector("#form-landCategory")
            .setAttribute("value", data.propertyLand.landType);
          document
            .querySelector("#form-land-pw")
            .setAttribute("value", "sample-gg-drive-link-land");
          document
            .querySelector("#form-land-pw")
            .setAttribute(
              "href",
              "https://drive.google.com/drive/folders/1qXWhq9rQTjsq3ms_6NFoI_I63Dno7Acz?usp=drive_link"
            );
        } else {
          houseSection.classList.remove("hidden");
          landSection.classList.add("hidden");
          document
            .querySelector("#form-houseCategory")
            .setAttribute("value", data.propertyHouse.houseType);
          document
            .querySelector("#form-house-pw")
            .setAttribute("value", "sample-gg-drive-link-house");
          document
            .querySelector("#form-house-pw")
            .setAttribute(
              "href",
              "https://drive.google.com/drive/folders/1qXWhq9rQTjsq3ms_6NFoI_I63Dno7Acz?usp=drive_link"
            );
          document
            .querySelector("#form-builtYear")
            .setAttribute("value", data.propertyHouse.builtIn);
          document
            .querySelector("#form-bedrooms")
            .setAttribute("value", data.propertyHouse.bedroom);
          document
            .querySelector("#form-bathrooms")
            .setAttribute("value", data.propertyHouse.bath);
        }
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
      function searchTable() {
        var searchReq = document
          .getElementById("searchInput")
          .value.toLowerCase();

        //Get all rows in table
        var requests = document.querySelectorAll(".validate-row");

        //Iterate through all rows and hide/show based on value
        requests.forEach(function (row) {
          var propName = row
            .querySelector("#req-name")
            .textContent.toLowerCase();
          if (propName.includes(searchReq)) {
            row.style.display = "";
          } else {
            row.style.display = "none";
          }
        });
      }

      //successfully assign a property as a job for staff to validate -> redirect back to this page (hide form)
      function confirmAssign(event) {
        // Prevent the default button click behavior
        event.preventDefault();

        var form = document.getElementById("form-chosen-staff");

        //check if no staff is chosen
        if(form.value == "") {
          console.log("no value");
          alert("No staff has been chosen.");
          return;
        }

        //show success message
        alert("Job assigned successfully!");

        //execute default submit
        form.submit();
      }

      function chooseStaff(selectedStaffId) {
        // Retrieve the "chosen-staff" input element
        const chosenStaffInput = document.getElementById("form-chosen-staff");

        // Update the value of the "chosen-staff" input
        chosenStaffInput.setAttribute("value", selectedStaffId);
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

    <script></script>
  </body>
</html>
