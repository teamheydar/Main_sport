<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Panel.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Test.aspx.cs" Inherits="Admin_Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">
    <head>
        <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico">




        <!-- Vendors CSS -->


        <!-- Page CSS -->

        <!-- Helpers -->

        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-navbar-full layout-horizontal layout-without-menu">
            <div class="layout-container">
                <!-- Navbar -->



                <!-- / Navbar -->

                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Menu -->

                        <!-- / Menu -->

                        <!-- Content -->

                        <div class="container-xxl flex-grow-1 container-p-y">
                            <h4 class="py-3 breadcrumb-wrapper mb-4"><span class="text-muted fw-light">فرم‌ها /</span> انتخاب‌گرها</h4>

                            <div class="row">
                                <!-- Flat Picker -->
                                <div class="col-12 mb-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row">














                                                <!-- Time Picker-->
                                                <div class="col-md-6 col-12 mb-4">
                                                    <label for="flatpickr-time" class="form-label">انتخاب‌گر زمان</label>
                                                    <input type="text" class="form-control" placeholder="HH:MM" id="flatpickr-time">
                                                </div>
                                                <div class="col-md-6 col-12 mb-4">
                                                    <label for="flatpickr-time" class="form-label">انتخاب‌گر زمان</label>
                                                    <input type="text" class="form-control" placeholder="HH:MM" id="flatpickr-time1">
                                                </div>
                                                <!-- /Time Picker -->


                                                <div class="col-md-6 col-12 mb-4">
                                                    <label for="flatpickr-date" class="form-label">انتخاب‌گر تاریخ</label>
                                                    <input onchange="GetDate(this)" type="hidden" class="form-control flatpickr-input" placeholder="YYYY/MM/DD" id="flatpickr-date">
                                                </div>
                                                <div class="col-md-6 col-12 mb-4">
                                                    <label for="flatpickr-date" class="form-label">انتخاب‌گر تاریخ</label>
                                                    <input onchange="GetDate(this)" type="hidden" class="form-control flatpickr-input" placeholder="YYYY/MM/DD" id="flatpickr-date1">
                                                </div>
                                                <div class="col-md-6 col-12 mb-4">
                                                    <label for="flatpickr-date" class="form-label">انتخاب‌گر تاریخ</label>
                                                    <input onchange="GetDate(this)" type="hidden" class="form-control flatpickr-input" placeholder="YYYY/MM/DD" id="flatpickr-date2">
                                                </div>


                                                <div>
                                                    <input class="form-control input" type="text" runat="server" id="txtdatestart" />

                                                </div>
                                                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                                                
                                                <script>
                                                    function cbtn() {
                                                        document.getElementById("Main_btn").click();
                                                    }
                                                </script>

                                                <input type="text" onchange="cbtn()" value="" />






                                                <%-- Modal --%>
                                                <button type="button" id="btn" hidden="hidden" runat="server" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Open modal for @getbootstrap</button>

                                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <form>
                                                                <div class="modal-header" style="background-color: green;">
                                                                    <h5 class="modal-title" id="exampleModalLabel" style="color: white">ثبت کد کاربر</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="mb-3">
                                                                        <label for="code" class="col-form-label">کد کاربر:</label>
                                                                        <input type="text" class="form-control" id="code" runat="server" />
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">بستن</button>
                                                                    <asp:Button ID="btnM_Enter" CssClass="btn" style="background-color: green;color: white" OnClick="btnM_Enter_OnClick" runat="server" Text="ثبت" />
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%-- EndModal --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Flatpickr -->



                                
                                <style>
            .pagination li:hover {
                cursor: pointer;
            }

            .rwd-table {
                min-width: 300px;
                width: 100%;
                border-collapse: collapse;
            }

                .rwd-table tr:first-child {
                    border-top: none;
                }

                .rwd-table tr {
                    border-top: 1px solid #ddd;
                    border-bottom: 1px solid #ddd;
                    background-color: #f5f9fc;
                }

                    .rwd-table tr:nth-child(odd):not(:first-child) {
                        background-color: #ebf3f9;
                    }

                .rwd-table th {
                    display: none;
                }

                .rwd-table td {
                    display: block;
                }

                    .rwd-table td:first-child {
                        margin-top: .5em;
                    }

                    .rwd-table td:last-child {
                        margin-bottom: .5em;
                    }

                    .rwd-table td:before {
                        content: attr(data-th) ": ";
                        font-weight: bold;
                        display: inline-block;
                        color: #000;
                    }

                .rwd-table th,
                .rwd-table td {
                    text-align: right;
                    border: #1b00ff solid 1px;
                }

                .rwd-table th {
                    background: #428bca;
                }

            .rwd-table {
                color: #333;
                border-radius: .4em;
                overflow: hidden;
            }

                .rwd-table tr {
                    border-color: #bfbfbf;
                }

                .rwd-table th,
                .rwd-table td {
                    padding: .5em 1em;
                }

            @media screen and (max-width: 601px) {
                .rwd-table tr:nth-child(2) {
                    border-top: none;
                }
            }

            @media screen and (min-width: 600px) {
                .rwd-table tr:hover:not(:first-child) {
                    background-color: #d8e7f3;
                }

                .rwd-table td:before {
                    display: none;
                }

                .rwd-table th,
                .rwd-table td {
                    display: table-cell;
                }

                    .rwd-table th:first-child,
                    .rwd-table td:first-child {
                        padding-left: 0;
                    }

                    .rwd-table th:last-child,
                    .rwd-table td:last-child {
                        padding-right: 0;
                    }

                .rwd-table th,
                .rwd-table td {
                    padding: 1em !important;
                }
            }
        </style>
                                <div class="card">

                                <table class="table table-hover table-xl mb-0 rwd-table" id="recent-orders">
                                        <thead>
                                            <tr>
                                                <th class="border-top-0">کد عضویت</th>
                                                <th class="border-top-0">نام و نام خانوادگی</th>
                                                <th class="border-top-0">کدملی</th>
                                                <th class="border-top-0">تاریخ ثبت نام</th>
                                                <th class="border-top-0">تاریخ اعتبار</th>
                                                <th class="border-top-0">تلفن همراه</th>
                                                <th class="border-top-0">تصویر</th>
                                                <th class="border-top-0">عملیات</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- 2015.2.623.40 -->
                                                    <tr>
                                                        <td data-th="کد عضویت" class="text-truncate">C.C1</td>
                                                        <td data-th="نام ونام خانوادگی" class="text-truncate"><a href="MemberView.aspx?ID=9" target="_blank">شماره 4+1</a></td>
                                                        <td data-th="کد ملی" class="text-truncate">4433406856</td>
                                                        <td data-th="تاریخ ثبت نام" class="text-truncate">1401/02/18</td>
                                                        <td data-th="تاریخ اعتبار" class="text-truncate">1401/02/17</td>
                                                        <td data-th="تلفن همراه" class="text-truncate">09101517158</td>
                                                        
                                                    </tr>
                                                <input id="ctl00_ContentPlaceHolder1_RgwShow_ClientState" name="ctl00_ContentPlaceHolder1_RgwShow_ClientState" type="hidden" autocomplete="off">

                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                        <!--/ Content -->

                        <!-- Footer -->

                        <!-- / Footer -->

                        <div class="content-backdrop fade"></div>
                    </div>
                    <!--/ Content wrapper -->
                </div>

                <!--/ Layout container -->
            </div>
        </div>

        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>

        <!-- Drag Target Area To SlideIn Menu On Small Screens -->
        <div class="drag-target"></div>

        <!--/ Layout wrapper -->

        <!-- Core JS -->
        <!-- build:js assets/vendor/js/core.js -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

