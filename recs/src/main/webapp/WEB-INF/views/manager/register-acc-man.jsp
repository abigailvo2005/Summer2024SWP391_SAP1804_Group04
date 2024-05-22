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
      <jsp:include page="/WEB-INF/views/manager/sidebar-man.jsp" />
    </header>
    <!-- END INCLUDE SIDEBAR -->

    <main
      class="main-content no-dash position-relative max-height-vh-100 h-100 border-radius-lg"
    >
      <!-- START: INTRODUCTION HEADER -->
      <section class="min-vh-100 mb-8">
        <div
          class="page-header align-items-start min-vh-35 pt-1 pb-1 m-3 border-radius-lg"
          style="
            background-image: url(<c:url value='/template/assets/img/register-staff-bg.png'/>);
          "
        >
          <span class="mask bg-gradient-dark opacity-6"></span>
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-sm-12 col-md-8 col-lg-6 text-center mx-auto">
                <h2 class="text-white mb-1 mt-sm-4">Register New Staff</h2>
              </div>
            </div>
          </div>
        </div>
        <!-- END: INTRODUCTION HEADER -->

        <!-- START: FORM TO REGISTER NEW STAFF -->
        <div class="container">
          <div class="row mt-lg-n8 mt-md-n8 mt-n7 mt-sm-n9">
            <div class="col-12 col-xl-11 mx-auto">
              <div class="card z-index-0">
                <div class="card-header text-center pt-4">
                  <h5>Staff Register Form</h5>
                </div>

                <div class="card-body">
                  <form role="form text-left" name="register-staff-form">
                    <div class="mb-3 row">
                      <div class="col-sm-2"><label>First Name:</label></div>
                      <div class="col-sm-4">
                        <input
                          type="text"
                          class="form-control form-create-control col-10"
                          placeholder="firstname"
                        />
                        <!-- ERROR MESSAGE BEING HIDDEN -->
                        <!-- <p
                          class="text-danger text-error mb-0 text-center pt-1 hidden"
                        >
                          name should only contains 255 characters.
                        </p> -->
                      </div>
                      <div class="col-sm-2"><label>Last Name:</label></div>
                      <div class="col-sm-4">
                        <input
                          type="text"
                          class="form-control form-create-control col-10"
                          placeholder="lastname"
                        />
                      </div>
                    </div>

                    <div class="mb-3 row">
                      <div class="col-lg-2 col-sm-2">
                        <label> Address:</label>
                      </div>
                      <div class="col-lg-10 col-sm-10">
                        <input
                          type="text"
                          class="form-control form-create-control col-10"
                          placeholder="your property's adress"
                        />
                      </div>
                    </div>

                    <div class="mb-3 row">
                      <div class="col-lg-2 col-sm-2">
                        <label> Description:</label>
                      </div>
                      <div class="col-lg-10 col-sm-10">
                        <input
                          type="text"
                          class="form-control form-create-control col-10"
                          placeholder="your property's description (i.e interior/exterior features)"
                        />
                      </div>
                    </div>

                    <div class="mb-3 row">
                      <div class="col-sm-2"><label> Area:</label></div>
                      <div class="col-sm-3">
                        <input
                          type="number"
                          class="form-control form-create-control col-10"
                          placeholder="your property's area"
                          min="1"
                        />
                      </div>
                      <div class="col-sm-1"><label>m²</label></div>

                      <div class="col-sm-2"><label>Price:</label></div>
                      <div class="col-sm-3">
                        <input
                          type="number"
                          class="form-control form-create-control col-10"
                          placeholder="your property's price"
                          min="1"
                        />
                      </div>
                      <div class="col-sm-1"><label>VND</label></div>
                    </div>

                    <div class="mb-3 row">
                      <div class="col-lg-2 col-sm-2">
                        <label>Property Type:</label>
                      </div>
                      <div class="col-lg-10 col-sm-10">
                        <select class="form-control form-create-control col-10">
                          <option value="" disabled selected>
                            Select type
                          </option>
                          <option value="land">Land</option>
                          <option value="house">House</option>
                        </select>
                      </div>
                    </div>

                    <!-- To upload images for Property -->
                    <div class="row">
                      <div class="col-sm-1"><label>Images:</label></div>
                      <div class="col-sm-2">
                        <input
                          type="image"
                          class="form-control form-create-control col-10"
                          placeholder="number"
                          min="1"
                        />
                      </div>
                      <div class="col-sm-1"><label>room(s)</label></div>
                    </div>

                    <!-- Only fields for land -->
                    <div id="land-info-section">
                      <div class="ps-1 row">
                        <p class="text-message">
                          Fill these fields if your property's type is "land"
                        </p>
                      </div>
                      <div class="mb-3 row">
                        <div class="col-sm-2">
                          <label>Land Category:</label>
                        </div>
                        <div class="col-sm-10">
                          <select
                            class="form-control form-create-control col-10"
                            disabled
                          >
                            <option value="" disabled selected>
                              Select category (for Land type only)
                            </option>
                            <option value="agricultural">
                              Agricultural Land
                            </option>
                            <option value="non-agricultural">
                              Non-agricultural Land
                            </option>
                          </select>
                        </div>
                      </div>
                    </div>

                    <!-- Only fields for house -->
                    <div id="house-info-section disabled-form">
                      <div class="ps-1 row">
                        <p class="text-message">
                          Fill these fields if your property's type is "house"
                        </p>
                      </div>
                      <div class="mb-3 row">
                        <div class="col-sm-2">
                          <label>House Category:</label>
                        </div>
                        <div class="col-sm-10">
                          <select
                            class="form-control form-create-control col-10"
                            disabled
                          >
                            <option value="" disabled selected>
                              Select category (for House type only)
                            </option>
                            <option value="apartment">Apartment</option>
                            <option value="townhouse">Townhouse</option>
                            <option value="mansion">Mansion, Villa</option>
                            <option value="bungalow">Bungalow</option>
                          </select>
                        </div>
                      </div>

                      <div class="mb-3 row">
                        <div class="col-sm-2"><label> Built Year:</label></div>
                        <div class="col-sm-2">
                          <input
                            type="number"
                            class="form-control form-create-control col-10"
                            placeholder="year"
                            min="1"
                            disabled
                          />
                        </div>

                        <div class="col-sm-1"><label>Bedroom:</label></div>
                        <div class="col-sm-2">
                          <input
                            type="number"
                            class="form-control form-create-control col-10"
                            placeholder="number"
                            min="1"
                            disabled
                          />
                        </div>
                        <div class="col-sm-1"><label>room(s)</label></div>

                        <div class="col-sm-1"><label>Bathroom:</label></div>
                        <div class="col-sm-2">
                          <input
                            type="number"
                            class="form-control form-create-control col-10"
                            placeholder="number"
                            min="1"
                            disabled
                          />
                        </div>
                        <div class="col-sm-1"><label>room(s)</label></div>
                      </div>
                    </div>

                    <!-- submit button -->
                    <div class="text-center">
                      <button
                        type="button"
                        class="btn bg-gradient-dark w-100 my-4 mb-2"
                      >
                        Submit Request
                      </button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>


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
            <ul
              class="nav nav-footer justify-content-center justify-content-lg-end"
            >
              <li class="nav-item">
                <a href="#" class="nav-link text-muted" target="_blank"
                  >About Us</a
                >
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

    <!--   Core JS Files   -->
    <script src="<c:url value='/template/assets/js/core/popper.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/core/bootstrap.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/plugins/perfect-scrollbar.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/plugins/smooth-scrollbar.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/plugins/chartjs.min.js'/>"></script>
    <script src="<c:url value='/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7' />"></script>
  </body>
</html>
