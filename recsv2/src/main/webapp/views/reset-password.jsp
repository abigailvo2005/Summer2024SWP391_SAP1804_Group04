<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>RECS - Login</title>

      <!-- Link CSS -->
      <link id="pagestyle" href="/template/assets/css/soft-ui-dashboard.css?v=1.0.7" rel="stylesheet" />

      <!--Web's favicon-->
      <link rel="icon" type="image/png" href="/template/assets/img/logos/logo-no-name.png" />

      <!-- Fonts-->
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
    </head>

    <body class="bg-gray-100">
      <!-- START MAIN FORM LOG IN -->
      <main class="main-content mt-0">
        <section>
          <div class="page-header min-vh-75">
            <div class="container">
              <div class="row">
                <div class="col-xl-5 col-lg-5 col-md-6 d-flex flex-column mx-auto">
                  <div class="card card-plain mt-8">
                    <!--logo on left section-->
                    <div class="card-header pb-0 bg-transparent">
                      <div style="text-align: center">
                        <img src="/template/assets/img/logos/logo-og.png" style="width: 50%" />
                      </div>

                      <!-- Opening welcome text -->
                      <h3 class="font-weight-bolder text-info text-gradient" style="margin-top: -1rem">
                        Reset Password
                      </h3>
                      <p class="mb-0">Enter new password to reset</p>
                    </div>

                    <!-- Form to Login -->
                    <div class="card-body">
                      <form role="form" action="${pageContext.request.contextPath}/login/reset" method="post">
                          <input id="token" name="token" type="text" class="form-control hidden" value="{token}" />
                        <label>New Password</label>
                        <div class="mb-3 password-container-login">
                          <input id="newPassword" name="newPassword" type="password" class="form-control"
                            placeholder="New Password" aria-label="New Password" />
                          <button type="button" class="toggle-password" data-toggle="#newPassword">
                            <label>Show</label>
                          </button>
                          <p class="text-danger text-error mb-0 text-center pt-1 error-new-pw hidden">
                            password must be: <br />
                            Minimum length of 8 characters.<br />
                            At least one lowercase letter.<br />
                            At least one uppercase letter.<br />
                            At least one digit.<br />
                            At least one special character from the set: @$!%*?&.
                          </p>
                        </div>

                        <label>Confirm Password</label>
                        <div class="mb-3 password-container-login">
                          <input id="confirmPassword" name="confirmPassword" type="password" class="form-control"
                            placeholder="Confirm Password" aria-label="Confirm Password" />
                          <button type="button" class="toggle-password" data-toggle="#confirmPassword">
                            <label>Show</label>
                          </button>
                          <p class="text-danger text-error mb-0 text-center pt-1 error-confirm-pw hidden">
                            Passwords do not match.
                          </p>
                        </div>


                        <!-- sign in button -->
                        <div class="text-center">
                          <a href="${pageContext.request.contextPath}/login" class="btn bg-light w-30 mt-4 mb-0">
                            Cancel
                          </a>
                          <button type="submit" class="btn bg-gradient-info w-30 mt-4 mb-0" onclick="submitNewPassword()">
                            Reset
                          </button>

                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>
      <!-- END MAIN FORM LOG IN -->

      <!-- START FOOTER -->
      <footer class="footer py-5">
        <div class="container">
          <div class="row">
            <div class="col-lg-8 mb-4 mx-auto text-center">
              <!-- optional function: introduce what our system's doing -->
              <a href="javascript:;" target="_blank" class="text-secondary me-xl-5 me-3 mb-sm-0 mb-2">
                About Us
              </a>
              <!--optional function: introduce team member-->
              <a href="" target="_blank" class="text-secondary me-xl-5 me-3 mb-sm-0 mb-2">
                Team
              </a>

              <div class="col-8 mx-auto text-center mt-1">
                <p class="mt-3 text-secondary">
                  Copyright ©
                  <script>
                    document.write(new Date().getFullYear());
                  </script>
                  RECS by Team 4 - SAP1804.
                </p>
              </div>
            </div>
          </div>
        </div>
      </footer>
      <!-- END FOOTER-->

      <!--   Core JS Files   -->
      <script src="/template/assets/js/core/bootstrap.min.js"></script>
      <script src="/template/assets/js/plugins/perfect-scrollbar.min.js"></script>
      <script src="/template/assets/js/plugins/smooth-scrollbar.min.js"></script>
      <script>

        function togglePassword(inputId) {
          var input = document.querySelector(inputId);
          if (input.type === "password") {
            input.type = "text";
          } else {
            input.type = "password";
          }
        }

        // Add event listeners to toggle password buttons
        document.querySelectorAll(".toggle-password").forEach(function (button) {
          var isShowing = false;
          button.addEventListener("click", function () {
            var toggleTarget = button.getAttribute("data-toggle");
            togglePassword(toggleTarget);
            if (isShowing) {
              button.innerHTML = "<label>Show</label>";
            } else {
              button.innerHTML = "<label>Hide</label>";
            }
            isShowing = !isShowing;
          });
        });

        function submitNewPassword() {
          event.preventDefault();

          if(document.querySelector("form").checkValidity()) {
            const newPasswordInput = document.querySelector("#newPassword");
            const confirmPasswordInput = document.querySelector("#confirmPassword");
            const newPwError = document.querySelector(".error-new-pw");
            const confirmError = document.querySelector(".error-confirm-pw");

            if (
              !/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(
                newPasswordInput.value
              )
            ) {
              // Check if password is valid
              newPwError.classList.remove("hidden");
              return;
            } else {
              newPwError.classList.add("hidden");
            }

            if (newPasswordInput.value !== confirmPasswordInput.value) {
              confirmError.classList.remove("hidden");
              return;
          } else {
            confirmError.classList.add("hidden");
          }

          // Create a Promise to wair for all errors to be hidden
          const hideErrorsPromise = new Promise((resolve) => {
              // Wait 500ms to make sure all errors are hidden
              setTimeout(resolve, 500);
            });

            // Waiting Promise to hide all errors then alert to user
            hideErrorsPromise.then(() => {
              alert("Successfully reset password!");
              document.querySelector("form").submit();
            });
        } else {
          // If some fields are empty, show default errors
          document.querySelector("form").reportValidity();
        }
      }

      </script>
    </body>

    </html>