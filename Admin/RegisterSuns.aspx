<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Panel.master" AutoEventWireup="true" CodeFile="RegisterSuns.aspx.cs" EnableEventValidation="false" Inherits="Admin_RegisterSuns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    افزودن سانس
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
                                window.location.href = "RegisterSuns.aspx";
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
                                window.location.href = "RegisterSuns.aspx";
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
                title: "از فعال کردن این سانس اطمینان دارید؟",
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
                                window.location.href = "RegisterSuns.aspx";
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
                title: "از غیر فعال کردن این سانس اطمینان دارید؟",
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
                                window.location.href = "RegisterSuns.aspx";
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
            document.getElementById("Main_D_start").value = val;
        }
        function GetDate1(d) {
            var val = d.value.replace("-", "/").replace("-", "/");
            document.getElementById("Main_D_End").value = val;
        }

        function ShowModal() {
            document.getElementById("Select_teacher").click();
        }
    </script>

    <script src="../assets/tost/jquerymin.js"></script>
    <script src="../assets/tost/latest_toastr.js"></script>
    <link href="../assets/tost/toastr.css" rel="stylesheet" />
    <script src="../assets/tost/sweetalert.min.js"></script>


    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 breadcrumb-wrapper mb-4">سانس ها
        </h4>

        <div class="row">
            <div class="col-xl">
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">افزودن سانس</h5>
                        <small class="text-muted float-end">برای اضافه کردن سانس لیست را تکمیل کنید!</small>
                    </div>
                    <div class="card-body">
                        <div class="row">

                            <div class="mb-3 col-md-4">
                                <label class="form-label" for="txt_code">کد:</label>
                                <input type="text" class="form-control" required="required" id="txt_code" runat="server" />
                            </div>
                            <div class="mb-3 col-md-4">
                                <label class="form-label" for="txt_name">نام سانس:</label>
                                <input type="text" class="form-control" required="required" id="txt_name" runat="server" />
                            </div>
                            <div class="mb-3 col-md-4">
                                <label class="form-label" for="Selector_SportFild">رشته ورزشی:</label>
                                <select id="Selector_SportFild" runat="server" class="select2 form-select select2-hidden-accessible" data-select2-id="country" tabindex="-1" aria-hidden="true">
                                </select>
                            </div>
                            <div class="mb-3 col-md-4">
                                <label class="form-label" for="Selector_Teacher">مربی:</label>
                                <select id="Selector_Teacher" runat="server" class="select2 form-select select2-hidden-accessible" data-select2-id="country" tabindex="-1" aria-hidden="true">
                                </select>
                            </div>
                            <div class="mb-3 col-md-4">
                                <label class="form-label" for="Gender">جنسیت:</label>
                                <select id="Gender" runat="server" class="select2 form-select select2-hidden-accessible" data-select2-id="country" tabindex="-1" aria-hidden="true">
                                    <option value="-1">انتخاب</option>
                                    <option value="0">مرد</option>
                                    <option value="1">زن</option>
                                </select>
                            </div>
                            <div class="mb-3 col-md-4">
                                <label for="flatpickr-date" class="form-label">تاریخ شروع:</label>
                                <input onchange="GetDate(this)" type="text" class="form-control flatpickr-input" placeholder="YYYY/MM/DD" id="flatpickr-date" name="flatpickr-date">
                            </div>
                            <input hidden="hidden" type="text" id="D_start" runat="server" />
                            <div class="mb-3 col-md-4">
                                <label for="flatpickr-date" class="form-label">تاریخ پایان:</label>
                                <input onchange="GetDate1(this)" type="text" class="form-control flatpickr-input" placeholder="YYYY/MM/DD" id="flatpickr-date1" name="flatpickr-date">
                            </div>
                            <input hidden="hidden" type="text" id="D_End" runat="server" />
                            <div class="mb-3 col-md-4">
                                <label class="form-label" for="basic-default-fullname">هزینه:</label>
                                <input type="text" class="form-control" required="required" id="txt_Mony" runat="server" />
                            </div>
                            <div class="mb-3 col-md-4">
                                <label class="form-label" for="basic-default-fullname">روز برگزاری:</label>
                                <select id="Day" runat="server" class="select2 form-select select2-hidden-accessible" data-select2-id="country" tabindex="-1" aria-hidden="true">
                                    <option value="-1">انتخاب</option>
                                    <option value="زوج">زوج</option>
                                    <option value="فرد">فرد</option>
                                </select>
                            </div>

                        </div>
                        <br />
                        <div>
                            <asp:Button ID="btnOK" runat="server" type="submit" Text="ثبت" OnClick="btnOK_OnClick" class="btn btn-primary" />
                            <asp:Button CssClass="btn btn-danger" ID="btn_Cansel" OnClick="btn_Cansel_OnClick" runat="server" Text="انصراف" />
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
                        <small class="text-muted float-end">لیست سانس ها!</small>
                    </div>
                    <% if (SansList.Any())
                        {%>
                    <table style="text-align: center" class="table table-bordered table-hover rwd-table">
                        <thead>
                            <tr>
                                <th>کد سانس</th>
                                <th>نام سانس</th>
                                <th>رشته ورزشی</th>
                                <th>مربی</th>
                                <th>جنسیت</th>
                                <th>تاریخ شروع</th>
                                <th>تاریخ پایان</th>
                                <th>سالن برگزاری</th>
                                <th>هزینه</th>
                                <th>روز برگزاری</th>
                                <th>عملیات</th>
                            </tr>
                        </thead>
                        <tbody class="table-border-bottom-0 ">
                            <% foreach (var item in SansList)
                                {%>
                            <tr>
                                <td data-th="کد سانس"><%Response.Write(item.Code); %></td>
                                <td data-th="نام سانس"><%Response.Write(item.FullName); %></td>
                                <td data-th="رشته ورزشی"><%Response.Write(item.SportFild); %></td>
                                <td data-th="مربی"><%Response.Write(item.Techare); %></td>
                                <td data-th="جنسیت"><%Response.Write(item.Gender.ToString() == "0" ? "مرد" : "زن"); %></td>
                                <td data-th="تاریخ شروع"><%Response.Write(item.D_Start); %></td>
                                <td data-th="تاریخ پایان"><%Response.Write(item.D_End); %></td>
                                <td data-th="سالن برگزاری"><%Response.Write(item.Gym); %></td>
                                <td data-th="هزینه"><%Response.Write(string.Format("{0:n0}", item.Mony)); %></td>
                                <td data-th="روز برگزاری"><%Response.Write(item.Days); %></td>
                                <td>
                                    <a onclick='<%Response.Write("SEdit(" + item.ID + ")");%>' class="text-white btn btn-warning">ویرایش</a>
                                    <% if (item.Deleted == 0)
                                        {%>
                                    <a onclick='<%Response.Write("NotActive(" + item.ID + ")");%>' class="btn btn-danger text-white">غیر فعال</a>
                                    <%}
                                        else if (item.Deleted == 1)
                                        {%>
                                    <a onclick='<%Response.Write("Active(" + item.ID + ")");%>' class="btn btn-primary text-white ">فعال</a>
                                    <%}%>
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

    <!-- Button trigger modal -->
    <button hidden="hidden" class="hidden" id="Select_teacher" data-bs-toggle="modal" data-bs-target="#exampleModal">
        انتخاب مربی
    </button>


    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header ">
                    <h5 class="modal-title" id="exampleModalLabel">انتخاب مربی سانس</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <div class="mb-3">
                        <label for="code" class="col-form-label">مربی:</label>
                        <select id="Mo_Teacher" runat="server" class="select2 form-select select2-hidden-accessible" data-select2-id="country" tabindex="-1" aria-hidden="true">
                        </select>
                    </div>
                </div>

                <div class="p-2">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">بستن</button>
                    <form>
                        <%--                        <asp:Button ID="Button2" CssClass="btn" Style="background-color: green; color: white" runat="server" Text="ثبت" />--%>
                        <asp:LinkButton ID="Mo_Enter" CssClass="btn" Style="background-color: green; color: white" runat="server" OnClick="Mo_Enter_OnClick">ثبت</asp:LinkButton>
                    </form>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

