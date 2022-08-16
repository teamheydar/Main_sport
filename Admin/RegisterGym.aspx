<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Panel.master" AutoEventWireup="true" CodeFile="RegisterGym.aspx.cs" Inherits="Admin_RegisterGym" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    افزودن باشگاه
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
                                window.location.href = "RegisterGym.aspx";
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
                                window.location.href = "RegisterGym.aspx";
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
        function Active(id) {
            swal({
                title: "از فعال کردن این باشگاه اطمینان دارید؟",
                text: "",
                icon: "info",
                buttons: {
                    confirm: 'بله',
                    cancel: 'خیر'
                },
                dangerMode: true
            })
                .then(function (willDelete) {
                    if (willDelete) {
                        PageMethods._Active(id, onSucess);
                        function onSucess(result) {
                            if (result == 1) {
                                window.location.href = "RegisterGym.aspx";
                            } else {
                                swal("خطا در دسترسی به اطلاعات فعال سازی انجام نشد", {
                                    icon: "error",
                                    button: "باشه"
                                });
                            }
                        }


                    }
                });
        }
        function NotActive(id) {
            swal({
                title: "از غیر فعال کردن این باشگاه اطمینان دارید؟",
                text: "",
                icon: "info",
                buttons: {
                    confirm: 'بله',
                    cancel: 'خیر'
                },
                dangerMode: true
            })
                .then(function (willDelete) {
                    if (willDelete) {
                        PageMethods._NotActive(id, onSucess);
                        function onSucess(result) {
                            if (result == 1) {
                                window.location.href = "RegisterGym.aspx";
                            } else {
                                swal("خطا در دسترسی به اطلاعات غیر فعال سازی انجام نشد", {
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
            document.getElementById("Main_DateBirth").value = val;
        }
        function GetDate1(d) {
            var val = d.value.replace("-", "/").replace("-", "/");
            document.getElementById("Main_DateE").value = val;
        }
    </script>

    <script src="../assets/tost/jquerymin.js"></script>
    <script src="../assets/tost/latest_toastr.js"></script>
    <link href="../assets/tost/toastr.css" rel="stylesheet" />
    <script src="../assets/tost/sweetalert.min.js"></script>

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 breadcrumb-wrapper mb-4">افزودن باشگاه
        </h4>

        <div class="row">

            <div class="col-md-12">
                <div class="card mb-4">
                    <h5 class="card-header">افزودن باشگاه</h5>
                    <div class="card-body row">

                        <div class="divider divider-primary">
                            <div class="divider-text">اطلاعات باشگاه</div>
                        </div>

                        <div class="col-md-3">
                            <label for="Code" class="form-label">کد:</label>
                            <input type="text" class="form-control" required="required" id="Code" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-3">
                            <label for="NameGym" class="form-label">نام:</label>
                            <input type="text" class="form-control" required="required" id="NameGym" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-3">
                            <label for="NPhoneGym" class="form-label">شماره ثابت باشگاه:</label>
                            <input type="text" class="form-control" required="required" id="NPhoneGym" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-3">
                            <label for="AddressGym" class="form-label">آدرس:</label>
                            <input type="text" class="form-control" required="required" id="AddressGym" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-12">
                            <label for="DescriptionGym" class="form-label">توضیحات:</label>
                            <input type="text" class="form-control" id="DescriptionGym" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>

                        <div class="divider divider-danger">
                            <div class="divider-text">اطلاعات مدیریت باشگاه</div>
                        </div>

                        <div class="col-md-3">
                            <label for="Name" class="form-label">نام کامل:</label>
                            <input type="text" class="form-control" required="required" id="Name" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-3">
                            <label for="UserName" class="form-label">نام کاربری:</label>
                            <input type="text" class="form-control" required="required" id="UserName" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-3">
                            <label for="Password" class="form-label">پسورد:</label>
                            <input type="text" class="form-control" required="required" id="Password" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-3">
                            <label for="Codey" class="form-label">کد ملی:</label>
                            <input type="text" class="form-control" required="required" id="Codey" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-3">
                            <label for="flatpickr-date" class="form-label">تاریخ تولد:</label>
                            <input onchange="GetDate(this)" type="text" class="form-control flatpickr-input" placeholder="YYYY/MM/DD" id="flatpickr-date" name="flatpickr-date">
                        </div>
                        <input hidden="hidden" type="text" id="DateBirth" runat="server" />
                        <div class="col-md-3">
                            <label for="NPhone" class="form-label">شماره تلفن همراه:</label>
                            <input type="text" class="form-control" required="required" id="NPhone" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-3">
                            <label for="NHome" class="form-label">شماره تلفن ثابت:</label>
                            <input type="text" class="form-control" required="required" id="NHome" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-3">
                            <label for="Gender" class="form-label">جنسیت:</label>
                            <div class="position-relative">
                                <select id="Gender" required="required" runat="server" class="select2 form-select select2-hidden-accessible" data-select2-id="country" tabindex="-1" aria-hidden="true">
                                    <option selected="selected">انتخاب</option>
                                    <option value="0">مرد</option>
                                    <option value="1">زن</option>
                                </select><span class="select2 select2-container select2-container--default" dir="rtl" data-select2-id="1" style="width: 655px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-country-container"><span class="select2-selection__rendered" id="select2-country-container" role="textbox" aria-readonly="true" title="انتخاب"></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label for="Marital" class="form-label">وضعیت تاهل:</label>
                            <div class="position-relative">
                                <select id="Marital" runat="server" class="select2 form-select select2-hidden-accessible" data-select2-id="country" tabindex="-1" aria-hidden="true">
                                    <option value="-1" selected="selected">انتخاب</option>
                                    <option value="0">مجرد</option>
                                    <option value="1">متاهل</option>
                                </select><span class="select2 select2-container select2-container--default" dir="rtl" data-select2-id="1" style="width: 655px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-country-container"><span class="select2-selection__rendered" id="select2-country-container" role="textbox" aria-readonly="true" title="انتخاب"></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label for="flatpickr-date" class="form-label">تاریخ اعتبار:</label>
                            <input onchange="GetDate1(this)" type="text" class="form-control flatpickr-input" placeholder="YYYY/MM/DD" id="flatpickr-date1" name="flatpickr-date">
                        </div>
                        <input hidden="hidden" type="text" id="DateE" runat="server" />
                        <div class="col-md-6 mb-4">
                            <label for="Address" class="form-label">آدرس:</label>
                            <input type="text" class="form-control" required="required" id="Address" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>

                        <div>
                            <asp:Button CssClass="btn btn-primary" ID="Insert" runat="server" OnClick="Insert_OnClick" Text="ثبت" />
                            <asp:Button type="button" CssClass="btn btn-danger" ID="btn_Cansel" OnClick="btn_Cansel_OnClick" runat="server" Text="انصراف" />
                        </div>

                    </div>
                </div>

                <div class="col-md-12">
                    <div class="card mb-4">
                        <h5 class="card-header">لیست‌</h5>
                        <div class="card-body row">

                            <% if (!ListAdmin.Any())
                                {%>
                            <p style="text-align: center">رکوردی یافت نشد</p>
                            <% }
                                else
                                {%>


                            <table style="text-align: center" class="table table-bordered table-hover rwd-table">
                                <thead>
                                    <tr>
                                        <th>کد</th>
                                        <th>کد ملی</th>
                                        <th>نام کامل</th>
                                        <th>نام باشگاه</th>
                                        <th>عملیات</th>
                                    </tr>
                                </thead>
                                <tbody class="table-border-bottom-0 ">
                                    <% foreach (var item in ListAdmin)
                                        {%>

                                    <tr>
                                        <td data-th="کد">
                                                <%Response.Write(item.Code); %>
                                        </td>
                                        <td data-th="کد ملی">
                                                <%Response.Write(item.Codey); %>
                                        </td>
                                        <td data-th="نام کامل">
                                                <%Response.Write(item.FullName); %>
                                        </td>
                                        <td data-th="نام باشگاه">
                                                <%Response.Write(item.FullNameGym); %>
                                        </td>
                                        <td data-th="عملیات">
                                            <a onclick='<%Response.Write("SEdit(" + item.ID + ")");%>' class="text-white btn btn-warning">ویرایش</a>
                                            <%--<a onclick='<%Response.Write("SDelete(" + item.ID + ")");%>' class="text-white btn btn-danger">حذف</a>--%>
                                            <% if (item.Active == 0)
                                                {%>
                                            <a onclick='<%Response.Write("NotActive(" + item.ID + ")");%>' class="btn btn-danger text-white">غیر فعال</a>
                                            <%}
                                                else if (item.Active == 1)
                                                {%>
                                            <a onclick='<%Response.Write("Active(" + item.ID + ")");%>' class="btn btn-primary text-white ">فعال</a>
                                            <%}%>
                                            <a href="View/ViewAdmin.aspx?id=<% Response.Write(item.ID); %>" class="text-white btn btn-info">نمایش</a>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>

                            <%} %>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

