<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Panel.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Timex.aspx.cs" Inherits="Admin_Timex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    ورود و خروج کاربران
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
                                window.location.href = "Timex.aspx";
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
                                window.location.href = "Timex.aspx";
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
    </script>
    <script>
        function GetDate(d) {
            var val = d.value.replace("-", "/").replace("-", "/");
            document.getElementById("Main_txtDate").value = val;
        }
        function GetTimeLogin(d) {
            var val = d.value;
            document.getElementById("Main_TimeLogin").value = val;
        }
        function GetTimeOut(d) {
            var val = d.value;
            document.getElementById("Main_TimeOut").value = val;
        }

        function SetDate(d) {
            
        }
    </script>

    <script src="../assets/tost/jquerymin.js"></script>
    <script src="../assets/tost/latest_toastr.js"></script>
    <link href="../assets/tost/toastr.css" rel="stylesheet" />
    <script src="../assets/tost/sweetalert.min.js"></script>


    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 breadcrumb-wrapper mb-4">ورود و خروج
        </h4>

        <div class="row">
            <div class="col-xl">
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">ورود خروج کاربران</h5>
                        <small class="text-muted float-end">برای ثبت ورود و خروج کاربران لیست را تکمیل کنید!</small>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="row">
                                <div class="mb-3 col-md-6">
                                    <label class="form-label" for="basic-default-fullname">کد ملی:</label>
                                    <input type="text" class="form-control" required="required" runat="server" id="txtCody" />
                                </div>
                                <div class="col-md-6 col-12 mb-4">
                                    <label for="flatpickr-date" class="form-label">تاریخ:</label>
                                    <input onchange="GetDate(this)" type="text" class="form-control flatpickr-input" placeholder="YYYY/MM/DD" id="flatpickr-date" name="flatpickr-date">
                                </div>
                                <input hidden="hidden" type="text" id="txtDate" runat="server" />
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-12 mb-4">
                                    <label for="flatpickr-time" class="form-label">ساعت ورود:</label>
                                    <input type="text" onchange="GetTimeLogin(this)" class="form-control" placeholder="HH:MM" id="flatpickr-time">
                                </div>
                                <div class="col-md-6 col-12 mb-4">
                                    <label for="flatpickr-time" class="form-label">ساعت خروج:</label>
                                    <input type="text" class="form-control" onchange="GetTimeOut(this)" placeholder="HH:MM" id="flatpickr-time1">
                                </div>
                                <input hidden="hidden" type="text" id="TimeLogin" runat="server" />
                                <input hidden="hidden" type="text" id="TimeOut" runat="server" />
                            </div>
                            <asp:Button ID="btnOK" runat="server" OnClick="btnOK_OnClick" type="submit" Text="ثبت" class="btn btn-primary" />
                            <asp:LinkButton CssClass="btn btn-danger" ID="btn_Cansel" OnClick="btn_Cansel_OnClick" runat="server" Text="انصراف" />
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
                        <small class="text-muted float-end">لیست ورود و خروج کاربران!</small>
                    </div>
                    <% if (TimeUser.Any())
                        {%>
                    <table class="table table-bordered table-hover rwd-table">
                        <thead>
                            <tr>
                                <th>کد ملی</th>
                                <th>تاریخ</th>
                                <th>روز هفته</th>
                                <th>ساعت ورود</th>
                                <th>ساعت خروج</th>
                                <th>عملیات</th>
                            </tr>
                        </thead>
                        <tbody class="table-border-bottom-0 ">
                            <% foreach (var item in TimeUser)
                                {%>
                            <tr style="text-align: center">
                                <td data-th="کد ملی"><% Response.Write(item.UserCodey); %></td>
                                <td data-th="تاریخ"><% Response.Write(item.Date); %></td>
                                <td data-th="روز هفته"><% Response.Write(item.DateWek); %></td>
                                <td data-th="ساعت ورود"><% Response.Write(item.TimeLogin); %></td>
                                <td data-th="ساعت خروج"><% Response.Write(item.TimeOut); %></td>
                                <td data-th="عملیات">
                                    <a onclick='<%Response.Write("SEdit(" + item.ID + ")");%>' class="text-white btn btn-warning">ویرایش</a>
                                    <a onclick='<%Response.Write("SDelete(" + item.ID + ")");%>' class="text-white btn btn-danger">حذف</a>
                                </td>
                            </tr>

                            <% } %>
                        </tbody>
                    </table>
                    <% }
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

