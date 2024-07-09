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

    <!--Alert Custom-->
    <link
      rel="stylesheet"
      type="text/css"
      href="/template/assets/css/sweetalert2.css"
    />

    <!-- Firebase -->
    <script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-storage.js"></script>
  </head>

  <body class="g-sidenav-show bg-gray-100" onload="makeTableScroll()">
    <!-- START INCLUDE SIDEBAR -->
    <header>
      <jsp:include page="/views/seller/sidebar-seller.jsp" />
    </header>
    <!-- END INCLUDE SIDEBAR -->

    <main
      class="main-content no-dash position-relative max-height-vh-100 h-100 border-radius-lg"
    >
      <!-- START: LIST OWNED PROPERTIES (1) -->
      <div class="container-fluid">
        <div class="row my-4">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-8 col-9">
                    <h6>Submitted Properties</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-solid fa-house-user"></i>
                      <span class="font-weight-bold ms-1"
                        >${propList.size()} propertie(s)</span
                      >
                      submitted to system in total
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
                        id="ownSearch"
                        type="text"
                        class="form-control"
                        placeholder="Type name/type here..."
                        onkeyup="searchTable('own')"
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
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                          >
                            PRICE
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                          >
                            TYPE
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
                        <c:forEach items="${propList}" var="prop">
                          <tr class="prop-row">
                            <td>
                              <div class="d-flex justify-content-start">
                                <div
                                  class="d-flex flex-column justify-content-start"
                                >
                                  <p
                                    id="prop-name"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${prop.name}
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
                                    id="prop-price"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${prop.textPrice}
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
                                  <p
                                    id="prop-type"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${prop.realEstateType}
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
                                  <p
                                    id="prop-status"
                                    class="mb-0 text-sm fw-bold status-color"
                                    value="${prop.status.value}"
                                  >
                                    ${prop.status.value}
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
                                    onclick="viewDetailProperty('${prop.realEstateId}', 'prop')"
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
      <!-- END LIST OWNED PROPERTIES (1)-->

      <!-- START: LIST CREATED PROPERTIES (2)-->
      <div class="container-fluid">
        <div class="row my-4">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-8 col-9">
                    <h6>Draft Properties</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-solid fa-house-user"></i>
                      <span class="font-weight-bold ms-1"
                        >${draftList.size()} propertie(s)</span
                      >
                      have not been submitted in total
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
                        id="reqSearch"
                        type="text"
                        class="form-control"
                        placeholder="Type name/type here..."
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
                            class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3"
                          >
                            PROPERTY NAME
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                          >
                            PRICE
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                          >
                            TYPE
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
                        <c:forEach items="${draftList}" var="draft">
                          <tr class="draft-row">
                            <td>
                              <div class="d-flex justify-content-start">
                                <div
                                  class="d-flex flex-column justify-content-start"
                                >
                                  <p
                                    id="req-name"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${draft.name}
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
                                    id="req-price"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${draft.textPrice}
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
                                  <p
                                    id="req-type"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${draft.realEstateType}
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
                                  <p
                                    id="req-status"
                                    class="mb-0 text-sm fw-bold status-color"
                                    value="${draft.status.value}"
                                  >
                                    ${draft.status.value}
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
                                    onclick="viewDetailProperty('${draft.realEstateId}', 'draft')"
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
      <!-- END LIST VALIDATING REQUEST (2) -->

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
              onclick="closeDetail('popup-property-request')"
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
                      <li class="list-group-item border-0 ps-0 text-sm d-flex">
                        <strong class="text-dark">Status:</strong>
                        <p id="popup-status"></p>
                      </li>
                    </div>

                    <div class="row unqualified hidden">
                      <li class="list-group-item border-0 ps-0 text-sm d-flex">
                        <strong class="text-dark">Problems:</strong>
                        <p id="popup-note"></p>
                      </li>
                    </div>

                    <!-- image section & description for popup -->
                    <div class="row">
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-5 d-flex"
                      >
                        <strong class="text-dark">Description:</strong>
                        <p id="popup-desc"></p>
                      </li>
                      <div
                        id="image-section"
                        class="carousel slide mb-3 col-7 mt-2"
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
                      <li
                        class="list-group-item border-0 ps-0 text-sm col-6 d-flex"
                      >
                        <strong class="text-dark">Paperwork: </strong>
                        <a
                          class="landpw"
                          id="popup-land-pw"
                          target="_blank"
                          download
                        ></a>
                        <form
                          action="
                          ${pageContext.request.contextPath}/seller/dashboard"
                          method="post"
                          class="hidden change ms-2"
                          id="form-change-land-pw"
                        >
                          <input
                            name="realEstateID"
                            id="popup-id"
                            class="hidden"
                          />
                          <input
                            id="prop-pw-land"
                            type="file"
                            accept="application/pdf, application/zip"
                            class="form-control form-create-control"
                            required
                          />
                          <button
                            id="submit-land-btn"
                            class="btn btn-padding mt-2"
                            type="button"
                          >
                            Change
                          </button>
                          <button
                            class="btn btn-padding ms-2 mt-2"
                            onclick="hideChangePW('land')"
                          >
                            Cancel
                          </button>
                          <input
                            class="hidden"
                            id="land-pw-container"
                            name="url"
                            type="text"
                          />
                        </form>
                        <a class="hidden pen" onclick="changePW('land')">
                          <i class="fa-solid fa-pencil"></i>
                        </a>
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
                          <strong class="text-dark">Paperwork: </strong>
                          <a
                            class="housepw"
                            id="popup-house-pw"
                            target="_blank"
                            download
                          ></a>
                          <form
                            action="
                          ${pageContext.request.contextPath}/seller/dashboard"
                            method="post"
                            class="hidden change ms-2"
                            id="form-change-house-pw"
                          >
                            <input
                              name="realEstateID"
                              id="popup-id"
                              class="hidden"
                            />
                            <input
                              id="prop-pw-house"
                              type="file"
                              accept="application/pdf, application/zip"
                              class="form-control form-create-control"
                              required
                            />
                            <button
                              id="submit-house-btn"
                              class="btn btn-padding mt-2"
                              type="button"
                            >
                              Change
                            </button>
                            <button
                              class="btn btn-padding ms-2 mt-2"
                              onclick="hideChangePW('house')"
                            >
                              Cancel
                            </button>
                            <input
                              class="hidden"
                              id="house-pw-container"
                              name="url"
                              type="text"
                            />
                          </form>
                          <a class="hidden pen" onclick="changePW('house')">
                            <i class="fa-solid fa-pencil"></i>
                          </a>
                        </li>
                      </div>

                      <div class="row">
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-4 d-flex"
                        >
                          <strong class="text-dark">Built in: </strong>
                          <p id="popup-builtIn"></p>
                        </li>
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-4 d-flex"
                        >
                          <strong class="text-dark">Bedrooms: </strong>
                          <p id="popup-bed"></p>
                        </li>
                        <li
                          class="list-group-item border-0 ps-0 text-sm col-4 d-flex"
                        >
                          <strong class="text-dark">Bathrooms: </strong>
                          <p id="popup-bath"></p>
                        </li>
                      </div>
                    </div>

                    <!-- Buttons allows user submit/delete draft properties -->
                    <div
                      id="draft-section"
                      class="row d-flex justify-content-center hidden"
                    >
                      <form
                        class="col-4"
                        action="${pageContext.request.contextPath}/seller/real-estate/request"
                        id="request-validation"
                        method="get"
                      >
                        <input
                          type="hidden"
                          id="request-reId"
                          name="realEstateId"
                        />
                        <button
                          id="request-validate-btn"
                          class="btn btn-dark me-3 col-12"
                          onclick="draftLoadId(event, this.value, '#request-reId', '#request-validation')"
                        >
                          Request Validation
                        </button>
                      </form>

                      <form
                        class="col-4"
                        action="${pageContext.request.contextPath}/seller/real-estate/delete"
                        id="request-delete"
                      >
                        <input
                          type="hidden"
                          id="delete-reId"
                          name="realEstateId"
                        />
                        <button
                          id="delete-real-estate-btn"
                          class="btn btn-danger col-12"
                          onclick="draftLoadId(event, this.value, '#delete-reId', '#request-delete')"
                        >
                          Delete
                        </button>
                      </form>
                    </div>

                    <!-- Button allows user hide/show list of agencies -->
                    <div
                      id="show-agency-permission"
                      class="d-flex justify-content-center hidden"
                    >
                      <button class="show-btn" onclick="showAgencies()">
                        Show Agency List
                      </button>
                    </div>

                    <!-- Table shows list of Agency wants to handle this property -->
                    <div id="agency-list" class="row hidden">
                      <div class="title-table mb-2 px-0">
                        <strong>Pending Agency Profiles</strong>
                      </div>
                      <table class="table table-responsive">
                        <thead>
                          <tr>
                            <th class="text-center">Select</th>
                            <th class="text-center">Name</th>
                            <th class="text-center">Phone</th>
                            <th class="text-center">Email</th>
                            <th class="text-center">Company</th>
                            <th class="text-center">Years of Experience</th>
                            <th class="text-center">Completed Projects</th>
                            <th class="text-center description">Description</th>
                            <th class="text-center">Message</th>
                          </tr>
                        </thead>
                        <tbody id="agency-container"></tbody>
                      </table>
                      <div class="row">
                        <form
                          id="agency-form"
                          action=" ${pageContext.request.contextPath}/seller/agency-request/approve"
                          method="post"
                        >
                          <input
                            id="realEstateId"
                            name="realEstateId"
                            type="hidden"
                          />
                          <div
                            id="selected-agency-container"
                            class="hidden"
                          ></div>
                          <div class="d-flex justify-content-end">
                            <button
                              type="submit"
                              class="btn btn-secondary confirm-agency"
                              onclick="confirmAgency(event)"
                            >
                              Confirm
                            </button>
                          </div>
                        </form>
                      </div>
                    </div>

                    <!-- Table shows list of Agency that is accepted to handle this listing -->
                    <div id="accepted-agency-list" class="row hidden">
                      <div class="title-table mb-2 px-0">
                        <strong>Accepted Agencies</strong>
                      </div>
                      <table class="table table-responsive">
                        <thead>
                          <tr>
                            <th class="text-center">Name</th>
                            <th class="text-center">Phone</th>
                            <th class="text-center">Email</th>
                            <th class="text-center">Company</th>
                            <th class="text-center">Years of Experience</th>
                            <th class="text-center">Completed Projects</th>
                            <th class="text-center description">Description</th>
                          </tr>
                        </thead>
                        <tbody id="chosen-agency-container"></tbody>
                      </table>
                    </div>

                    <!-- Table shows list of Buyer wants to handle this property -->
                    <div
                      id="show-buyer-permission"
                      class="d-flex justify-content-center hidden"
                    >
                      <button class="show-btn" onclick="showBuyers()">
                        Show Buyer List
                      </button>
                    </div>

                    <div id="buyer-list" class="row hidden">
                      <div class="title-table mb-2 px-0">
                        <strong>Pending Buyer Profiles</strong>
                      </div>
                      <table class="table table-responsive">
                        <thead>
                          <tr>
                            <th class="text-center">Select</th>
                            <th class="text-center">Buyer Name</th>
                            <th class="text-center">Phone Number</th>
                            <th class="text-center">From Agency</th>
                            <th class="text-center">Agency Company</th>
                            <th class="text-center message">Message</th>
                          </tr>
                        </thead>
                        <tbody id="buyer-container"></tbody>
                      </table>
                      <div class="row">
                        <form
                          id="buyer-form"
                          action=" ${pageContext.request.contextPath}/seller/buyer-request/approve"
                          method="post"
                        >
                          <div
                            id="selected-buyer-container"
                            class="hidden"
                          ></div>
                          <div class="d-flex justify-content-end">
                            <button
                              type="submit"
                              class="btn btn-secondary confirm-buyer"
                              onclick="confirmBuyer(event)"
                            >
                              Confirm
                            </button>
                          </div>
                        </form>
                      </div>
                    </div>

                    <!-- Table shows list of Buyer that is accepted to be connected -->
                    <div id="accepted-buyer-list" class="row hidden">
                      <div class="title-table mb-2 px-0">
                        <strong>Connected Buyers</strong>
                      </div>
                      <table class="table table-responsive">
                        <thead>
                          <tr>
                            <th class="text-center">Name</th>
                            <th class="text-center">Phone</th>
                            <th class="text-center">From Agency</th>
                            <th class="text-center">Agency Company</th>
                            <th class="text-center">Message</th>
                          </tr>
                        </thead>
                        <tbody id="accepted-buyer-container"></tbody>
                      </table>
                    </div>

                    <div id="confirm-sold-buyer" class="row hidden">
                      <!-- section for confirm connected successfully buyer ${pageContext.request.contextPath}-->
                      <form
                        id="form-confirm-sold"
                        action="${pageContext.request.contextPath}/seller/buyer-request/connect"
                        method="post"
                      >
                        <li
                          class="row list-group-item border-0 ps-0 text-sm d-flex"
                        >
                          <strong class="text-dark col-5"
                            >Choose successfully connected Buyer:</strong
                          >
                          <div class="col-5">
                            <select
                              class="form-control form-create-control"
                              id="chosen-buyer-container"
                              onchange="chooseSoldBuyer(this.value)"
                            >
                              <option class="fs-6" value="">
                                Choose Buyer
                              </option>
                            </select>
                          </div>

                          <input
                            id="chosen-buyer"
                            type="hidden"
                            name="requestId"
                          />

                          <div class="col-2">
                            <button
                              type="button"
                              class="btn bg-gradient-dark w-100"
                              onclick="confirmSold(event)"
                            >
                              Submit
                            </button>
                          </div>
                        </li>
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
    <!--End POPUP-->

    <!-- START POPUP - MESSAGE -->
    <div id="popup-message" class="popup-container hidden z-index-3">
      <div id="popup-message-content" class="popup-content container">
        <!-- Header -->
        <div class="popup-header row mx-1">
          <div class="col-11">
            <h4
              id="small-popup-header"
              class="card-header font-weight-bolder mb-0"
            ></h4>
          </div>
          <div class="col-1">
            <i
              class="fa-solid fa-xmark close-button"
              onclick="closeDetail('popup-message')"
            ></i>
          </div>
        </div>

        <!-- Message content -->
        <div class="row">
          <div class="col-12 mt-sm-1">
            <div class="card h-100">
              <div class="card-body p-3">
                <p id="request-detail"></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END POPUP - MESSAGE -->

    <!--   Core JS Files   -->
    <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../../template/assets/js/general-features.js"></script>
    <script
      type="module"
      src="../../template/assets/js/img-handler.js"
    ></script>
    <!-- Sweet Alert 2 -->
    <script
      type="text/javascript"
      src="../../template/assets/js/sweetalert2.js"
    ></script>

    <!-- Internal JS -->
    <script>
      //URL REAL ESTATE API
      const urlRealEstate = "http://localhost:8085/api/real-estate/";
      var chosenRequest = null;
      var propStatus = null;
      const chosenAgencyStatusHide = [
        "created",
        "reviewing",
        "validating",
        "unqualified",
        "agency_approving",
        "closed",
      ];
      const requestingAgencyStatusHide = [
        "created",
        "reviewing",
        "validating",
        "unqualified",
        "closed",
      ];
      const chosenBuyerStatusHide = [
        "created",
        "reviewing",
        "validating",
        "unqualified",
        "agency_approving",
        "handled",
        "marketed",
        "buyer_approving",
        "closed",
      ];
      const requestBuyerStatusHide = [
        "created",
        "reviewing",
        "validating",
        "unqualified",
        "agency_approving",
        "handled",
        "marketed",
        "closed",
      ];
      const confirmedBuyerStatusHide = [
        "created",
        "reviewing",
        "validating",
        "unqualified",
        "agency_approving",
        "handled",
        "marketed",
        "buyer_approving",
        "connected",
        "closed",
      ];

      //Load Real Estate ID
      function draftLoadId(e, id, input, form) {
        e.preventDefault();

        //load id
        $(input).val(id);

        //deleting prop
        if (input == "#delete-reId") {
          Swal.fire({
            title: "Delete this property?",
            text: "You won't be able to revert this action!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, delete it!",
          }).then((result) => {
            if (result.isConfirmed) {
              // User confirmed, submit the form
              $(form).submit();
            }
          });
        } else {
          Swal.fire({
            title: "Submit this property?",
            text: "You won't be able to revert this action!",
            icon: "info",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, submit it!",
          }).then((result) => {
            if (result.isConfirmed) {
              // User confirmed, submit the form
              $(form).submit();
            }
          });
        }
      }

      // Submit chosen Agency Profile to system
      function confirmAgency(e) {
        e.preventDefault();

        //get container
        var agencyContainer = $("#selected-agency-container");

        //clear list of Agencies everytime reload
        agencyContainer.html("");

        // Get all checkboxes values in table
        const checkboxes = document.querySelectorAll(".agency-checkbox");

        if (checkboxes) {
          checkboxes.forEach((checkbox) => {
            if (checkbox.checked) {
              // Only get buyer request ID that is checked
              const requestId = checkbox.getAttribute("data-request-id");
              //create input type hidden to submit to controller
              const item = document.createElement("input");
              item.type = "text";
              item.value = requestId;
              item.name = "agencyRequestIds";

              //append to container
              agencyContainer.append(item);
            }
          });

          document.querySelector("#agency-form").submit();
        } else {
          alert("You must choose at least 1 agency to submit to system.");
        }
      }

      // Submit chosen Buyer Profile to system
      function confirmBuyer(e) {
        e.preventDefault();

        //get container
        var buyerContainer = $("#selected-buyer-container");

        //clear list of Agencies everytime reload
        buyerContainer.html("");

        // Get all checkboxes values in table
        const checkboxes = document.querySelectorAll(".buyer-checkbox");

        if (checkboxes) {
          checkboxes.forEach((checkbox) => {
            if (checkbox.checked) {
              // Only get requestId that is checked
              const requestId = checkbox.getAttribute("data-request-id");
              //create input type hidden to submit to controller
              const item = document.createElement("input");
              item.type = "text";
              item.value = requestId;
              item.name = "requestIds";

              //append to container
              buyerContainer.append(item);
            }
          });

          document.querySelector("#buyer-form").submit();
        } else {
          alert(
            "You must choose at least 1 buyer profile to submit to system."
          );
        }
      }

      //confirm last step - successfully sold property - close property
      function chooseSoldBuyer(selectedBuyer) {
        // Retrieve the "chosen-buyer" input element
        const chosenBuyerInput = document.getElementById("chosen-buyer");
        console.log("selected buyer id: " + selectedBuyer);

        // Update the value of the "chosen-buyer" input
        chosenBuyerInput.setAttribute("value", selectedBuyer);
      }

      //to let user update paperwork if validation fail
      function changePW(type) {
        //show update form
        $(".change").removeClass("hidden");

        //hide old pw
        if (type.toLowerCase() == "land") {
          $(".landpw").addClass("hidden");
        } else {
          $(".housepw").addClass("hidden");
        }

        //hide pen
        $(".pen").addClass("hidden");
      }

      //to let user cancel updating paperwork
      function hideChangePW(type) {
        //hide update form
        $(".change").addClass("hidden");

        //show old pw
        if (type.toLowerCase() == "land") {
          $(".landpw").removeClass("hidden");
        } else {
          $(".housepw").removeClass("hidden");
        }

        //show pen
        $(".pen").removeClass("hidden");
      }

      /* View Popup detail of each property */
      function viewDetailProperty(propID, type) {
        var popup = document.querySelector("#popup-property-request");
        var landSection = document.querySelector(".land-info-section");
        var houseSection = document.querySelector(".house-info-section");
        var agencyBtn = document.querySelector("#show-agency-permission");
        agencyBtn.classList.add("hidden"); //default
        var buyerBtn = document.querySelector("#show-buyer-permission");
        buyerBtn.classList.add("hidden"); //default
        var unqualified = document.querySelector(".unqualified");
        var pen = document.querySelector(".pen");

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

            console.log(data.status.toLowerCase());

            //assign property status for future reference
            propStatus = data.status.toLowerCase();

            //update chosen realEstateID for changing pw + choosing agency/buyer
            document
              .querySelector("#popup-id")
              .setAttribute("value", data.realEstateId);
            document
              .querySelector("#realEstateId")
              .setAttribute("value", data.realEstateId);

            //show notes when property unqualified
            if (data.status.toLowerCase() == "unqualified") {
              unqualified.classList.remove("hidden");
              pen.classList.remove("hidden");
              $("#popup-note").text(data.notes);
            } else {
              unqualified.classList.add("hidden");
              pen.classList.add("hidden");
            }

            //only show land/house fields according to type
            if (data.realEstateType == "Land") {
              landSection.classList.remove("hidden");
              houseSection.classList.add("hidden");
              $("#popup-land-type").text(data.propertyLand.landType);
              $("#popup-land-pw").text("download this file to view paperwork");
              document
                .querySelector("#popup-land-pw")
                .setAttribute("href", data.paperWorks);
            } else {
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

            //only show options of submitting properties/delete property if it's a draft property
            if (type == "draft") {
              $("#draft-section").removeClass("hidden");

              $("#request-validate-btn").val(data.realEstateId);
              $("#delete-real-estate-btn").val(data.realEstateId);
            }

            //only show list of Agency/Buyer Profiles if it's list of owned Properties
            if (
              !requestingAgencyStatusHide.includes(data.status.toLowerCase())
            ) {
              console.log("in request agency");
              agencyBtn.classList.remove("hidden");
            }

            if (!requestBuyerStatusHide.includes(data.status.toLowerCase())) {
              console.log("in request buyer");
              buyerBtn.classList.remove("hidden");
            }

            if (
              requestingAgencyStatusHide.includes(data.status.toLowerCase()) &&
              requestBuyerStatusHide.includes(data.status.toLowerCase())
            ) {
              //hide all as default
              console.log("hide all");
              agencyBtn.classList.add("hidden");
              buyerBtn.classList.add("hidden");
            }

            //load list of agencies for seller if any agency requested handle listing
            $("#agency-container").empty(); //clear data of previous property

            const agencyContainer = $("#agency-container");
            data.agencyRequests.forEach((request) => {
              if (request.status == "Reviewing") {
                //create rows with checkboxes - for controller submission - and information to view
                const row = $("<tr>");

                //information of agencies to submit back to controller
                const checkbox = $("<input>")
                  .attr("type", "checkbox")
                  .attr("data-request-id", request.requestId)
                  .attr("data-agency-id", request.requestId)
                  .attr("data-real-estate-id", request.realEstateId)
                  .addClass("agency-checkbox");

                row.append($("<td>").append(checkbox));
                row.append($("<td>").text(request.agency.fullName));
                row.append($("<td>").text(request.agency.phone));
                row.append($("<td>").text(request.agency.email));
                row.append($("<td>").text(request.agency.company));
                row.append($("<td>").text(request.agency.yearsOfExperience));
                row.append($("<td>").text(request.agency.completedProject));

                //part to view description from agency seperately
                const viewDescriptionBtn = $("<td>")
                  .append(
                    $("<button>")
                      .addClass("btn btn-sm view-message-btn")
                      .text("View")
                      .attr("data-description", request.agency.description)
                  )
                  .addClass("text-center");

                viewDescriptionBtn.on("click", function () {
                  showMessage(request, "desc");
                });
                row.append(viewDescriptionBtn);

                //part to view introduction message from agency seperately
                const viewMessageBtn = $("<td>")
                  .append(
                    $("<button>")
                      .addClass("btn btn-sm view-message-btn")
                      .text("View")
                      .attr("data-message", request.message)
                  )
                  .addClass("text-center");

                viewMessageBtn.on("click", function () {
                  showMessage(request, "message");
                });
                row.append(viewMessageBtn);

                agencyContainer.append(row);
              }
            });

            //load list of chosen agencies for this property
            $("#chosen-agency-container").empty(); //clear data of previous property

            const chosenAgencyContainer = $("#chosen-agency-container");
            data.agencyRequests.forEach((request) => {
              if (
                request.status == "Accepted" ||
                request.status == "Processing"
              ) {
                //only show chosen agencies
                //create rows with checkboxes - for controller submission - and information to view
                const row = $("<tr>");

                //information of agencies to submit back to controller
                row.append($("<td>").text(request.agency.fullName));
                row.append($("<td>").text(request.agency.phone));
                row.append($("<td>").text(request.agency.email));
                row.append($("<td>").text(request.agency.company));
                row.append($("<td>").text(request.agency.yearsOfExperience));
                row.append($("<td>").text(request.agency.completedProject));

                //part to view description from agency seperately
                const viewDescriptionBtn = $("<td>")
                  .append(
                    $("<button>")
                      .addClass("btn btn-sm view-message-btn")
                      .text("View")
                      .attr("data-description", request.agency.description)
                  )
                  .addClass("text-center");

                viewDescriptionBtn.on("click", function () {
                  showMessage(request, "desc");
                });
                row.append(viewDescriptionBtn);

                chosenAgencyContainer.append(row);
              }
            });

            //load list of connected buyers for this property
            $("#accepted-buyer-container").empty(); //clear data of previous property

            const acceptedBuyerContainer = $("#accepted-buyer-container");
            data.buyerRequests.forEach((request) => {
              if (request.status.toLowerCase() == "accepted") {
                console.log("There are 1 buyer!" + request.fullName);
                //create rows with checkboxes - for controller submission - and information to view
                const row = $("<tr>");

                //information of accepted buyers
                row.append($("<td>").text(request.fullName));
                row.append($("<td>").text(request.phone));
                row.append($("<td>").text(request.member.agency.fullName));
                row.append($("<td>").text(request.member.agency.company));

                //part to view introduction message of buyer seperately
                const viewMessageBtn = $("<td>")
                  .append(
                    $("<button>")
                      .addClass("btn btn-sm view-message-btn")
                      .text("View")
                      .attr("data-message", request.message)
                  )
                  .addClass("text-center");

                viewMessageBtn.on("click", function () {
                  showMessage(request, "message");
                });
                row.append(viewMessageBtn);

                acceptedBuyerContainer.append(row);
              }
            });

            //load list of connected buyers for this property
            $("#buyer-container").empty(); //clear data of previous property

            const buyerContainer = $("#buyer-container");
            data.buyerRequests.forEach((request) => {
              if (request.status.toLowerCase() == "reviewing") {
                console.log("There are 1 buyer!" + request.fullName);
                //create rows with checkboxes - for controller submission - and information to view
                const row = $("<tr>");

                //information of buyers to submit back to controller
                const checkbox = $("<input>")
                  .attr("type", "checkbox")
                  .attr("data-request-id", request.requestId)
                  .addClass("buyer-checkbox");

                row.append($("<td>").append(checkbox));
                row.append($("<td>").text(request.fullName));
                row.append($("<td>").text(request.phone));
                row.append($("<td>").text(request.member.agency.fullName));
                row.append($("<td>").text(request.member.agency.company));

                //part to view introduction message of buyer seperately
                const viewMessageBtn = $("<td>")
                  .append(
                    $("<button>")
                      .addClass("btn btn-sm view-message-btn")
                      .text("View")
                      .attr("data-message", request.message)
                  )
                  .addClass("text-center");

                viewMessageBtn.on("click", function () {
                  showMessage(request, "message");
                });
                row.append(viewMessageBtn);

                buyerContainer.append(row);
              }
            });

            //load list of accepted buyer for confirm close
            $("#chosen-buyer-container").empty(); //clear data of previous property

            const chosenBuyerContainer = $("#chosen-buyer-container");
            //default option
            const option = document.createElement("option");
            option.value = "";
            option.textContent = "--choose a buyer--";
            option.classList.add("fs-6");
            chosenBuyerContainer.append(option);

            data.buyerRequests.forEach((request) => {
              if (request.status.toLowerCase() == "accepted") {
                console.log(
                  "There are 1 accepted to dropdown buyer!" + request.fullName
                );
                //create rows with checkboxes - for controller submission - and information to view
                const option = document.createElement("option");
                option.value = request.requestId;
                option.textContent = request.fullName;
                option.classList.add("fs-6");
                chosenBuyerContainer.append(option);
              }
            });

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

      //Show agency request message or agency description everytime button is clicked
      function showMessage(request, type) {
        //first clear popup
        $("#request-detail").text("");
        var target = null;

        if (type == "message") {
          target = request.message;
          $("#small-popup-header").text("Message");
        } else {
          target = request.agency.description;
          $("#small-popup-header").text("Agency Description");
        }

        //load message to popup
        if (!target) {
          $("#request-detail").text("No messages being sent.");
        } else {
          $("#request-detail").html(target.replace(/\r\n/g, "<br>"));
        }
        $("#popup-message").removeClass("hidden");
      }

      var isAgencyDisplayed = false;
      //only show list of agencies when seller click show
      function showAgencies() {
        if (!isAgencyDisplayed) {
          $("#agency-list").removeClass("hidden");

          //only show list of chosen agencies if listing is handled
          if (!chosenAgencyStatusHide.includes(propStatus)) {
            $("#accepted-agency-list").removeClass("hidden");
          }

          $("#show-agency-permission button").text("Hide Agency List");
          isAgencyDisplayed = true;
        } else {
          hideAgencies();
        }
      }

      //seperate function to hide agency list
      function hideAgencies() {
        $("#agency-list").addClass("hidden");
        $("#accepted-agency-list").addClass("hidden");
        $("#show-agency-permission button").text("Show Agency List");
        isAgencyDisplayed = false;
      }

      //only show list of buyers when seller click show
      var isBuyersDisplayed = false;
      function showBuyers() {
        if (!isBuyersDisplayed) {
          document.querySelector("#buyer-list").classList.remove("hidden");

          //only show list of chosen buyers + option to confirm connected buyer if listing is connected
          if (!chosenBuyerStatusHide.includes(propStatus)) {
            $("#accepted-buyer-list").removeClass("hidden");
            $("#confirm-sold-buyer").removeClass("hidden");
          }

          $("#show-buyer-permission button").text("Hide Buyer List");
          isBuyersDisplayed = true;
        } else {
          hideBuyers();
        }
      }

      //seperate function to hide buyer list
      function hideBuyers() {
        $("#buyer-list").addClass("hidden");
        $("#accepted-buyer-list").addClass("hidden");
        $("#confirm-sold-buyer").addClass("hidden");
        $("#show-buyer-permission button").text("Show Buyer List");
        isBuyersDisplayed = false;
      }

      //to close popup
      function closeDetail(id) {
        document.getElementById(id).classList.add("hidden");
      }

      //still forcely close every popup if clicked on somewhere else than close button
      window.onclick = function (event) {
        //close popup
        var popup = document.querySelector(".popup-container");

        if (event.target == popup) {
          popup.classList.add("hidden");
          //close all lists
          hideAgencies();
          hideBuyers();
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

      //successfully submit confirmed sold buyer to system
      function confirmSold(event) {
        // Prevent the default button click behavior
        event.preventDefault();

        var form = document.getElementById("form-confirm-sold");

        //check if no staff is chosen
        if (form.value == "") {
          alert("No buyer has been chosen.");
          return;
        }

        //show success message
        alert(
          "Congratulations! You have successfully sold this property. The property will be automatically hidden from the system."
        );

        //execute default submit
        form.submit();
      }

      window.onload = function () {
        makeTableScroll();
      };

      //display elements according to search value
      function searchTable(type) {
        //search for request register accounts
        if (type.includes("own")) {
          //Get values from input search
          var searchInput = document
            .getElementById("ownSearch")
            .value.toLowerCase();

          // Get all rows in table
          var requests = document.querySelectorAll(".prop-row");

          requests.forEach(function (row) {
            var name = row
              .querySelector("#prop-name")
              .textContent.toLowerCase();
            var type = row
              .querySelector("#prop-type")
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
            .getElementById("reqSearch")
            .value.toLowerCase();

          // Get all rows in table
          var requests = document.querySelectorAll(".draft-row");

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
