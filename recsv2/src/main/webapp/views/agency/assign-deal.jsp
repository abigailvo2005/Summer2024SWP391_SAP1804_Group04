<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="jakarta.tags.core" prefix="c" %> <%@
taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RECS - Assign Deal</title>

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
      <jsp:include page="/views/agency/sidebar-agency.jsp" />
    </header>
    <!-- END SIDEBAR -->

    <main
      class="no-dash main-content position-relative max-height-vh-100 h-100 border-radius-lg"
    >
      <!-- START: DEAL LITSING AVAILABLE -->
      <div class="container-fluid">
        <div class="row my-4">
          <div class="mb-md-0 mb-4">
            <div class="card">
              <div class="card-header pb-0">
                <div class="row">
                  <div class="col-lg-8 col-9">
                    <h6>Deal Listing Available</h6>
                    <p class="text-sm mb-0">
                      <i class="fa-solid fa-house-user"></i>
                      <span class="font-weight-bold ms-1"
                        >${dealList.size()} request(s)</span
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
                        id="dealSearch"
                        type="text"
                        class="form-control"
                        placeholder="Type name/type here..."
                        onkeyup="searchTable()"
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
                            OWNER
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
                        <c:forEach items="${dealList}" var="deal">
                          <tr class="deal-row">
                            <td class="align-middle text-center text-sm">
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <div
                                  class="d-flex flex-column justify-content-center"
                                >
                                  <p
                                    id="deal-id"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${deal.sellerInfo.username}
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
                                    id="deal-name"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${deal.name}
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
                                    id="deal-type"
                                    class="mb-0 text-sm fw-bold text-dark"
                                  >
                                    ${deal.realEstateType}
                                  </p>
                                </div>
                              </div>
                            </td>
                            <td class="align-middle">
                              <div
                                class="d-flex px-2 py-1 justify-content-center"
                              >
                                <p
                                  id="deal-createDate"
                                  class="mb-0 text-sm fw-bold text-dark"
                                >
                                  ${deal.createDate}
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
                                    id="deal-status"
                                    class="mb-0 text-sm fw-bold text-muted"
                                  >
                                    ${deal.status}
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
                                    onclick="viewDetail('${req.realEstateId}')"
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
      <!-- END DEAL LISTING AVAILABLE-->

      <!-- START: FORM ASSIGN DEAL LISTING AVAILABLE -->
      <div id="form-assign-job-container" class="container">
        <div class="row">
          <div class="col-12 col-xl-11 mx-auto">
            <div class="card z-index-0">
              <div class="card-header text-center pt-4">
                <h5><b>Deal Assign Comfirmation</b></h5>
              </div>
              <div class="card-body">
                <form
                  id="form-assign-deal"
                  role="form text-left"
                  name="assign-deal-form"
                  action="${pageContext.request.contextPath}/agency/assign-deal"
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
                      <label
                        ><a id="form-land-pw" target="_blank" download></a
                      ></label>
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
                        <label
                          ><a id="form-house-pw" target="_blank" download></a
                        ></label>
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
                    <div class="col-sm-2"><label>Member Assigned:</label></div>
                    <div class="col-sm-6">
                      <select
                        class="form-control form-create-control"
                        onchange="chooseMember(this.value)"
                      >
                        <option class="fs-6" value="">Choose Member</option>
                        <c:forEach items="${memberList}" var="member">
                          <option class="fs-6" value="${member.memberId}">
                            ${member.username}
                          </option>
                        </c:forEach>
                      </select>
                    </div>
                    <div class="col-sm-4">
                      <input
                        id="form-chosen-member"
                        type="text"
                        name="memberId"
                        class="form-control form-create-control col-10"
                        hidden
                      />
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
      <!-- END: FORM ASSIGN DEAL LISTING AVAILABLE -->

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

    <script>

      function chooseMember(selectedMember) {
        // Retrieve the "chosen-member" input element
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
          alert("No member has been chosen.");
          return;
        }

        //show success message
        alert("Job assigned successfully!");

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
        var requests = document.querySelectorAll(".deal-row");

        //Iterate through all rows and hide/show based on value
        requests.forEach(function (row) {
          var dealName = row
            .querySelector("#deal-name")
            .textContent.toLowerCase();
          var dealType = row
            .querySelector("#deal-type")
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
    <script src="/template/assets/js/core/popper.min.js"></script>
    <script src="/template/assets/js/core/bootstrap.min.js"></script>
    <script src="/template/assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/chartjs.min.js"></script>
    <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </body>
</html>