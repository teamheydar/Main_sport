<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Panel.master" AutoEventWireup="true" CodeFile="RegisterUser.aspx.cs" EnableEventValidation="false" Inherits="Admin_RegisterUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    افزودن کاربران
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
                                window.location.href = "RegisterUser.aspx";
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
                                window.location.href = "RegisterUser.aspx";
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

    <script src="../assets/tost/jquerymin.js"></script>
    <script src="../assets/tost/latest_toastr.js"></script>
    <link href="../assets/tost/toastr.css" rel="stylesheet" />
    <script src="../assets/tost/sweetalert.min.js"></script>

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 breadcrumb-wrapper mb-4">کاربران
        </h4>

        <div class="row">
            <div class="col-xl">
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">افزودن کاربر</h5>
                        <small class="text-muted float-end">برای اضافه کردن کاربر لیست را تکمیل کنید!</small>
                    </div>
                    <div class="card-body">
                            <div class="row">
                                <div class="mb-3 col-md-3">
                                    <label class="form-label" for="txt_Code">کد</label>
                                    <input type="text" class="form-control" required="required" runat="server" id="txt_Code" />
                                </div>
                                <div class="mb-3 col-md-3">
                                    <label class="form-label" for="txt_FullName">نام کامل:</label>
                                    <input type="text" class="form-control" required="required" runat="server" id="txt_FullName" />
                                </div>
                                <div class="mb-3 col-md-3">
                                    <label class="form-label" for="txt_Codey">کد ملی:</label>
                                    <input type="text" class="form-control" required="required" runat="server" id="txt_Codey" />
                                </div>
                                <div class="mb-3 col-md-3">
                                    <label class="form-label" for="txt_Phone">شماره تلفن:</label>
                                    <input type="text" class="form-control" required="required" runat="server" id="txt_Phone" />
                                </div>
                            </div>
                            <asp:Button ID="btnOK" runat="server" type="submit" Text="ثبت" OnClick="btnOK_OnClick" class="btn btn-primary" />
                            <asp:LinkButton CssClass="btn btn-danger" ID="btn_Cansel" OnClick="btn_Cansel_OnClick" runat="server" Text="انصراف" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xl">
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">لیست</h5>
                        <small class="text-muted float-end">لیست کاربران!</small>
                    </div>
                    <% if (UserData.Any())
                       {%>
                        <table style="text-align: center" class="table table-bordered table-hover rwd-table">
                            <thead>
                            <tr>
                                <th>کد</th>
                                <th>نام و نام خانوادگی</th>
                                <th>کد ملی</th>
                                <th>تاریخ ثبت نام</th>
                                <th>تلفن همراه</th>
                                <th>عملیات</th>
                            </tr>
                            </thead>
                            <tbody class="table-border-bottom-0 ">
                            <% foreach (var item in UserData)
                               {%>
                                <tr>
                                    <td data-th="کد"><%Response.Write(item.Code); %></td>
                                    <td data-th="نام و نام خوانوادگی"><%Response.Write(item.FullName); %></td>
                                    <td data-th="کد ملی"><%Response.Write(item.Codey); %></td>
                                    <td data-th="تاریخ ثبت نام"><%Response.Write(item.R_Date); %></td>
                                    <td data-th="تلفن همراه"><%Response.Write(item.N_Phone); %></td>
                                    <td >
                                        <a class="btn btn-info" href="View/ViewUser.aspx?id=<%Response.Write(item.ID); %>">نمایش</a> 
                                        <a onclick='<%Response.Write("SEdit(" + item.ID + ")");%>' class="text-white btn btn-warning">ویرایش</a>
                                        <a onclick='<%Response.Write("SDelete(" + item.ID + ")");%>' class="text-white btn btn-danger">حذف</a>
                                    </td>
                                </tr>
                            <%} %>
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

