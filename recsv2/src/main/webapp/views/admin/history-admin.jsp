<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>RECS - History</title>

            <!-- Link CSS -->
            <link id="pagestyle" href="/template/assets/css/soft-ui-dashboard.css?v=1.0.7" rel="stylesheet" />

            <!--Web's favicon-->
            <link rel="icon" type="image/png" href="/template/assets/img/logos/logo-no-name.png" />

            <!-- Fonts-->
            <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />

            <!-- FontAwesome: icons used in website-->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
        </head>

        <body class="g-sidenav-show bg-gray-100">
            <!-- START: SIDEBAR -->
            <header>
                <jsp:include page="/views/admin/sidebar-admin.jsp" />
            </header>
            <!-- END SIDEBAR -->


            <main class="main-content no-dash position-relative max-height-vh-100 h-100 border-radius-lg">
                <!--Start history list account approved-->
                <div class="container-fluid">
                    <div class="row my-4">
                        <div class="mb-md-0 mb-4">
                            <div class="card">
                                <div class="card-header pb-0">
                                    <div class="row">
                                        <div class="col-lg-8 col-9">
                                            <h6>History Account Created</h6>
                                            <p class="text-sm mb-0">
                                                <i class="fa-regular fa-comment-dots"></i>
                                                <span class="font-weight-bold ms-1">${listAccountActive.size()}
                                                    available(s)</span>
                                                in total
                                            </p>
                                        </div>
                                        <div class="ms-md-auto pe-md-3 d-flex align-items-center col-lg-4 col-3">
                                            <div class="input-group">
                                                <span class="input-group-text text-body"><i class="fas fa-search"
                                                        aria-hidden="true"></i></span>
                                                <input id="searchInput" type="text" class="form-control"
                                                    placeholder="Type property name here..." onkeyup="searchTable()" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card-body px-0 pb-2">
                                        <div class="table-responsive">
                                            <table class="table align-items-center mb-0">
                                                <thead>
                                                    <tr>
                                                        <th
                                                            class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3">
                                                            ID
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            Name
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2">
                                                            Role
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            Date Create
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            Gender
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            Status
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            View Details
                                                        </th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:forEach items="${listAccountActive}" var="active">
                                                        <tr class="validate-row">
                                                            <td>
                                                                <div class="d-flex justify-content-start">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-start">
                                                                        <p id="req-name"
                                                                            class="mb-0 text-sm fw-bold text-dark">
                                                                            ${active.accountId}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p class="mb-0 text-sm fw-bold text-dark">
                                                                            ${active.usernmae}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p class="mb-0 text-sm fw-bold text-dark">
                                                                            ${active.roleName}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p class="mb-0 text-sm fw-bold text-muted">
                                                                            ${active.createDate}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p class="mb-0 text-sm fw-bold text-muted">
                                                                            ${active.gender}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p class="mb-0 text-sm fw-bold text-muted">
                                                                            ${active.status}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <a class="show-detail"
                                                                            onclick="viewDetail('${active.Id}')"><i
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
                <!--End history list account approved-->
                <!--Start history list account banned-->
                <div class="container-fluid">
                    <div class="row my-4">
                        <div class="mb-md-0 mb-4">
                            <div class="card">
                                <div class="card-header pb-0">
                                    <div class="row">
                                        <div class="col-lg-8 col-9">
                                            <h6>History Account Banned</h6>
                                            <p class="text-sm mb-0">
                                                <i class="fa-regular fa-comment-dots"></i>
                                                <span class="font-weight-bold ms-1">${listAccountBan.size()}
                                                    account ban</span>
                                                in total
                                            </p>
                                        </div>
                                        <div class="ms-md-auto pe-md-3 d-flex align-items-center col-lg-4 col-3">
                                            <div class="input-group">
                                                <span class="input-group-text text-body"><i class="fas fa-search"
                                                        aria-hidden="true"></i></span>
                                                <input id="searchInput" type="text" class="form-control"
                                                    placeholder="Type property name here..." onkeyup="searchTable()" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card-body px-0 pb-2">
                                        <div class="table-responsive">
                                            <table class="table align-items-center mb-0">
                                                <thead>
                                                    <tr>
                                                        <th
                                                            class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ps-2 col-3">
                                                            ID
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            Name
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-2">
                                                            Role
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            Date Ban
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            Gender
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            Status
                                                        </th>
                                                        <th
                                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 col-1">
                                                            View Details
                                                        </th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:forEach items="${listAccountBan}" var="ban">
                                                        <tr class="validate-row">
                                                            <td>
                                                                <div class="d-flex justify-content-start">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-start">
                                                                        <p id="req-name"
                                                                            class="mb-0 text-sm fw-bold text-dark">
                                                                            ${ban.accountId}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p class="mb-0 text-sm fw-bold text-dark">
                                                                            ${ban.usernmae}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p class="mb-0 text-sm fw-bold text-dark">
                                                                            ${ban.roleName}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p class="mb-0 text-sm fw-bold text-muted">
                                                                            ${ban.createDate}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p class="mb-0 text-sm fw-bold text-muted">
                                                                            ${ban.gender}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <p class="mb-0 text-sm fw-bold text-muted">
                                                                            ${ban.status}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="d-flex px-2 py-1 justify-content-center">
                                                                    <div
                                                                        class="d-flex flex-column justify-content-center">
                                                                        <a class="show-detail"
                                                                            onclick="viewDetail('${ban.Id}')"><i
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
                <!--End history list account banned-->
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
            <!--   Core JS Files   -->
            <script src="/template/assets/js/core/popper.min.js"></script>
            <script src="/template/assets/js/core/bootstrap.min.js"></script>
            <script src="/template/assets/js/plugins/perfect-scrollbar.min.js"></script>
            <script src="/template/assets/js/plugins/smooth-scrollbar.min.js"></script>
            <script src="/template/assets/js/plugins/chartjs.min.js"></script>
            <script src="/template/assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
        </body>

        </html>