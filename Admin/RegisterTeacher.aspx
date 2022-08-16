<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Panel.master" AutoEventWireup="true" CodeFile="RegisterTeacher.aspx.cs" EnableEventValidation="false" Inherits="Admin_RegisterTeacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    افزودن مربی
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">
    <%-- Script --%>
    <script>
        function SDelete(id) {
            swal({
                title: "آیا از حذف اطمینان دارید؟",
                text: "پس از حذف قادر به بازیابی این اطلاعات نخواهید بود!",
                icon: "warning",
                buttons: {
                    confirm: 'بله',
                    cancel: 'خیر'
                },
                dangerMode: true
            })
                .then(function (willDelete) {
                    if (willDelete) {
                        PageMethods.btn_Delete(id, onSucess);

                        function onSucess(result) {
                            if (result == 1) {
                                window.location.href = "RegisterTeacher.aspx";
                            } else {
                                swal("خطا در دسترسی به اطلاعات حذف انجام نشد", {
                                    icon: "error",
                                    button: "باشه"
                                });
                            }
                        }


                    }
                });
        }
        function SEdit(id) {
            swal({
                title: "آیا از ویرایش اطمینان دارید؟",
                text: "پس از ویرایش قادر به بازیابی این اطلاعات نخواهید بود!",
                icon: "info",
                buttons: {
                    confirm: 'بله',
                    cancel: 'خیر'
                },
                dangerMode: true
            })
                .then(function (willDelete) {
                    if (willDelete) {
                        PageMethods.btn_Edit(id, onSucess);

                        function onSucess(result) {
                            if (result == 1) {
                                window.location.href = "RegisterTeacher.aspx";
                            } else {
                                swal("خطا در دسترسی به اطلاعات ویرایش انجام نشد", {
                                    icon: "error",
                                    button: "باشه"
                                });
                            }
                        }


                    }
                });
        }
        function GetDate(d) {
            var val = d.value.replace("-", "/").replace("-", "/");
            document.getElementById("Main_txtDateBirth").value = val;
        }
        function GetDate2(d) {
            var val = d.value.replace("-", "/").replace("-", "/");
            document.getElementById("Main_txtDateEInsurance").value = val;
        }
    </script>

    <script src="../assets/tost/jquerymin.js"></script>
    <script src="../assets/tost/latest_toastr.js"></script>
    <link href="../assets/tost/toastr.css" rel="stylesheet" />
    <script src="../assets/tost/sweetalert.min.js"></script>

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 breadcrumb-wrapper mb-4">مربیان
        </h4>

        <div class="row">
            <div class="col-xl">
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">افزودن مربی</h5>
                        <small class="text-muted float-end">برای اضافه کردن مربی لیست را کامل کنید!</small>
                    </div>
                    <div class="card-body">
                        <form class="fv-plugins-bootstrap5 fv-plugins-framework" novalidate="novalidate" data-select2-id="formAccountSettings">
                            <div class="row" data-select2-id="12">

                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtCode" class="form-label">کد:</label>
                                    <input class="form-control " type="text" required="required" id="txtCode" runat="server" autofocus="" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtFullName" class="form-label">نام کامل:</label>
                                    <input class="form-control " type="text" required="required" id="txtFullName" runat="server" autofocus="" placeholder="نام و نام خوانوادگی" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtctCody" class="form-label">کد ملی:</label>
                                    <input class="form-control" type="text" required="required" id="txtctCody" runat="server" autofocus="" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <%--<div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="firstName" class="form-label"> رمز عبور:</label>
                                    <div class="input-group input-group-merge">
                                        <input class="form-control" type="password" id="firstName" autofocus="">
                                        <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                                    </div>
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>--%>
                                <div class="col-md-6 col-12 mb-4">
                                    <label for="flatpickr-date" class="form-label">تاریخ تولد:</label>
                                    <input onchange="GetDate(this)" type="text" class="form-control flatpickr-input" placeholder="YYYY/MM/DD" id="flatpickr-date" name="flatpickr-date">
                                </div>
                                <input hidden="hidden" type="text" id="txtDateBirth" runat="server" />
                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtNumberPhone" class="form-label">شماره تلفن همراه:</label>
                                    <input class="form-control" type="text" required="required" id="txtNumberPhone" runat="server" autofocus="" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtNumberHome" class="form-label">شماره تلفن ثابت:</label>
                                    <input class="form-control" type="text" required="required" id="txtNumberHome" runat="server" placeholder="شماره تلفن منزل" autofocus="" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label class="form-label" for="slcGender">جنسیت:</label>
                                    <div class="position-relative">
                                        <select id="slcGender" runat="server" class="select2 form-select select2-hidden-accessible" data-select2-id="country" tabindex="-1" aria-hidden="true">
                                            <option value="-1" data-select2-id="2">انتخاب</option>
                                            <option value="0" data-select2-id="2">مرد</option>
                                            <option value="1" data-select2-id="2">زن</option>
                                        </select><span class="select2 select2-container select2-container--default" dir="rtl" data-select2-id="1" style="width: 655px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-country-container"><span class="select2-selection__rendered" id="select2-country-container" role="textbox" aria-readonly="true" title="انتخاب"></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                    </div>
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label class="form-label" for="slcMarital">وضعیت تاهل:</label>
                                    <div class="position-relative">
                                        <select id="slcMarital" runat="server" class="select2 form-select select2-hidden-accessible" data-select2-id="country" tabindex="-1" aria-hidden="true">
                                            <option value="-1" data-select2-id="2">انتخاب</option>
                                            <option value="0" data-select2-id="2">مجرد</option>
                                            <option value="1" data-select2-id="2">متاهل</option>
                                        </select><span class="select2 select2-container select2-container--default" dir="rtl" data-select2-id="1" style="width: 655px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-country-container"><span class="select2-selection__rendered" id="select2-country-container" role="textbox" aria-readonly="true" title="انتخاب"></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                    </div>
                                </div>
                                
                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtNumberInsurance" class="form-label">شماره بیمه:</label>
                                    <input class="form-control" type="text" required="required" id="txtNumberInsurance" runat="server" autofocus="" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtDateEInsurance" class="form-label">تاریخ اعتبار بیمه:</label>
                                    <input onchange="GetDate2(this)" type="text" class="form-control flatpickr-input" placeholder="YYYY/MM/DD" id="flatpickr-date1" name="flatpickr-date">
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <input hidden="hidden" type="text" id="txtDateEInsurance" runat="server" />
                                <div class="mb-3 col-12 fv-plugins-icon-container">
                                    <label for="txtDescription" class="form-label">توضیحات:</label>
                                    <input class="form-control" type="text" required="required" id="txtDescription" runat="server" autofocus="" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <div class="mb-3  fv-plugins-icon-container">
                                    <label for="txtAddress" class="form-label">آدرس:</label>
                                    <input class="form-control" type="text" required="required" id="txtAddress" runat="server" autofocus="" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>


                            </div>
                            <div class="mt-2">
                                <asp:Button type="button" CssClass="btn btn-primary me-2" ID="btn_submit" runat="server" OnClick="btn_submit_OnClick" Text="ذخیره تغیرات" />
                                <asp:Button type="button" CssClass="btn btn-danger" ID="btn_Cansel" OnClick="btn_Cansel_OnClick" runat="server" Text="انصراف" />
                            </div>
                            <div></div>
                            <input type="hidden">
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xl">
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">لیست</h5>
                        <small class="text-muted float-end">مربیان ثبت نام شده</small>
                    </div>
                    <% if (DataTeacher.Any())
                        {%>
                    <table style="text-align: center" class="table table-bordered table-hover rwd-table">
                        <thead>
                            <tr>
                                <th>کد</th>
                                <th>نام و نام خانوادگی</th>
                                <th>کدملی</th>
                                <th>تاریخ ثبت نام</th>
                                <th>تلفن همراه</th>
                                <th>عملیات</th>
                            </tr>
                        </thead>
                        <tbody class="table-border-bottom-0 ">
                            <% foreach (var item in DataTeacher)
                                {%>


                            <tr >
                                <td data-th="کد">
                                        <%Response.Write(item.Code); %>
                                </td>
                                <td data-th="نام و نام خوانوادگی">
                                        <%Response.Write(item.FullName); %>
                                </td>
                                <td data-th="کد ملی">
                                        <%Response.Write(item.Codey); %>
                                </td>
                                <td data-th="تاریخ ثبت نام">
                                        <%Response.Write(item.R_Date); %>
                                </td>
                                
                                <td data-th="تلفن همراه">
                                        <%Response.Write(item.N_Phone); %>
                                </td>
                                <td data-th="عملیات">
                                    <a onclick='<%Response.Write("SEdit(" + item.ID + ")");%>' class="text-white btn btn-warning">ویرایش</a>
                                    <a onclick='<%Response.Write("SDelete(" + item.ID + ")");%>' class="text-white btn btn-danger">حذف</a>
                                    <a href="View/ViewTeacher.aspx?id=<% Response.Write(item.ID); %>" class="text-white btn btn-info">نمایش</a>
                                </td>
                                <% } %>
                            </tr>
                        </tbody>
                    </table>
                    <%}
                        else
                        {%>
                    <p style="text-align: center">رکوردی یافت نشد</p>
                    <%} %>
                    
                </div>
            </div>
        </div>

    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

