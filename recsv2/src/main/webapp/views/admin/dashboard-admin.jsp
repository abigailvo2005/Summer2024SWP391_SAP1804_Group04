<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="jakarta.tags.core" prefix="c" %>

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
  </head>

  <body class="g-sidenav-show bg-gray-100" onload="makeTableScroll();">
    <!-- START INCLUDE SIDEBAR -->
    <header>
      <jsp:include page="/views/admin/sidebar-admin.jsp" />
    </header>
    <!-- END INCLUDE SIDEBAR -->

    <!-- START DASHBOARD MAIN CONTENT -->
    <main
      class="main-content no-dash position-relative max-height-vh-100 h-100 border-radius-lg"
    >
      <!-- START: LIST ALL USERS IN SYSTEM -->
      <div class="container-fluid">
        <div class="row my-4">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-8 col-9">
                    <h6>All Users</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-solid fa-house-user"></i>
                      <span class="font-weight-bold ms-1"
                        >${allAccounts.size()} user(s)</span
                      >
                      in system
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
                        id="userSearch"
                        type="text"
                        class="form-control"
                        placeholder="Type username or full name here..."
                        onkeyup="searchTable('user')"
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
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                          >
                            ID
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3"
                          >
                            Name
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                          >
                            Role
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2"
                          >
                            Gender
                          </th>
                          <th
                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1"
                          >
                            View Details
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${allAccounts}" var="user">
                          <tr class="user-row">
                            <td class="align-middle text-center text-sm">
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <p
                                    id="user-uname"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${user.accountId}
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
                                    id="user-fname"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${user.fullName}
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
                                    id="user-role"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${user.roleId}
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
                                    ${user.gender == 0 ? 'Male' : 'Female'}
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
                                    onclick="viewDetail('${user.accountId}')"
                                    class="show-detail"
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
      <!-- END LIST ALL USERS IN SYSTEM-->

      <!-- START: LIST ALL PROPERTY IN SYSTEM-->
      <div class="container-fluid">
        <div class="row my-4">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-8 col-9">
                    <h6>All Properties</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-solid fa-house-user"></i>
                      <span class="font-weight-bold ms-1"
                        >${listRealEstate.size()} propertie(s)</span
                      >
                      in system
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
                        placeholder="Type name/type here..."
                        onkeyup="searchTable('prop')"
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
                        <c:forEach items="${listRealEstate}" var="prop">
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
                                    onclick="viewDetailProperty('${prop.realEstateId}')"
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
      <!-- ENDLIST ALL PROPERTY IN SYSTEM -->

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
    <!-- END DASHBOARD MAIN CONTENT -->

    <!--------------------START: POPUP SECTIONS-------------------- -->
    <div id="popup-user" class="popup-container hidden z-index-3">
      <div class="popup-content container-fluid">
        <!-- Header -->
        <div class="popup-header row mx-1">
          <div class="col-11">
            <h4
              id="popup-full-name"
              class="card-header font-weight-bolder mb-0"
            ></h4>
          </div>
          <div class="col-1">
            <i
              class="fa-solid fa-xmark close-button"
              onclick="closeDetailRegisterRequest()"
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
                      <li
                        class="d-flex list-group-item border-0 ps-0 text-sm col-4"
                      >
                        <strong class="text-dark">Account ID: </strong>
                        <p id="popup-id"></p>
                      </li>
                      <li
                        class="d-flex list-group-item border-0 ps-0 text-sm col-4"
                      >
                        <strong class="text-dark">Username:</strong>
                        <p id="popup-username"></p>
                      </li>
                    </div>

                    <div class="row">
                      <li
                        class="d-flex list-group-item border-0 ps-0 text-sm col-4"
                      >
                        <strong class="text-dark">Role:</strong>
                        <p id="popup-role"></p>
                      </li>
                      <li
                        class="d-flex list-group-item border-0 ps-0 text-sm col-4"
                      >
                        <strong class="text-dark">Email:</strong>
                        <p id="popup-email"></p>
                        <a class="text-warning" href="javascript:;" id="changeEmail">Change</a>
                      </li>

                      <!-- Background Overlay -->
                      <div id="overlay" class="overlay"></div>

                      <!-- Modal for Updating Email -->
                    <div id="emailModal" class="profileUpdate">
                      <div class="update-content">
                        <span class="close-update" id="closeEmail"
                          >&times;</span
                        >
                        <h5>Update Email</h5>
                        <form
                          action="${pageContext.request.contextPath}/admin/email/update"
                          method="post"
                          id="emailForm"
                        >
                          <input type="hidden" class="accountIDUpdate" name="accountId"/>
                          <h6 for="email">New Email:</h6>
                          <input
                            type="text"
                            id="email"
                            name="email"
                            class="form-control"
                            placeholder="Enter new email"
                            required
                          />
                          <div id="emailError" class="error-message"></div>
                          <button
                            type="submit"
                            id="updateEmail"
                            class="btn btn-dark my-2 mb-2"
                          >
                            Update
                          </button>
                          <button
                            type="button"
                            class="btn btn-danger my-2 mb-2"
                            id="cancelEmail"
                          >
                            Cancel
                          </button>
                        </form>
                      </div>
                    </div>

                      <li
                        class="d-flex list-group-item border-0 ps-0 text-sm col-4"
                      >
                        <strong class="text-dark">ID Number:</strong>
                        <p id="popup-id-number"></p>
                        <a class="text-warning" href="javascript:;" id="changeidNumber">Change</a>
                      </li>

                      <!-- Modal for Updating ID Card Number -->
                    <div id="idNumberModal" class="profileUpdate">
                      <div class="update-content">
                        <span class="close-update" id="closeidNumber"
                          >&times;</span
                        >
                        <h5>Update ID Card Number</h5>
                        <form
                          action="${pageContext.request.contextPath}/admin/idcard/update"
                          method="post"
                          id="idNumberForm"
                        >
                        <input type="hidden" class="accountIDUpdate" name="accountId"/>
                          <h6 for="idNumber">New ID card number:</h6>
                          <input
                            type="number"
                            id="idCardNo"
                            name="idCard"
                            class="form-control"
                            placeholder="Enter new ID card number"
                            min="1"
                            required
                          />
                          <button
                            type="submit"
                            id="updateidNumber"
                            class="btn btn-dark my-2 mb-2"
                          >
                            Update
                          </button>
                          <button
                            type="button"
                            class="btn btn-danger my-2 mb-2"
                            id="cancelidNumber"
                          >
                            Cancel
                          </button>
                        </form>
                      </div>
                    </div>      
                    </div>

                    <div class="row">
                      <li
                        class="d-flex list-group-item border-0 ps-0 text-sm col-4"
                      >
                        <strong class="text-dark">Gender:</strong>
                        <p id="popup-gender"></p>
                        <a class="text-warning" href="javascript:;" id="changeGender">Change</a>
                      </li>

                      <!-- Modal for Updating Gender -->
                    <div id="genderModal" class="profileUpdate">
                      <div class="update-content">
                        <span class="close-update" id="closeGender"
                          >&times;</span
                        >
                        <h5>Update Gender</h5>
                        <form
                          action="${pageContext.request.contextPath}/admin/gender/update"
                          method="post"
                          id="genderForm"
                        >
                        <input type="hidden" class="accountIDUpdate" name="accountId"/>
                          <h6 for="gender">New Gender:</h6>
                          <select
                          class="form-control"
                          id="gender"
                          name="gender"
                          required
                        >
                          <option value="" selected>
                            Select biological gender
                          </option>
                          <option value="0">Male</option>
                          <option value="1">Female</option>
                        </select>
                          <button
                            type="submit"
                            id="updateGender"
                            class="btn btn-dark my-2 mb-2"
                          >
                            Update
                          </button>
                          <button
                            type="button"
                            class="btn btn-danger my-2 mb-2"
                            id="cancelGender"
                          >
                            Cancel
                          </button>
                        </form>
                      </div>
                    </div>

                      <li
                        class="d-flex list-group-item border-0 ps-0 text-sm col-4"
                      >
                        <strong class="text-dark">Address:</strong>
                        <p id="popup-address"></p>
                        <a class="text-warning" href="javascript:;" id="changeAddress">Change</a>
                      </li>

                      <!-- Modal for Updating Address -->
                    <div id="addressModal" class="profileUpdate">
                      <div class="update-content">
                        <span class="close-update" id="closeAddress"
                          >&times;</span
                        >
                        <h5>Update Address</h5>
                        <form
                          action="${pageContext.request.contextPath}/admin/address/update"
                          method="post"
                          id="addressForm"
                        >
                        <input type="hidden" class="accountIDUpdate" name="accountId"/>
                          <h6 for="address">New Address:</h6>
                          <input
                            type="text"
                            id="address"
                            name="address"
                            class="form-control"
                            placeholder="Enter new address"
                            required
                          />
                          <button
                            type="submit"
                            id="updateAddress"
                            class="btn btn-dark my-2 mb-2"
                          >
                            Update
                          </button>
                          <button
                            type="button"
                            class="btn btn-danger my-2 mb-2"
                            id="cancelAddress"
                          >
                            Cancel
                          </button>
                        </form>
                      </div>
                    </div>
       

                      <li
                        class="d-flex list-group-item border-0 ps-0 text-sm col-4"
                      >
                        <strong class="text-dark">Birth Date:</strong>
                        <p id="popup-birthdate"></p>
                        <a class="text-warning" href="javascript:;" id="changeBirthday">Change</a>
                      </li>

                      <div id="birthdayModal" class="profileUpdate">
                        <div class="update-content">
                          <span class="close-update" id="closeBirthday"
                            >&times;</span
                          >
                          <h5>Update Birthday</h5>
                          <form
                            action="${pageContext.request.contextPath}/admin/birthday/update"
                            method="post"
                            id="birthdayForm"
                          >
                          <input type="hidden" class="accountIDUpdate" name="accountId"/>
                            <h6 for="birthday">New Birthday:</h6>
                            <input
                              type="date"
                              id="birthday"
                              name="birthDate"
                              class="form-control form-create-control col-10"
                              required
                              onchange="validateDateOfBirth(this.value)"
                            />
                            <div id="birthdayError" class="error-message"></div>
                            <button
                              type="submit"
                              id="updateBirthday"
                              class="btn btn-dark my-2 mb-2"
                            >
                              Update
                            </button>
                            <button
                              type="button"
                              class="btn btn-danger my-2 mb-2"
                              id="cancelBirthday"
                            >
                              Cancel
                            </button>
                          </form>
                        </div>
                      </div>

                    </div>

                    <div id="seller-section" class="row hidden">
                      <li
                        class="d-flex list-group-item border-0 ps-0 text-sm col-4"
                      >
                        <strong class="text-dark">Company:</strong>
                        <p id="popup-company-seller"></p>
                        <a class="text-warning" href="javascript:;" id="changeCompany">Change</a>
                      </li>

                      <div id="companyModal" class="profileUpdate">
                        <div class="update-content">
                          <span class="close-update" id="closeCompany"
                            >&times;</span
                          >
                          <h5>Update Company</h5>
                          <form
                            action="${pageContext.request.contextPath}/admin/company/update"
                            method="post"
                            id="companyForm"
                          >
                          <input type="hidden" class="accountIDUpdate" name="accountId"/>
                            <h6 for="company">New Name Company:</h6>
                            <input
                              type="text"
                              id="company"
                              name="companySeller"
                              class="form-control"
                              placeholder="Enter new name company"
                              required
                            />
                            <button
                              type="submit"
                              id="updateCompany"
                              class="btn btn-dark my-2 mb-2"
                            >
                              Update
                            </button>
                            <button
                              type="button"
                              class="btn btn-danger my-2 mb-2"
                              id="cancelCompany"
                            >
                              Cancel
                            </button>
                          </form>
                        </div>
                      </div>
                    </div>

                    <div id="manager-section" class="row hidden">
                      <li
                        class="d-flex list-group-item border-0 ps-0 text-sm col-4"
                      >
                        <strong class="text-dark">Years Of Experience:</strong>
                        <p id="popup-year-experience-man"></p>
                        <a class="text-warning" href="javascript:;" id="changeYOE">Change</a>
                      </li>

                      <!-- Modal for Updating Phone -->
                    <div id="YOEModal" class="profileUpdate">
                      <div class="update-content">
                        <span class="close-update" id="closeYOE"
                          >&times;</span
                        >
                        <h5>Update Year Of Experience</h5>
                        <form
                          action="${pageContext.request.contextPath}/admin/yearofexperience/update"
                          method="post"
                          id="YOEForm"
                        >
                        <input type="hidden" class="accountIDUpdate" name="accountId"/>
                          <h6 for="YOE">New Year Of Experience</h6>
                          <input
                            type="number"
                            id="YOE"
                            name="yearsOfExperienceMan"
                            class="form-control"
                            placeholder="Enter new year of experience"
                            min="1"
                            required
                          />
                          <button
                            type="submit"
                            id="updateYOE"
                            class="btn btn-dark my-2 mb-2"
                          >
                            Update
                          </button>
                          <button
                            type="button"
                            class="btn btn-danger my-2 mb-2"
                            id="cancelYOE"
                          >
                            Cancel
                          </button>
                        </form>
                      </div>
                    </div>

                    </div>

                    <div id="staff-section" class="row hidden">
                      <li
                        class="d-flex list-group-item border-0 ps-0 text-sm col-4"
                      >

                        <strong class="text-dark">Superior Manager: </strong>
                        <p id="popup-superior-staff"></p>
                      </li>
                      <li
                        class="d-flex list-group-item border-0 ps-0 text-sm col-4"
                      >
                        <strong class="text-dark"
                          >Currently Handling Validation:
                        </strong>
                        <p id="popup-num-of-projects"></p>
                        <a class="text-warning" href="javascript:;" id="changeNOP">Change</a>
                      </li>

                      <!-- Modal for Updating Phone -->
                    <div id="NOPModal" class="profileUpdate">
                      <div class="update-content">
                        <span class="close-update" id="closeNOP"
                          >&times;</span
                        >
                        
                        <h5>Update Current Project Number</h5>
                        <form
                          action="${pageContext.request.contextPath}/admin/numberofproject/update"
                          method="post"
                          id="NOPForm"
                        >
                        <input type="hidden" class="accountIDUpdate" name="accountId"/>
                          <h6 for="NOP">New Current Project Number</h6>
                          <input
                            type="number"
                            id="NOP"
                            name="numOfProjects"
                            class="form-control"
                            placeholder="Enter new number of project"
                            min="1"
                            required
                          />
                          <div id="NOPError" class="error-message"></div>
                          <button
                            type="submit"
                            id="updateNOP"
                            class="btn btn-dark my-2 mb-2"
                          >
                            Update
                          </button>
                          <button
                            type="button"
                            class="btn btn-danger my-2 mb-2"
                            id="cancelNOP"
                          >
                            Cancel
                          </button>
                        </form>
                      </div>
                    </div>

                    </div>

                    <div id="agency-section" class="row hidden">
                      <div class="row">
                        <li
                          class="d-flex list-group-item border-0 ps-0 text-sm col-4"
                        >
                          <strong class="text-dark">Company: </strong>
                          <p id="popup-company-agency"></p>
                          <a class="text-warning" href="javascript:;" id="changeCompanyAgency">Change</a>
                        </li>
                        
                        <div id="companyAgencyModal" class="profileUpdate">
                          <div class="update-content">
                            <span class="close-update" id="closeCompanyAgency"
                              >&times;</span
                            >
                            <h5>Update Company</h5>
                            <form
                              action="${pageContext.request.contextPath}/admin/companyAgency/update"
                              method="post"
                              id="companyAgencyForm"
                            >
                            <input type="hidden" class="accountIDUpdate" name="accountId"/>
                              <h6 for="companyAgency">New Name Company:</h6>
                              <input
                                type="text"
                                id="companyAgency"
                                name="company"
                                class="form-control"
                                placeholder="Enter new name company"
                                required
                              />
                              <button
                                type="submit"
                                id="updateCompanyAgency"
                                class="btn btn-dark my-2 mb-2"
                              >
                                Update
                              </button>
                              <button
                                type="button"
                                class="btn btn-danger my-2 mb-2"
                                id="cancelCompanyAgency"
                              >
                                Cancel
                              </button>
                            </form>
                          </div>
                        </div>
                      </div>
  

                        <li
                          class="d-flex list-group-item border-0 ps-0 text-sm col-4"
                        >
                          <strong class="text-dark"
                            >Years Of Experience:</strong
                          >
                          <p id="popup-year-experience-agency"></p>
                          <a class="text-warning" href="javascript:;" id="changeYOEAgency">Change</a>
                        </li>

                         <!-- Modal for Updating YOEAgency -->
                    <div id="YOEAgencyModal" class="profileUpdate">
                      <div class="update-content">
                        <span class="close-update" id="closeYOEAgency"
                          >&times;</span
                        >
                        <h5>Update Year Of Experience</h5>
                        <form
                          action="${pageContext.request.contextPath}/admin/yoeagency/update"
                          method="post"
                          id="YOEAgencyForm"
                        >
                        <input type="hidden" class="accountIDUpdate" name="accountId"/>
                          <h6 for="YOEAgency">New Year Of Experience</h6>
                          <input
                            type="number"
                            id="YOEAgency"
                            name="yearsOfExperience"
                            class="form-control"
                            placeholder="Enter new year of experience"
                            min="1"
                            required
                          />
                          <button
                            type="submit"
                            id="updateYOEAgency"
                            class="btn btn-dark my-2 mb-2"
                          >
                            Update
                          </button>
                          <button
                            type="button"
                            class="btn btn-danger my-2 mb-2"
                            id="cancelYOEAgency"
                          >
                            Cancel
                          </button>
                        </form>
                      </div>
                    </div>


                        <li
                          class="d-flex list-group-item border-0 ps-0 text-sm col-4"
                        >
                          <strong class="text-dark"
                            >Completed Projects:
                          </strong>
                          <p id="popup-completed-projects"></p>
                          <a class="text-warning" href="javascript:;" id="changeCompleteProject">Change</a>
                        </li>
                         <!-- Modal for Updating YOEAgency -->
                    <div id="completeProjectModal" class="profileUpdate">
                      <div class="update-content">
                        <span class="close-update" id="closeCompleteProject"
                          >&times;</span
                        >
                        <h5>Update Number Of Project Completed</h5>
                        <form
                          action="${pageContext.request.contextPath}/admin/completeprojectagency/update"
                          method="post"
                          id="completeProjectForm"
                        >
                        <input type="hidden" class="accountIDUpdate" name="accountId"/>
                          <h6 for="completeProject">New Number Of Project Completed</h6>
                          <input
                            type="number"
                            id="completeProject"
                            name="completedProject"
                            class="form-control"
                            placeholder="Enter new number of project completed"
                            min="1"
                            required
                          />
                          <button
                            type="submit"
                            id="updateCompleteProject"
                            class="btn btn-dark my-2 mb-2"
                          >
                            Update
                          </button>
                          <button
                            type="button"
                            class="btn btn-danger my-2 mb-2"
                            id="cancelCompleteProject"
                          >
                            Cancel
                          </button>
                        </form>
                      </div>
                    </div>

                      <div class="row">
                        <li
                          class="d-flex list-group-item border-0 ps-0 text-sm col-12"
                        >
                          <strong class="text-dark">Description:</strong>
                          <p id="popup-description"></p>
                          <a class="text-warning" href="javascript:;" id="changeDesc">Change</a>
                        </li>

                        <div id="descModal" class="profileUpdate">
                          <div class="update-content">
                            <span class="close-update" id="closeDesc"
                              >&times;</span
                            >
                            <h5>Update Description</h5>
                            <form
                              action="${pageContext.request.contextPath}/admin/description/update"
                              method="post"
                              id="descForm"
                            >
                            <input type="hidden" class="accountIDUpdate" name="accountId"/>
                              <h6 for="desc">New Description:</h6>
                              <input
                                type="text"
                                id="desc"
                                name="description"
                                class="form-control"
                                placeholder="Enter new description"
                                required
                              />
                              <button
                                type="submit"
                                id="updateDesc"
                                class="btn btn-dark my-2 mb-2"
                              >
                                Update
                              </button>
                              <button
                                type="button"
                                class="btn btn-danger my-2 mb-2"
                                id="cancelDesc"
                              >
                                Cancel
                              </button>
                            </form>
                          </div>
                        </div>

                      </div>
                    </div>

                    <!-- Buttons allows user delete an account -->
                    <div class="mt-2 row d-flex justify-content-center">
                      <form
                        class="col-4"
                        action="${pageContext.request.contextPath}/admin/account/delete"
                        method="post"
                        id="delete-account"
                      >
                        <input
                          type="hidden"
                          id="delete-accountId"
                          name="accountId"
                        />
                        <button
                          id="delete-account-btn"
                          class="btn btn-danger col-12"
                          onclick="loadId(event, this.value, '#delete-accountId', '#delete-account')"
                        >
                          Delete
                        </button>
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
    <!-- ---------------- END POPUP SECTION --------------------- -->

    <!-- START POPUP PROPERTY -->
    <div
      id="popup-property-request"
      class="popup-container prop hidden z-index-3"
    >
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
                        <p id="popup-status-property"></p>
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
                  </div>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--END POPUP PROPERTY-->

    <!--   Core JS Files   -->
    <script src="/template/assets/js/core/bootstrap.min.js"></script>
    <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../../template/assets/js/general-features.js"></script>
    <!-- Sweet Alert 2 -->
    <script
      type="text/javascript"
      src="../../template/assets/js/sweetalert2.js"
    ></script>
    <!-- end: core js files -->

    <script type="text/javascript">
      const urlRealEstate = "http://localhost:8085/api/real-estate/";

      function viewDetailProperty(propID) {
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
            $("#popup-status-property").text(data.status.toLowerCase());

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
            popup.classList.remove("hidden");
          },
          error: function (xhr, status, error) {
            const errorMessage = `Error: ${xhr.status} - ${xhr.statusText}`;
            console.error(errorMessage);
            alert(errorMessage);
          },
        });
      }

      //Load Account ID
      function loadId(e, id, input, form) {
        e.preventDefault();

        //load id
        $(input).val(id);

        //deleting account
        Swal.fire({
          title: "Delete this account?",
          text: "You won't be able to revert this action!",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Yes, delete it!",
        }).then((result) => {
          if (result.isConfirmed) {
            Swal.fire({
              icon: "success",
              title: "Account Deleted!",
              text: "This account has been successfully deleted.",
            });
            // User confirmed, submit the form
            $(form).submit();
          }
        });
      }

      //to close popup
      function closeDetail(id) {
        document.getElementById(id).classList.add("hidden");
      }

      function viewDetail(userID) {
        var popup = document.getElementById("popup-user");
        var company = document.querySelector(".company");
        var accountIDInput = document.querySelectorAll(".accountIDUpdate");

        // Send GET Request API to retrieve single user information
        $.ajax({
          url: "http://localhost:8085/api/user/" + userID,
          type: "GET",
          success: function (data) {
            // Update popup với information chosen User
            $("#popup-id").text(data.accountId);
            $("#popup-username").text(data.username);
            $("#popup-role").text(data.roleId);
            $("#popup-full-name").text(data.fullName);
            $("#popup-gender").text(data.gender);
            $("#popup-email").text(data.email);
            $("#popup-phone").text(data.phone);
            $("#popup-address").text(data.address);
            $("#popup-id-number").text(data.idCard);
            $("#popup-birthdate").text(
              new Date(data.birthDate).toLocaleDateString()
            );

            //load accountId for deleting account
            $("#delete-account-btn").val(data.accountId);

            //if user is seller
            if (data.roleId === "ROLE_SELLER") {
              $("#seller-section").removeClass("hidden");
              $("#popup-company-seller").text(data.company);
            } else {
              $("#seller-section").addClass("hidden");
            }

            //if user is manager
            if (data.roleId === "ROLE_MANAGER") {
              $("#manager-section").removeClass("hidden");
              $("#popup-year-experience-man").text(data.yearsOfExperience);
            } else {
              $("#manager-section").addClass("hidden");
            }

            //if user is staff
            if (data.roleId === "ROLE_STAFF") {
              $("#staff-section").removeClass("hidden");
              console.log(data.superiorId);
              $("#popup-superior-staff").text(data.superiorId);
              $("#popup-num-of-projects").text(data.numOfProjects);
            } else {
              $("#staff-section").addClass("hidden");
            }

            //if user is agency
            if (data.roleId === "ROLE_AGENCY") {
              console.log("In agency");
              $("#agency-section").removeClass("hidden");
              $("#popup-company-agency").text(data.company);
              $("#popup-year-experience-agency").text(
                data.agencyYearsOfExperience
              );
              $("#popup-completed-projects").text(data.completedProject);
              $("#popup-description").text(data.agencyDescription);
            } else {
              $("#agency-section").addClass("hidden");
            }

            accountIDInput.forEach(function() {
              $(".accountIDUpdate").val(data.accountId);
            })

           

            popup.classList.remove("hidden");
          },
          error: function () {
            //Error when sending request
            console.error("Error fetching register request details");
          },
        });
      }

      function closeDetailRegisterRequest() {
        var popup = document.getElementById("popup-user");
        popup.classList.add("hidden");
      }

      //still forcely close every popup if clicked on somewhere else than close button
      window.onclick = function (event) {
        var popup = document.querySelector(".popup-container");
        var popupProp = document.querySelector(".prop");
        if (event.target == popup) {
          popup.classList.add("hidden");
        } else if (event.target == popupProp) {
          popupProp.classList.add("hidden");
        }
      };

      //style table to have fixed heading and scrollable
      function makeTableScroll() {
        // Constant retrieved from server-side via JSP
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

      //display elements according to search value
      function searchTable(type) {
        //search for request register accounts
        if (type.includes("user")) {
          //Get values from input search
          var searchUser = document
            .getElementById("userSearch")
            .value.toLowerCase();

          // Get all rows in table
          var user = document.querySelectorAll(".user-row");

          user.forEach(function (row) {
            var username = row
              .querySelector("#user-uname")
              .textContent.toLowerCase();
            var name = row
              .querySelector("#user-fname")
              .textContent.toLowerCase();
            var role = row
              .querySelector("#user-role")
              .textContent.toLowerCase();
            if (
              username.includes(searchUser) ||
              name.includes(searchUser) ||
              role.includes(searchUser)
            ) {
              row.style.display = "";
            } else {
              row.style.display = "none";
            }
          });
        } else {
          //Get values from input search
          var searchInput = document
            .getElementById("propSearch")
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
        }
      }

      var overlay = document.getElementById("overlay");

      function openModal(modal) {
        modal.style.display = "block";
        overlay.style.display = "block";
      }

      function closeModal(modal) {
        modal.style.display = "none";
        overlay.style.display = "none";
        clearInputs(modal);
      }

      // Function to clear input fields within a modal
      function clearInputs(modal) {
        var gender = document.getElementById("gender");
        var errorMessage = document.getElementById("emailError");
        var errorMessageBirthday = document.getElementById("birthdayError");
        errorMessage.textContent = "";
        errorMessageBirthday.textContent = "";
        gender.value = gender.options[0].value;

        var emailInput = document.getElementById("email");
        emailInput.value = "";
        var idNumberInput = document.getElementById("idCardNo");
        idNumberInput.value = "";
        var genderInput = document.getElementById("gender");
        genderInput.value = "";
        var addressInput = document.getElementById("address");
        addressInput.value = "";
        var birthDayInput = document.getElementById("birthday");
        birthDayInput.value = "";
        var companyInput = document.getElementById("company");
        companyInput.value = "";
        var YOEInput = document.getElementById("YOE");
        YOEInput.value = "";
        var NOPInput = document.getElementById("NOP");
        NOPInput.value = "";
        var companyAgencyInput = document.getElementById("companyAgency");
        companyAgencyInput.value = "";
        var YOEAgencyInput = document.getElementById("YOEAgency");
        YOEAgencyInput.value = "";
        var completedProjectInput = document.getElementById("completeProject");
        companyAgencyInput.value = "";
        var descInput = document.getElementById("desc");
        descInput.value = "";
        
      }

      window.onclick = function (event) {
        if (event.target == overlay) {
          closeModal(emailModal);
          closeModal(idNumberModal);
          closeModal(genderModal);
          closeModal(addressModal);
          closeModal(birthdayModal);
          closeModal(companyModal);
          closeModal(YOEModal);
          closeModal(NOPModal);
          closeModal(companyAgencyModal);
          closeModal(YOEAgencyModal);
          closeModal(completeProjectModal);
          closeModal(descModal);
        }
      };

      //Update NOP completed
      var completeProjectModal = document.getElementById("completeProjectModal");
      var changeCompleteProjectBtn = document.getElementById("changeCompleteProject");
      var closeCompleteProjectBtn = document.getElementById("closeCompleteProject");
      var cancelCompleteProjectBtn = document.getElementById("cancelCompleteProject");
      var updateCompleteProjectBtn = document.getElementById("updateCompleteProject");
      var completeProjectForm = document.getElementById("completeProjectForm");

      changeCompleteProjectBtn.onclick = function () {
        openModal(completeProjectModal);
      };

      closeCompleteProjectBtn.onclick = function () {
        closeModal(completeProjectModal);
      };

      cancelCompleteProjectBtn.onclick = function () {
        closeModal(completeProjectModal);
      };

      // Add event listener to validate phone number on update
      updateCompleteProjectBtn.onclick = function (event) {
        event.preventDefault();
        if (completeProjectForm.checkValidity()) {
          // Create a Promise to wair for all errors to be hidden
          const hideErrorsPromise = new Promise((resolve) => {
            // Wait 500ms to make sure all errors are hidden
            setTimeout(resolve, 500);
          });

          // Waiting Promise to hide all errors then alert to user
          hideErrorsPromise.then(() => {
            alert("Successfully update year of experience!");
            completeProjectForm.submit();
          });
        } else {
          // If some fields are empty, show default errors
          completeProjectForm.reportValidity();
        }
      };


      //Update YOE Agency
      var YOEAgencyModal = document.getElementById("YOEAgencyModal");
      var changeYOEAgencyBtn = document.getElementById("changeYOEAgency");
      var closeYOEAgencyBtn = document.getElementById("closeYOEAgency");
      var cancelYOEAgencyBtn = document.getElementById("cancelYOEAgency");
      var updateYOEAgencyBtn = document.getElementById("updateYOEAgency");
      var YOEAgencyForm = document.getElementById("YOEAgencyForm");

      changeYOEAgencyBtn.onclick = function () {
        openModal(YOEAgencyModal);
      };

      closeYOEAgencyBtn.onclick = function () {
        closeModal(YOEAgencyModal);
      };

      cancelYOEAgencyBtn.onclick = function () {
        closeModal(YOEAgencyModal);
      };

      // Add event listener to validate phone number on update
      updateYOEAgencyBtn.onclick = function (event) {
        event.preventDefault();
        if (YOEAgencyForm.checkValidity()) {
          // Create a Promise to wair for all errors to be hidden
          const hideErrorsPromise = new Promise((resolve) => {
            // Wait 500ms to make sure all errors are hidden
            setTimeout(resolve, 500);
          });

          // Waiting Promise to hide all errors then alert to user
          hideErrorsPromise.then(() => {
            alert("Successfully update year of experience!");
            YOEAgencyForm.submit();
          });
        } else {
          // If some fields are empty, show default errors
          YOEAgencyForm.reportValidity();
        }
      };

      //Updaet Description
      var descModal = document.getElementById("descModal");
      var changeDescBtn = document.getElementById("changeDesc");
      var closeDescBtn = document.getElementById("closeDesc");
      var cancelDescBtn = document.getElementById("cancelDesc");
      var updateDescBtn = document.getElementById("updateDesc");
      var descForm = document.getElementById("descForm");

      changeDescBtn.onclick = function () {
        openModal(descModal);
      };

      closeDescBtn.onclick = function () {
        closeModal(descModal);
      };

      cancelDescBtn.onclick = function () {
        closeModal(descModal);
      };

      // Add event listener to validate phone number on update
      updateDescBtn.onclick = function (event) {
        event.preventDefault();
        if (descForm.checkValidity()) {
          // Create a Promise to wair for all errors to be hidden
          const hideErrorsPromise = new Promise((resolve) => {
            // Wait 500ms to make sure all errors are hidden
            setTimeout(resolve, 500);
          });

          // Waiting Promise to hide all errors then alert to user
          hideErrorsPromise.then(() => {
            alert("Successfully update description!");
            descForm.submit();
          });
        } else {
          // If some fields are empty, show default errors
          descForm.reportValidity();
        }
      };

      //Update Company Agency
      var companyAgencyModal = document.getElementById("companyAgencyModal");
      var changeCompanyAgencyBtn = document.getElementById("changeCompanyAgency");
      var closeCompanyAgencyBtn = document.getElementById("closeCompanyAgency");
      var cancelCompanyAgencyBtn = document.getElementById("cancelCompanyAgency");
      var updateCompanyAgencyBtn = document.getElementById("updateCompanyAgency");
      var companyAgencyForm = document.getElementById("companyAgencyForm");

      changeCompanyAgencyBtn.onclick = function () {
        openModal(companyAgencyModal);
      };

      closeCompanyAgencyBtn.onclick = function () {
        closeModal(companyAgencyModal);
      };

      cancelCompanyAgencyBtn.onclick = function () {
        closeModal(companyAgencyModal);
      };

      // Add event listener to validate phone number on update
      updateCompanyAgencyBtn.onclick = function (event) {
        event.preventDefault();
        if (companyAgencyForm.checkValidity()) {
          // Create a Promise to wair for all errors to be hidden
          const hideErrorsPromise = new Promise((resolve) => {
            // Wait 500ms to make sure all errors are hidden
            setTimeout(resolve, 500);
          });

          // Waiting Promise to hide all errors then alert to user
          hideErrorsPromise.then(() => {
            alert("Successfully update name company!");
            companyAgencyForm.submit();
          });
        } else {
          // If some fields are empty, show default errors
          companyAgencyForm.reportValidity();
        }
      };

      //Update NOP
      var NOPModal = document.getElementById("NOPModal");
      var changeNOPBtn = document.getElementById("changeNOP");
      var closeNOPBtn = document.getElementById("closeNOP");
      var cancelNOPBtn = document.getElementById("cancelNOP");
      var updateNOPBtn = document.getElementById("updateNOP");
      var NOPForm = document.getElementById("NOPForm");

      changeNOPBtn.onclick = function () {
        openModal(NOPModal);
      };

      closeNOPBtn.onclick = function () {
        closeModal(NOPModal);
      };

      cancelNOPBtn.onclick = function () {
        closeModal(NOPModal);
      };

      // Add event listener to validate phone number on update
      updateNOPBtn.onclick = function (event) {
        event.preventDefault();
        if (NOPForm.checkValidity()) {
          // Create a Promise to wair for all errors to be hidden
          const hideErrorsPromise = new Promise((resolve) => {
            // Wait 500ms to make sure all errors are hidden
            setTimeout(resolve, 500);
          });

          // Waiting Promise to hide all errors then alert to user
          hideErrorsPromise.then(() => {
            alert("Successfully update number of project!");
            NOPForm.submit();
          });
        } else {
          // If some fields are empty, show default errors
          NOPForm.reportValidity();
        }
      };

      //Update YOE
      var YOEModal = document.getElementById("YOEModal");
      var changeYOEBtn = document.getElementById("changeYOE");
      var closeYOEBtn = document.getElementById("closeYOE");
      var cancelYOEBtn = document.getElementById("cancelYOE");
      var updateYOEBtn = document.getElementById("updateYOE");
      var YOEForm = document.getElementById("YOEForm");

      changeYOEBtn.onclick = function () {
        openModal(YOEModal);
      };

      closeYOEBtn.onclick = function () {
        closeModal(YOEModal);
      };

      cancelYOEBtn.onclick = function () {
        closeModal(YOEModal);
      };

      // Add event listener to validate phone number on update
      updateYOEBtn.onclick = function (event) {
        event.preventDefault();
        if (YOEForm.checkValidity()) {
          // Create a Promise to wair for all errors to be hidden
          const hideErrorsPromise = new Promise((resolve) => {
            // Wait 500ms to make sure all errors are hidden
            setTimeout(resolve, 500);
          });

          // Waiting Promise to hide all errors then alert to user
          hideErrorsPromise.then(() => {
            alert("Successfully update year of experience!");
            YOEForm.submit();
          });
        } else {
          // If some fields are empty, show default errors
          YOEForm.reportValidity();
        }
      };

      //Update company
      var companyModal = document.getElementById("companyModal");
      var changeCompanyBtn = document.getElementById("changeCompany");
      var closeCompanyBtn = document.getElementById("closeCompany");
      var cancelCompanyBtn = document.getElementById("cancelCompany");
      var updateCompanyBtn = document.getElementById("updateCompany");
      var companyForm = document.getElementById("companyForm");

      changeCompanyBtn.onclick = function () {
        openModal(companyModal);
      };

      closeCompanyBtn.onclick = function () {
        closeModal(companyModal);
      };

      cancelCompanyBtn.onclick = function () {
        closeModal(companyModal);
      };

      // Add event listener to validate phone number on update
      updateCompanyBtn.onclick = function (event) {
        event.preventDefault();
        if (companyForm.checkValidity()) {
          // Create a Promise to wair for all errors to be hidden
          const hideErrorsPromise = new Promise((resolve) => {
            // Wait 500ms to make sure all errors are hidden
            setTimeout(resolve, 500);
          });

          // Waiting Promise to hide all errors then alert to user
          hideErrorsPromise.then(() => {
            alert("Successfully update name company!");
            companyForm.submit();
          });
        } else {
          // If some fields are empty, show default errors
          companyForm.reportValidity();
        }
      };

      //Update Birthday
      var birthdayModal = document.getElementById("birthdayModal");
      var changeBirthdayBtn = document.getElementById("changeBirthday");
      var closeBirthdayBtn = document.getElementById("closeBirthday");
      var cancelBirthdayBtn = document.getElementById("cancelBirthday");
      var updateBirthdayBtn = document.getElementById("updateBirthday");
      var birthdayForm = document.getElementById("birthdayForm");

      changeBirthdayBtn.onclick = function () {
        openModal(birthdayModal);
      };

      closeBirthdayBtn.onclick = function () {
        closeModal(birthdayModal);
      };

      cancelBirthdayBtn.onclick = function () {
        closeModal(birthdayModal);
      };

      //validate birthday of user
      function validateDateOfBirth(value) {
        const birthDate = new Date(value);
        const currentDate = new Date();

        if (birthDate.getTime() >= currentDate.getTime()) {
          var errorMessageBirthday = document.getElementById("birthdayError");
          var birthdayInput = document.getElementById("birthday");
          errorMessageBirthday.textContent = "birthday has to be before current day.";
          birthdayInput.value = ""; // Delete bday value if invalid
        } else {
          errorMessageBirthday.textContent = "";
        }
      }

      // Add event listener to validate phone number on update
      updateBirthdayBtn.onclick = function (event) {
        event.preventDefault();
        if (birthdayForm.checkValidity()) {

          // Create a Promise to wair for all errors to be hidden
          const hideErrorsPromise = new Promise((resolve) => {
            // Wait 500ms to make sure all errors are hidden
            setTimeout(resolve, 500);
          });

          // Waiting Promise to hide all errors then alert to user
          hideErrorsPromise.then(() => {
            alert("Successfully update birthdate!");
            birthdayForm.submit();
          });
        } else {
          // If some fields are empty, show default errors
          birthdayForm.reportValidity();
        }
      };


      //Update Address
      var addressModal = document.getElementById("addressModal");
      var changeAddressBtn = document.getElementById("changeAddress");
      var closeAddressBtn = document.getElementById("closeAddress");
      var cancelAddressBtn = document.getElementById("cancelAddress");
      var updateAddressBtn = document.getElementById("updateAddress");
      var addressForm = document.getElementById("addressForm");

      changeAddressBtn.onclick = function () {
        openModal(addressModal);
      };

      closeAddressBtn.onclick = function () {
        closeModal(addressModal);
      };

      cancelAddressBtn.onclick = function () {
        closeModal(addressModal);
      };

      // Add event listener to validate phone number on update
      updateAddressBtn.onclick = function (event) {
        event.preventDefault();
        if (addressForm.checkValidity()) {

          // Create a Promise to wair for all errors to be hidden
          const hideErrorsPromise = new Promise((resolve) => {
            // Wait 500ms to make sure all errors are hidden
            setTimeout(resolve, 500);
          });

          // Waiting Promise to hide all errors then alert to user
          hideErrorsPromise.then(() => {
            alert("Successfully update gender!");
            addressForm.submit();
          });
        } else {
          // If some fields are empty, show default errors
          addressForm.reportValidity();
        }
      };

      //Update Gender
      var genderModal = document.getElementById("genderModal");
      var changeGenderBtn = document.getElementById("changeGender");
      var closeGenderBtn = document.getElementById("closeGender");
      var cancelGenderBtn = document.getElementById("cancelGender");
      var updateGenderBtn = document.getElementById("updateGender");
      var genderForm = document.getElementById("genderForm");

      changeGenderBtn.onclick = function () {
        openModal(genderModal);
      };

      closeGenderBtn.onclick = function () {
        closeModal(genderModal);
      };

      cancelGenderBtn.onclick = function () {
        closeModal(genderModal);
      };

      // Add event listener to validate phone number on update
      updateGenderBtn.onclick = function (event) {
        event.preventDefault();
        if (genderForm.checkValidity()) {

          // Create a Promise to wair for all errors to be hidden
          const hideErrorsPromise = new Promise((resolve) => {
            // Wait 500ms to make sure all errors are hidden
            setTimeout(resolve, 500);
          });

          // Waiting Promise to hide all errors then alert to user
          hideErrorsPromise.then(() => {
            alert("Successfully update gender!");
            genderForm.submit();
          });
        } else {
          // If some fields are empty, show default errors
          genderForm.reportValidity();
        }
      };

      //Update Email
      var emailModal = document.getElementById("emailModal");
      var changeEmailBtn = document.getElementById("changeEmail");
      var closeEmailBtn = document.getElementById("closeEmail");
      var cancelEmailBtn = document.getElementById("cancelEmail");
      var updateEmailBtn = document.getElementById("updateEmail");
      var emailForm = document.getElementById("emailForm");

      changeEmailBtn.onclick = function () {
        openModal(emailModal);
      };

      closeEmailBtn.onclick = function () {
        closeModal(emailModal);
      };

      cancelEmailBtn.onclick = function () {
        closeModal(emailModal);
      };

      // Add event listener to validate phone number on update
      updateEmailBtn.onclick = function (event) {
        event.preventDefault();
        if (emailForm.checkValidity()) {
          var emailInput = document.getElementById("email");
          var errorMessage = document.getElementById("emailError");
          

          if (!/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(emailInput.value)) {
            // Check if email is valid
            errorMessage.textContent = "email is not in the correct format. (ie:example@domain.com)";
            return;
          } else {
            errorMessage.textContent = "";
          }
          

          // Create a Promise to wair for all errors to be hidden
          const hideErrorsPromise = new Promise((resolve) => {
            // Wait 500ms to make sure all errors are hidden
            setTimeout(resolve, 500);
          });

          // Waiting Promise to hide all errors then alert to user
          hideErrorsPromise.then(() => {
            alert("Successfully update email!");
            emailForm.submit();
          });
        } else {
          // If some fields are empty, show default errors
          emailForm.reportValidity();
        }
      };

      //Update ID card number
      var idNumberModal = document.getElementById("idNumberModal");
      var changeidNumberBtn = document.getElementById("changeidNumber");
      var closeidNumberBtn = document.getElementById("closeidNumber");
      var cancelidNumberBtn = document.getElementById("cancelidNumber");
      var updateidNumberBtn = document.getElementById("updateidNumber");
      var idNumberForm = document.getElementById("idNumberForm");

      changeidNumberBtn.onclick = function () {
        openModal(idNumberModal);
      };

      closeidNumberBtn.onclick = function () {
        closeModal(idNumberModal);
      };

      cancelidNumberBtn.onclick = function () {
        closeModal(idNumberModal);
      };

      // Add event listener to validate phone number on update
      updateidNumberBtn.onclick = function (event) {
        event.preventDefault();
        if (idNumberForm.checkValidity()) {
          
          // Create a Promise to wair for all errors to be hidden
          const hideErrorsPromise = new Promise((resolve) => {
            // Wait 500ms to make sure all errors are hidden
            setTimeout(resolve, 500);
          });

          // Waiting Promise to hide all errors then alert to user
          hideErrorsPromise.then(() => {
            alert("Successfully ID card number!");
            idNumberForm.submit();
          });
        } else {
          // If some fields are empty, show default errors
          idNumberForm.reportValidity();
        }
      };


    </script>
  </body>
</html>
