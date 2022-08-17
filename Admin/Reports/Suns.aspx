<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Panel.master" AutoEventWireup="true" CodeFile="Suns.aspx.cs" EnableEventValidation="false" Inherits="Admin_Reports_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    گزارش سانس ها
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 breadcrumb-wrapper mb-4">سانس ها
        </h4>



        <div class="card-body">

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="avatar avatar-md mx-auto mb-3">
                                <span class="avatar-initial rounded-circle bg-label-warning">
                                    <i class="bx bx-box fs-3"></i>
                                </span>
                            </div>
                            <span class="d-block mb-1 text-nowrap">‌تعداد سانس ها تا کنون</span>
                            <h2 class="mb-n3" id="h2_cont_o" runat="server"></h2>
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
                        <small class="text-muted float-end">سانس مورد نظر را بیابید!</small>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="row">
                                <div class="mb-3 col-md-6">
                                    <label class="form-label" for="basic-default-company">کد:</label>
                                    <input type="text" class="form-control" runat="server" id="txtCod" />
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label class="form-label" for="basic-default-fullname">مربی سانس:</label>
                                    <select id="Teacher" runat="server" class="select2 form-select select2-hidden-accessible" data-select2-id="country" tabindex="-1" aria-hidden="true">
                                    </select>
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
                        <small class="text-muted float-end">لیست سانس های سایت!</small>
                    </div>
                    <div class="card-body">

                        <div class="accordion-body lh-2">
                            <% if (SansData.Count() != 0)
                                {%>
                            <table style="text-align: center" class="table table-bordered table-hover rwd-table">
                                <thead>
                                    <tr>
                                        <th>کد سانس</th>
                                        <th>نام سانس</th>
                                        <th>رشته ورزشی</th>
                                        <th>جنسیت</th>
                                        <th>تاریخ شروع</th>
                                        <th>تاریخ پایان</th>
                                        <th>سالن برگزاری</th>
                                        <th>هزینه</th>
                                        <th>روز برگزاری</th>
                                        <th>مربی</th>
                                    </tr>
                                </thead>
                                <tbody class="table-border-bottom-0 ">
                                    <% foreach (var item in SansData)
                                        {%>
                                    <tr style="text-align: center">
                                        <td data-th="کد سانس"><%Response.Write(item.Code); %></td>
                                        <td data-th="نام سانس"><%Response.Write(item.FullName); %></td>
                                        <td data-th="رشته ورزشی"><%Response.Write(item.SportFild); %></td>
                                        <td data-th="جنسیت"><%Response.Write(item.Gender.ToString() == "0" ? "مرد" : "زن"); %></td>
                                        <td data-th="تاریخ شروع"><%Response.Write(item.D_Start); %></td>
                                        <td data-th="تاریخ پایان"><%Response.Write(item.D_End); %></td>
                                        <td data-th="سالن برگزاری"><%Response.Write(item.Gym); %></td>
                                        <td data-th="هزینه"><%Response.Write(string.Format("{0:n0}", item.Mony)); %></td>
                                        <td data-th="روز برگزاری"><%Response.Write(item.Days); %></td>
                                        <td data-th="مربی"><%Response.Write(item.Techare); %></td>
                                        <td hidden="hidden"></td>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

