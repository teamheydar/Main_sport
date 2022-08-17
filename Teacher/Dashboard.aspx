<%@ Page Title="" Language="C#" MasterPageFile="Panel.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="User_Profile" %>

<asp:Content ID="Content3" ContentPlaceHolderID="Title" runat="Server">
    داشبورد
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">


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
            </div>
            <div class="col-xl-8 col-lg-7 col-md-7 card card-body mb-4">
                <div class="col-12">
                    <div class="col-xl">
                        <div class="">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h5 class="mb-0">لیست سانس هایی که شما مربی آن هستید</h5>
                            </div>

                            <% if (TeacherSans.Any())
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
                                    </tr>
                                </thead>
                                <tbody class="table-border-bottom-0 ">
                                    <% foreach (var Item in TeacherSans)
                                        {%>
                                    <tr>
                                        <td data-th="نام سانس"><% Response.Write(Item.FullName); %></td>
                                        <td data-th="رشته"><% Response.Write(Item.SportFild); %></td>
                                        <td data-th="جنسیت"><% Response.Write(Item.Gender == 0 ? "مرد" : "زن"); %></td>
                                        <td data-th="هزینه"><% Response.Write(Item.Mony); %></td>
                                        <td data-th="روز برگزاری"><% Response.Write(Item.Days); %></td>
                                        <td data-th="شروع"><% Response.Write(Item.D_Start); %></td>
                                        <td data-th="پایان"><% Response.Write(Item.D_End); %></td>
                                        <td data-th="سالن برگزاری"><% Response.Write(Item.Gym); %></td>
                                        <td hidden="hidden"></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                            <%}
                               else
                               {%>
                            <p class="text-center">رکوردی یافت نشد</p>  
                              <% } %>

                        </div>
                    </div>
                </div>
            </div>





        </div>
    </div>
    <!--/ Content -->


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

