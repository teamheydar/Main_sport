<%@ Page Title="" Language="C#" MasterPageFile="Panel.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Usear_Profile" %>

<asp:Content ID="Content3" ContentPlaceHolderID="Title" runat="Server">
    داشبورد
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <script>
        function GetDate(d) {
            var val = d.value.replace("-", "/").replace("-", "/");
            document.getElementById("Main_txtDate").value = val;
        }
    </script>
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 breadcrumb-wrapper mb-4">داشبورد
        </h4>

        <!-- Header -->
        <div class="row">
            <div class="col-12">
                <div class="card mb-4">
                    <div class="user-profile-header-banner">
                        <img src="../../assets/img/pages/profile-banner.png" alt="Banner image" class="rounded-top">
                    </div>
                    <div class="user-profile-header d-flex flex-column flex-sm-row text-sm-start text-center mb-4">
                        <div class="flex-shrink-0 mt-n2 mx-sm-0 mx-auto">
                            <asp:Image ID="ImgUser" CssClass="d-block h-auto ms-0 ms-sm-4 rounded-3 user-profile-img" runat="server" />
                        </div>

                        <%  %>

                        <div class="flex-grow-1 mt-3 mt-sm-5">
                            <div class="d-flex align-items-md-end align-items-sm-start align-items-center justify-content-md-between justify-content-start mx-4 flex-md-row flex-column gap-4">
                                <div class="user-profile-info">
                                    <h4 id="h4_FullName" runat="server"></h4>
                                </div>
                                <a href="EditProfile.aspx" class="btn btn-primary text-nowrap">
                                    <i class="bx bx-edit"></i>ویرایش اطلاعات
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ Header -->



        <!-- User Profile Content -->
        <div class="row">
            <div class="col-xl-4 col-lg-5 col-md-5">
                <!-- About User -->
                <div class="card mb-4">
                    <div class="card-body">
                        <small class="text-muted text-uppercase">اطلاعات کلی</small>
                        <ul class="list-unstyled mb-4 mt-3">
                            <li class="d-flex align-items-center mb-3">
                                <i class="bx bx-user"></i><span class="fw-semibold mx-2">نام کامل:</span>
                                <span id="Span_FullName" runat="server"></span>
                            </li>
                            <li class="d-flex align-items-center mb-3">
                                <i class="bx bx-user"></i><span class="fw-semibold mx-2">نام کاربری:</span>
                                <span id="span_UserName" runat="server"></span>
                            </li>
                            <li class="d-flex align-items-center mb-3">
                                <i class="bx bx-user"></i><span class="fw-semibold mx-2">کد ملی:</span>
                                <span id="span_Codey" runat="server"></span>
                            </li>
                        </ul>
                        <small class="text-muted text-uppercase">اطلاعات تماس</small>
                        <ul class="list-unstyled mb-4 mt-3">
                            <li class="d-flex align-items-center mb-3">
                                <i class="bx bx-phone"></i><span class="fw-semibold mx-2">شماره موبایل:</span>
                                <span class="d-inline-block" dir="ltr" id="span_NumberPhone" runat="server"></span>
                            </li>
                            <li class="d-flex align-items-center mb-3">
                                <i class="bx bxs-phone"></i><span class="fw-semibold mx-2">شماره منزل:</span>
                                <span id="span_NumberHome" runat="server"></span>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-12 mb-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="avatar avatar-md mx-auto mb-3">
                                <span class="avatar-initial rounded-circle bg-label-danger"><i class="bx bx-cart fs-3"></i></span>
                            </div>

                            <span class="d-block mb-1 text-nowrap">سانس های خریداری شده</span>
                            <h2 runat="server" id="spanCountSans" class="mb-n3"></h2>
                        </div>
                    </div>
                </div>

                <!--/ About User -->
            </div>
            <div class="col-md-8">
                <div class="col-xl">
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="mb-0">لیست سانس های خریداری شده</h5>
                        </div>
                        <% if (SansBuy.Count() == 0)
                            {%>
                        <p style="text-align: center">رکوردی یافت نشد</p>
                        <% }
                            else
                            {%>

                        <table style="text-align: center" class="table table-bordered table-hover rwd-table">
                            <thead>
                                <tr>
                                    <th>نام سانس</th>
                                    <th>رشته</th>
                                    <th>جنسیت</th>
                                    <th>هزینه</th>
                                    <th>روز برگزاری</th>
                                    <th>شروع</th>
                                    <th>پایان</th>
                                    <th>سالن برگزاری</th>
                                    <th>عملیات</th>
                                </tr>
                            </thead>
                            <tbody class="table-border-bottom-0 ">
                                <% foreach (var Item in SansBuy)
                                    {
                                        var _SansBoy = Data.tbl_Sans.Single(s =>
                                        s.ID == Item.SansID &&
                                        s.Deleted == 0);%>
                                <tr>
                                    <td data-th="نام سانس"><% Response.Write(_SansBoy.FullName); %></td>
                                    <td data-th="رشته"><% Response.Write(_SansBoy.SportFild); %></td>
                                    <td data-th="جنسیت"><% Response.Write(_SansBoy.Gender == 0 ? "مرد" : "زن"); %></td>
                                    <td data-th="هزینه"><% Response.Write(string.Format("{0:n0}",_SansBoy.Mony)); %></td>
                                    <td data-th="روز برگزاری"><% Response.Write(_SansBoy.Days); %></td>
                                    <td data-th="شروع"><% Response.Write(_SansBoy.D_Start); %></td>
                                    <td data-th="پایان"><% Response.Write(_SansBoy.D_End); %></td>
                                    <td data-th="سالن برگزاری"><% Response.Write(_SansBoy.Gym); %></td>
                                    <td data-th="عملیات">
                                        <div class=" d-grid gap-2">
                                            <a class="btn btn-warning" href="Factor.aspx?id=<% Response.Write(_SansBoy.ID); %>">نمایش</a>
                                        </div>
                                    </td>
                                </tr>

                                <% }%>
                            </tbody>
                        </table>

                        <% } %>
                    </div>
                </div>


                <div class="col-xl">
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="mb-0">گزارش پرداخت</h5>
                        </div>
                        <% if (RBU.Count() == 0)
                            {%>
                        <p style="text-align: center">رکوردی یافت نشد</p>
                        <% }
                            else
                            {%>

                        <table style="text-align: center" class="table table-bordered table-hover rwd-table">
                            <thead>
                                <tr>
                                    <th>تاریخ</th>
                                    <th>نتیجه</th>
                                    <th>شناسه پرداخت</th>
                                    <th>مبلغ</th>
                                </tr>
                            </thead>
                            <tbody class="table-border-bottom-0 ">
                                <% foreach (var Item in RBU)
                                    { %>
                                <tr>
                                    <td data-th="تاریخ"><% Response.Write(Item.Date); %></td>
                                    <td data-th="نتیجه"><% Response.Write(Item.Result == 1 ? "پرداخت موفق" : "پرداخت ناموفق"); %></td>
                                    <td data-th="شناسه پرداخت"><% Response.Write(Item.N_Buy); %></td>
                                    <td data-th="مبلغ"><% Response.Write(string.Format("{0:n0}", int.Parse(Item.Money))); %></td>
                                </tr>

                                <% }%>
                            </tbody>
                        </table>

                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <!--/ User Profile Content -->



    </div>
    <!--/ Content -->


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

