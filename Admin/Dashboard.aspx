<%@ Page Title="" Language="C#" MasterPageFile="Panel.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="User_Profile" %>

<asp:Content ID="Content3" ContentPlaceHolderID="Title" runat="Server">
    داشبورد
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">


    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 breadcrumb-wrapper mb-4">پروفایل
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
                                    <i class="bx bx-edit"></i>ویرایش حساب
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
                                <i class="bx bx-phone-call"></i><span class="fw-semibold mx-2">شماره منزل:</span>
                                <span id="span_NumberHome" runat="server"></span>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--/ About User -->
                <% if (!Tools.AdminLevel())
                    {
                        if (UserNotOkAdmin != 0)
                        {
                %>
                <a class="mb-4" href="Reports/User.aspx">
                    <div class="card mb-4 card-body text-center">
                        <div class="row">
                            <div class="avatar avatar-md mx-auto mb-3">
                                <h1>
                                    <i class="fa fa-check-circle text-success display-6"></i>
                                </h1>
                            </div>
                            <h4 class="d-block mb-1 text-nowrap">تاید کاربران</h4>

                        </div>
                    </div>
                </a>
                <% }}%>
                    
                
            </div>

            <div class="col-xl-8 col-lg-7 col-md-7">
                <% if

      (Tools.AdminLevel())
                    {%>


                <div class="row">
                    <!-- Connections -->
                    <div class="row">
                        <div class="col-xs-12 col-md-6 mb-4 mb-4">
                            <div class="card">
                                <div class="card-body text-center">
                                    <div class="avatar avatar-md mx-auto mb-3">
                                        <span class="avatar-initial rounded-circle bg-label-info"><i class="bx bx-user fs-3"></i></span>
                                    </div>
                                    <span class="d-block mb-1 text-nowrap">تعداد کل کاربران</span>
                                    <h2 class="mb-n3"><% Response.Write(CountAllUser); %></h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6 mb-4">
                            <div class="card">
                                <div class="card-body text-center">
                                    <div class="avatar avatar-md mx-auto mb-3">
                                        <span class="avatar-initial rounded-circle bg-label-primary"><i class="bx bx-purchase-tag fs-3"></i></span>
                                    </div>
                                    <span class="d-block mb-1 text-nowrap">تعداد کل مربیان</span>
                                    <h2 class="mb-n3"><% Response.Write(CountAllTeacher); %></h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-12 mb-4">
                            <div class="card">
                                <div class="card-body text-center">
                                    <div class="avatar avatar-md mx-auto mb-3">
                                        <span class="avatar-initial rounded-circle bg-label-danger">
                                            <i class="bx bx-data fs-3"></i>
                                        </span>
                                    </div>
                                    <span class="d-block mb-1 text-nowrap">تعداد کل باشگاه ها</span>
                                    <h2 class="mb-n3"><% Response.Write(CountAllGym); %></h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/ Teams -->
                </div>
                <% }
                    else if (!Tools.AdminLevel())
                    {%>



                <div class="row">
                    <!-- Connections -->
                    <div class="row">
                        <div class="col-xs-12 col-md-6 mb-4 mb-4">
                            <div class="card">
                                <div class="card-body text-center">
                                    <div class="avatar avatar-md mx-auto mb-3">
                                        <span class="avatar-initial rounded-circle bg-label-info"><i class="bx bx-user fs-3"></i></span>
                                    </div>
                                    <span class="d-block mb-1 text-nowrap">تعداد کل کاربران</span>
                                    <h2 class="mb-n3"><% Response.Write(UserCount); %></h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6 mb-4">
                            <div class="card">
                                <div class="card-body text-center">
                                    <div class="avatar avatar-md mx-auto mb-3">
                                        <span class="avatar-initial rounded-circle bg-label-warning"><i class="bx bx-user-pin bx-dock-top fs-3"></i></span>
                                    </div>
                                    <span class="d-block mb-1 text-nowrap">تعداد کاربران این باشگاه</span>
                                    <h2 class="mb-n3"><% Response.Write(UserMyGtmCount); %></h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6 mb-4">
                            <div class="card">
                                <div class="card-body text-center">
                                    <div class="avatar avatar-md mx-auto mb-3">
                                        <span class="avatar-initial rounded-circle bg-label-danger"><i class="bx bx-user-x fs-3"></i></span>
                                    </div>
                                    <span class="d-block mb-1 text-nowrap">کاربران تاید نشده</span>
                                    <h2 class="mb-n3"><% Response.Write(UserNotOkAdmin); %></h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6 mb-4">
                            <div class="card">
                                <div class="card-body text-center">
                                    <div class="avatar avatar-md mx-auto mb-3">
                                        <span class="avatar-initial rounded-circle bg-label-success"><i class="bx bx-user-check fs-3"></i></span>
                                    </div>
                                    <span class="d-block mb-1 text-nowrap">کاربران تاید شده</span>
                                    <h2 class="mb-n3"><% Response.Write(UserOkAdmin); %></h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6 mb-4">
                            <div class="card">
                                <div class="card-body text-center">
                                    <div class="avatar avatar-md mx-auto mb-3">
                                        <span class="avatar-initial rounded-circle bg-label-primary"><i class="bx bx-purchase-tag fs-3"></i></span>
                                    </div>
                                    <span class="d-block mb-1 text-nowrap">تعداد مربیان</span>
                                    <h2 class="mb-n3"><% Response.Write(Teacher); %></h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6 mb-4">
                            <div class="card">
                                <div class="card-body text-center">
                                    <div class="avatar avatar-md mx-auto mb-3">
                                        <span class="avatar-initial rounded-circle bg-label-danger"><i class="bx bx-data fs-3"></i></span>
                                    </div>

                                    <span class="d-block mb-1 text-nowrap">تعداد روز باقی مانده</span>
                                    <h2 class="mb-n3"><% Response.Write(CountDayGym); %></h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/ Teams -->
                </div>
                <%}%>
            </div>
        </div>
        <!--/ User Profile Content -->
    </div>
    <!--/ Content -->


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

