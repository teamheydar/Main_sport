<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Panel.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="CostType.aspx.cs" Inherits="Admin_CostType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    نوع هزینه
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
                                window.location.href = "CostType.aspx";
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
                                window.location.href = "CostType.aspx";
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
        <h4 class="py-3 breadcrumb-wrapper mb-4">نوع هزینه
        </h4>

        <div class="row">
            <div class="col-xl">
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">افزودن نوع هزینه</h5>
                    </div>
                    <div class="card-body">
                        <div class="row" data-select2-id="12">

                            <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                <label for="txt_Type" class="form-label">کد :</label>
                                <input class="form-control " type="text" required="required" id="txt_Code" runat="server" autofocus="" />
                                <div class="fv-plugins-message-container invalid-feedback"></div>
                            </div>
                            <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                <label for="txt_Type" class="form-label">نام هزینه:</label>
                                <input class="form-control " type="text" required="required" id="txt_Type" runat="server" autofocus="" placeholder="نام هزینه" />
                                <div class="fv-plugins-message-container invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="mt-2">
                            <asp:LinkButton ID="btn_submit" runat="server" OnClick="btn_submit_OnClick" CssClass="btn btn-primary me-2" Text="ثبت" />
                            <asp:LinkButton CssClass="btn btn-danger" ID="btn_Cansel" OnClick="btn_Cansel_OnClick" runat="server" Text="انصراف" />
                        </div>
                        <div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xl">
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">لیست</h5>
                    </div>
                    <% if (CostList.Any())
                        {%>
                    <table style="text-align: center" class="table table-bordered table-hover rwd-table">
                        <thead>
                            <tr>
                                <th>کد رشته</th>
                                <th>نام رشته</th>
                                <th>عملیات</th>
                            </tr>
                        </thead>
                        <tbody class="table-border-bottom-0 ">
                            <% foreach (var item in CostList)
                                {%>

                            <tr>
                                <td data-th="کد رشته">
                                    <%Response.Write(item.Code); %>
                                </td>
                                <td data-th="نام رشته">
                                    <%Response.Write(item.Type); %>
                                </td>
                                <td data-th="عملیات">
                                    <a onclick='<%Response.Write("SEdit(" + item.ID + ")");%>' class="text-white btn btn-warning">ویرایش</a>
                                    <a onclick='<%Response.Write("SDelete(" + item.ID + ")");%>' class="text-white btn btn-danger">حذف</a>
                            </tr>
                            <% } %>
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

