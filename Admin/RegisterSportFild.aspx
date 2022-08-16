<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Panel.master" AutoEventWireup="true" CodeFile="RegisterSportFild.aspx.cs" EnableEventValidation="false" Inherits="Admin_RegisterSportFild" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    افزودن رشته ورزشی
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
                                window.location.href = "RegisterSportFild.aspx";
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
                                window.location.href = "RegisterSportFild.aspx";
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
        <h4 class="py-3 breadcrumb-wrapper mb-4">رشته ورزشی
        </h4>

        <div class="row">
            <div class="col-xl">
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">

                        <h5 class="mb-0">افزودن رشته</h5>
                        <small class="text-muted float-end">برای اضافه کردن رشته لیست را کامل کنید!</small>

                    </div>
                    <div class="card-body">
                        <form class="fv-plugins-bootstrap5 fv-plugins-framework" novalidate="novalidate" data-select2-id="formAccountSettings">
                            <div class="row" data-select2-id="12">
                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtFullName" class="form-label">کد :</label>
                                    <input class="form-control " type="text" required="required" id="txtCode" runat="server" autofocus=""  />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtFullName" class="form-label">نام رشته:</label>
                                    <input class="form-control " type="text" required="required" id="txtFullName" runat="server" autofocus="" placeholder="نام رشته" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                            </div>
                            <div class="mt-2">
                                <asp:Button type="button" CssClass="btn btn-primary me-2" ID="btn_submit" runat="server" OnClick="btn_submit_Click" Text="ذخیره تغیرات" />
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
                        <small class="text-muted float-end">رشته های ثبت نام شده</small>
                    </div>

                    <table class="table table-bordered table-hover rwd-table">
                        <thead>
                            <tr>
                                <th>کد رشته</th>
                                <th>نام رشته</th>
                                <th>عملیات</th>
                            </tr>
                        </thead>
                        <tbody class="table-border-bottom-0 ">
                            <% foreach (var item in sportFild)
                                {%>


                            <tr style="text-align: center">
                                <td data-th="کد رشته">
                                        <%Response.Write(item.Code); %>
                                </td>
                                <td data-th="نام رشته">
                                        <%Response.Write(item.Name); %>
                                </td>
                                <td data-th="عملیات">
                                    <a onclick='<%Response.Write("SEdit(" + item.ID + ")");%>' class="text-white btn btn-warning">ویرایش</a>
                                    <a onclick='<%Response.Write("SDelete(" + item.ID + ")");%>' class="text-white btn btn-danger">حذف</a>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

