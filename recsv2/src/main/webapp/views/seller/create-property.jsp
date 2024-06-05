<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RECS - Create Property</title>

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
    <!-- START: SIDEBAR -->
    <header>
      <jsp:include page="/views/seller/sidebar-seller.jsp" />
    </header>
    <!-- END SIDEBAR -->

    <main
      class="no-dash main-content position-relative max-height-vh-100 h-100 border-radius-lg"
    >
      <!-- START: FORM CREATE PROPERTY-->
      <section class="min-vh-100 mb-8">
        <div
          class="page-header align-items-start min-vh-35 pt-1 pb-1 m-3 border-radius-lg"
          style="
            background-image: url('/template/assets/img/curved-images/create-property-background.jpeg'/>');
          "
        >
          <span class="mask bg-gradient-dark opacity-6"></span>
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-sm-12 col-md-8 col-lg-6 text-center mx-auto">
                <h2 class="text-white mb-1 mt-sm-4">Posting Validation</h2>
              </div>
            </div>
          </div>
        </div>
        <!-- END: INTRODUCTION HEADER -->

        <!-- START: FORM TO CREATE PROPERTY -->
        <div class="container">
          <div class="row mt-lg-n8 mt-md-n8 mt-n7 mt-sm-n9">
            <div class="col-12 col-xl-11 mx-auto">
              <div class="card z-index-0">
                <div class="card-header text-center pt-4">
                  <h5>Property Validation Request Form</h5>
                </div>

                <div class="card-body">
                  <form
                    role="form text-left"
                    name="property-information"
                    action="${pageContext.request.contextPath}/"
                    method="post"
                  >
                    <div class="mb-3 row">
                      <div class="col-lg-2 col-sm-2"><label> Name:</label></div>
                      <div class="col-lg-10 col-sm-10">
                        <input
                          id="prop-name"
                          type="text"
                          name="prop-name"
                          class="form-control form-create-control col-10"
                          placeholder="your property's name"
                          required
                        />
                        <!-- ERROR MESSAGE BEING HIDDEN -->
                        <p
                          class="error-name text-danger text-error mb-0 text-center pt-1 hidden"
                        >
                          name should only contains maximum 32 characters.
                        </p>
                      </div>
                    </div>

                    <div class="mb-3 row">
                      <div class="col-lg-2 col-sm-2">
                        <label> Address:</label>
                      </div>
                      <div class="col-lg-10 col-sm-10">
                        <input
                          type="text"
                          name="prop-address"
                          class="form-control form-create-control col-10"
                          placeholder="your property's adress"
                          required
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
                          name="prop-desc"
                          class="form-control form-create-control col-10"
                          placeholder="your property's description (i.e interior/exterior features)"
                          required
                        />
                      </div>
                    </div>

                    <div class="mb-3 row">
                      <div class="col-sm-2"><label> Area:</label></div>
                      <div class="col-sm-3">
                        <input
                          type="number"
                          name="prop-area"
                          class="form-control form-create-control col-10"
                          placeholder="your property's area"
                          min="1"
                          required
                        />
                      </div>
                      <div class="col-sm-1"><label>m²</label></div>

                      <div class="col-sm-2"><label>Price:</label></div>
                      <div class="col-3">
                        <input
                          type="number"
                          name="prop-price"
                          class="form-control form-create-control"
                          placeholder="your property's price"
                          min="1"
                          required
                        />
                      </div>
                      <div class="col-sm-1"><label>VND</label></div>
                    </div>

                    <!-- To upload images for Property -->
                    <div class="row mb-3">
                      <div class="col-2"><label>Images:</label></div>
                      <div class="col-4">
                        <input id="prop-img" type="file" class="form-control
                        form-create-control col-10" multiple
                        required />
                        <!-- ERROR MESSAGE BEING HIDDEN -->
                        <p
                          class="error-img text-danger text-error mb-0 text-center pt-1 hidden"
                        >
                          only accept image formats (.heic .png .jpg .jpeg .gif)
                        </p>
                      </div>

                      <!-- To Choose property type - shows corresponding information to fill in next -->
                      <div class="col-2">
                        <label>Property Type:</label>
                      </div>
                      <div class="col-4">
                        <select
                          id="prop-type"
                          class="form-control form-create-control"
                          onchange="showPropertyTypeSection(this)"
                          required
                        >
                          <option value="" selected>Select type</option>
                          <option value="land">Land</option>
                          <option value="house">House</option>
                        </select>
                      </div>
                    </div>

                    <!-- Only fields for land -->
                    <div id="land-info-section" class="hidden">
                      <div class="mb-3 row">
                        <div class="col-sm-2">
                          <label>Land Category:</label>
                        </div>
                        <div class="col-sm-4">
                          <select
                            class="land form-control form-create-control col-10"
                            required
                          >
                            <option value="" selected>
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

                        <div class="col-2"><label>Paperwork:</label></div>
                        <div class="col-4">
                          <input id="prop-pw-land" type="text"
                          class="form-control form-create-control col-10"
                          placeholder="your Google Drive Folder link contains
                          property's paperwork" required />
                          <!-- ERROR MESSAGE BEING HIDDEN -->
                          <p
                            class="error-pw-land text-danger text-error mb-0 text-center pt-1 hidden"
                          >
                            only accept Google Drive Folder links.
                          </p>
                        </div>
                      </div>
                    </div>

                    <!-- Only fields for house -->
                    <div id="house-info-section" class="hidden">
                      <div class="mb-3 row">
                        <div class="col-sm-2">
                          <label>House Category:</label>
                        </div>
                        <div class="col-sm-4">
                          <select
                            class="form-control form-create-control col-10 house"
                            required
                          >
                            <option value="" selected>
                              Select category (for House type only)
                            </option>
                            <option value="apartment">Apartment</option>
                            <option value="townhouse">Townhouse</option>
                            <option value="mansion">Mansion, Villa</option>
                            <option value="bungalow">Bungalow</option>
                          </select>
                        </div>
                        <div class="col-2"><label>Paperwork:</label></div>
                        <div class="col-4">
                          <input id="prop-pw-house" type="text"
                          class="form-control form-create-control col-10"
                          placeholder="your Google Drive Folder link contains
                          property's paperwork" required />
                          <!-- ERROR MESSAGE BEING HIDDEN -->
                          <p
                            class="error-pw-house text-danger text-error mb-0 text-center pt-1 hidden"
                          >
                            only accept Google Drive Folder links.
                          </p>
                        </div>
                      </div>

                      <div class="mb-3 row">
                        <div class="col-sm-2"><label> Built Year:</label></div>
                        <div class="col-sm-2">
                          <input
                            type="number"
                            class="house form-control form-create-control col-10"
                            placeholder="year"
                            min="1"
                            required
                          />
                        </div>

                        <div class="col-sm-1"><label>Bedroom:</label></div>
                        <div class="col-sm-2">
                          <input
                            type="number"
                            class="house form-control form-create-control col-10"
                            placeholder="number"
                            min="1"
                            required
                          />
                        </div>
                        <div class="col-sm-1"><label>room(s)</label></div>

                        <div class="col-sm-1"><label>Bathroom:</label></div>
                        <div class="col-sm-2">
                          <input
                            type="number"
                            class="house form-control form-create-control col-10"
                            placeholder="number"
                            min="1"
                            required
                          />
                        </div>
                        <div class="col-sm-1"><label>room(s)</label></div>
                      </div>
                    </div>

                    <!-- submit button -->
                    <div class="col-12 mt-1">
                      <div class="h-100 container-fluid mt-0">
                        <div class="row justify-content-center">
                          <div class="col-4">
                            <button
                              type="button"
                              onclick="submitRequest(event)"
                              class="btn btn-dark w-100 my-2 mb-2"
                            >
                              Submit
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- END: FORM TO CREATE PROPERTY -->

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

    <!--   Core JS Files   -->
    <script src="/template/assets/js/core/popper.min.js"></script>
    <script src="/template/assets/js/core/bootstrap.min.js"></script>
    <script src="/template/assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script src="/template/assets/js/plugins/chartjs.min.js"></script>
    <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>

    <script>
      /* Create Property Form: only show some fields corresponding to type of property */
      function showPropertyTypeSection(select) {
        const landInfoSection = document.getElementById("land-info-section");
        const houseInfoSection = document.getElementById("house-info-section");

        if (select.value === "land") {
          landInfoSection.classList.remove("hidden");
          houseInfoSection.classList.add("hidden");

          // make every houseInfoSection input not-required
          houseInfoSection
            .querySelectorAll("input, .house")
            .forEach((input) => {
              input.required = false;
            });

          //make every land InfoSection input required
          landInfoSection.querySelectorAll("input, .land").forEach((input) => {
            input.required = true;
          });
        } else if (select.value === "house") {
          landInfoSection.classList.add("hidden");
          houseInfoSection.classList.remove("hidden");

          // make every lanInfoSection input not-required
          landInfoSection.querySelectorAll("input, .land").forEach((input) => {
            input.required = false;
          });

          // make every houseInfoSection input required
          houseInfoSection
            .querySelectorAll("input, .house")
            .forEach((input) => {
              input.required = true;
            });
        } else {
          landInfoSection.classList.add("hidden");
          houseInfoSection.classList.add("hidden");

          // make none input required
          landInfoSection.querySelectorAll("input, .land").forEach((input) => {
            input.required = false;
          });
          houseInfoSection
            .querySelectorAll("input, .house")
            .forEach((input) => {
              input.required = false;
            });
        }
      }

      /* Process data & redirect back to dashboard after clicked submit */
      function submitRequest(event) {
        event.preventDefault(); //Stop form from default submitting

        // Check if all fields have values
        if (document.querySelector("form").checkValidity()) {
          const type = document.querySelector("#prop-type").value;
          const propertyNameInput = document.querySelector("#prop-name");
          const propertyImageInput = document.querySelector("#prop-img");
          const propertyLandPW = document.querySelector("#prop-pw-land").value;
          const propertyHousePW =
            document.querySelector("#prop-pw-house").value;
          const nameError = document.querySelector(".error-name");
          const imgError = document.querySelector(".error-img");
          const pwLandError = document.querySelector(".error-pw-land");
          const pwHouseError = document.querySelector(".error-pw-house");
          const validImageTypes = [
            "image/gif",
            "image/jpeg",
            "image/png",
            "image/jpg",
            "image/heic"
          ];

          // No errors on start up
          nameError.classList.add("hidden"); //clear all errors first
          imgError.classList.add("hidden");
          pwHouseError.classList.add("hidden");
          pwLandError.classList.add("hidden");

          if (propertyNameInput.value.length > 32) {
            //Check if property's name is longer than 32 characters
            nameError.classList.remove("hidden");
            return;
          } else if (
            type.includes("house") &&
            !/^https?:\/\/drive\.google\.com\/drive\/folders\/([a-zA-Z0-9_-]+)/.test(
              propertyHousePW
            )
          ) {
            pwHouseError.classList.remove("hidden");
            console.log("house pw error");
            console.log(propertyHousePW);
            return;
          } else if (
            type.includes("land") &&
            !/^https?:\/\/drive\.google\.com\/drive\/folders\/([a-zA-Z0-9_-]+)/.test(
              propertyLandPW
            )
          ) {
            pwLandError.classList.remove("hidden");
            console.log("land pw error");
            console.log(propertyLandPW);
            return;
          }

          // No errors: Shows message "Successfully requested" & redirect back to dashboard
          setTimeout(function () {
            alert("Successfully requested");
            document.querySelector("form").submit();
          }, 500);
        } else {
          // If some fields are empty, show default errors
          document.querySelector("form").reportValidity();
        }
      }
    </script>
  </body>
</html>