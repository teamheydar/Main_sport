<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Panel.master" AutoEventWireup="true" CodeFile="User.aspx.cs" EnableEventValidation="false" Inherits="Admin_Reports_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    گزارش کاربران
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 breadcrumb-wrapper mb-4">کاربران
        </h4>



        <div class="card-body">

            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-4 mb-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="avatar avatar-md mx-auto mb-3">
                                <span class="avatar-initial rounded-circle bg-label-info">
                                    <i class="bx bx-user fs-3"></i>
                                </span>
                            </div>
                            <span class="d-block mb-1 text-nowrap">‌تعداد کل کاربران  </span>
                            <h2 class="mb-n3" id="h2_cont_o" runat="server"></h2>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4 mb-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="avatar avatar-md mx-auto mb-3">
                                <span class="avatar-initial rounded-circle bg-label-success">
                                    <i class="bx bx-user-check fs-3"></i>
                                </span>
                            </div>
                            <span class="d-block mb-1 text-nowrap">‌کابران تایید شده</span>
                            <h2 class="mb-n3" id="h2_cont_A" runat="server"></h2>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4 mb-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="avatar avatar-md mx-auto mb-3">
                                <span class="avatar-initial rounded-circle bg-label-danger">
                                    <i class="bx bx-user-x fs-3"></i>
                                </span>
                            </div>
                            <span class="d-block mb-1 text-nowrap">‌کابران تایید نشده</span>
                            <h2 class="mb-n3" id="h2_cont_NA" runat="server"></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <div class="row">
            <div class="col-xl">
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">جستوجو</h5>
                        <small class="text-muted float-end">کاربر مورد نظر را بیابید!</small>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="row">
                                <div class="mb-3 col-6">
                                    <label class="form-label" for="basic-default-company">کد:</label>
                                    <input type="text" class="form-control" runat="server" id="txtCod" />
                                </div>
                                <div class="mb-3 col-6">
                                    <label class="form-label" for="basic-default-company">کد ملی:</label>
                                    <input type="text" class="form-control" runat="server" id="txt_Codey" />
                                </div>
                            </div>
                            <div class="d-grid gap-2">
                                <asp:Button ID="btnOK" runat="server" type="submit" Text="ثبت" OnClick="btnOK_OnClick" class="btn btn-primary" />
                            </div>
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
                        <small class="text-muted float-end">لیست کاربران سایت!</small>
                    </div>
                    <div class="card-body">

                        <div class="accordion mt-3 accordion-header-primary" id="accordionWithIcon">
                            <div class="card accordion-item">
                                <h2 class="accordion-header d-flex align-items-center">
                                    <button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#accordionWithIcon-1" aria-expanded="false">
                                        <i class="bx bx-bar-chart-alt-2 me-2"></i>
                                        کاربران تایید نشده
                                    </button>
                                </h2>

                                <div id="accordionWithIcon-1" class="accordion-collapse collapse" style="">
                                    <div class="accordion-body lh-2">
                                        <% if (UserDataNot.Count() != 0)
                                            {%>
                                        <table class="table table-bordered table-hover rwd-table">
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
                                                <% foreach (var item in UserDataNot)
                                                    {%>
                                                <tr style="text-align: center">
                                                    <td data-th="کد"><%Response.Write(item.Code); %></td>
                                                    <td data-th="نام و نام خوانوادگی"><%Response.Write(item.FullName); %></td>
                                                    <td data-th="کد ملی"><%Response.Write(item.Codey); %></td>
                                                    <td data-th="تاریخ ثبت نام"><%Response.Write(item.R_Date); %></td>
                                                    <td data-th="تلفن همراه"><%Response.Write(item.N_Phone); %></td>
                                                    <td ><a class="btn btn-info" href="../View/ViewUser.aspx?id=<%Response.Write(item.ID); %>">نمایش و تایید</a></td>
                                                </tr>
                                                <%} %>
                                            </tbody>
                                        </table>
                                        <% }
                                            else
                                            {%>
                                        <br />
                                        <p style="text-align: center">رکوردی یافت نشد</p>
                                        <%}%>
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item card">
                                <h2 class="accordion-header d-flex align-items-center">
                                    <button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#accordionWithIcon-2" aria-expanded="false">
                                        <i class="bx bx-briefcase me-2"></i>
                                        کاربران تایید شده
                                    </button>
                                </h2>
                                <div id="accordionWithIcon-2" class="accordion-collapse collapse" style="">
                                    <div class="accordion-body lh-2">
                                        <% if (UserData.Count() != 0)
                                            {%>
                                        <table class="table table-bordered table-hover rwd-table">
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
                                                <tr style="text-align: center">
                                                    <td data-th="کد"><%Response.Write(item.Code); %></td>
                                                    <td data-th="نام و نام خوانوادگی"><%Response.Write(item.FullName); %></td>
                                                    <td data-th="کد ملی"><%Response.Write(item.Codey); %></td>
                                                    <td data-th="تاریخ ثبت نام"><%Response.Write(item.R_Date); %></td>
                                                    <td data-th="تلفن همراه"><%Response.Write(item.N_Phone); %></td>
                                                    <td ><a class="btn btn-info" href="../View/ViewUser.aspx?id=<%Response.Write(item.ID); %>">نمایش</a></td>
                                                </tr>
                                                <%} %>
                                            </tbody>
                                        </table>
                                        <% }
                                            else
                                            {%>
                                        <br />
                                        <p style="text-align: center">رکوردی یافت نشد</p>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

