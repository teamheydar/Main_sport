<%@ Page Title="" Language="C#" MasterPageFile="~/Usear/Panel.master" AutoEventWireup="true" CodeFile="RegisterSans.aspx.cs" Inherits="Usear_RegisterSans" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    ثبت نام سانس
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">
    <h1 id="Temp" runat="server"></h1>

    <div class="container-xxl flex-grow-1 container-p-y" data-select2-id="13">
        <h4 class="py-3 breadcrumb-wrapper mb-4">
            <%--<span class="text-muted fw-light">تنظیمات حساب /</span>--%> 
        ثبت نام سانس

        </h4>

        <div class="col-md-12">
            <div class="card mb-4">
                <h5 class="card-header">‌جستوجو</h5>
                <div class="card-body row">
                    <div class="mb-3 col-md-12">
                        <label class="form-label" for="slcGender">رشته ورزشی:</label>
                        <div class="position-relative">
                            <select id="SportFild" runat="server" class="select2 form-select select2-hidden-accessible" data-select2-id="country" tabindex="-1" aria-hidden="true">
                            </select><span class="select2 select2-container select2-container--default" dir="rtl" data-select2-id="1" style="width: 655px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-country-container"><span class="select2-selection__rendered" id="select2-country-container" role="textbox" aria-readonly="true" title="انتخاب"></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                        </div>
                    </div>
                    <div class="d-grid gap-2">
                        <asp:Button ID="SerchSans" runat="server" OnClick="SerchSans_OnClick" CssClass="btn btn-primary" Text="جستوجو" />
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <h5 class="card-header">‌لیست</h5>
            <div class="table-responsive text-nowrap">
                <% if (Sans.Count() != 0)
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
                        <%
                            foreach (var item in Sans)
                            { %>


                        <tr><% string _Gender;
                               if (item.Gender == 0)
                               {
                                   _Gender = "مرد";
                               }
                               else
                               {
                                   _Gender = "زن";

                               } %>
                            <td data-th="نام سانس"><strong><% Response.Write(item.FullName); %></strong></td>
                            <td data-th="رشته"><% Response.Write(item.SportFild); %></td>
                            <td data-th="جنسیت"><% Response.Write(_Gender); %></td>
                            <td data-th="هزینه"><% Response.Write(string.Format("{0:n0}", item.Mony)); %></td>
                            <td data-th="روز برگزاری"><% Response.Write(item.Days); %></td>
                            <td data-th="شروع"><% Response.Write(item.D_Start); %></td>
                            <td data-th="پایان"><% Response.Write(item.D_End); %></td>
                            <td data-th="سالن برگزاری"><% Response.Write(item.Gym); %></td>
                            <%
                                var AnySunsBuy = data.tbl_SansBuys.Any(s =>
                                s.UserID == Tools.GetIDUser() &&
                                s.SansID == item.ID);

                                if (AnySunsBuy)
                                {%>
                            <td  data-th="عملیات">
                                <div class=" d-grid gap-2">
                                    <a class="btn btn-warning" href="Factor.aspx?id=<% Response.Write(item.ID); %>">نمایش</a>
                                </div>
                            </td>
                            <%}
                                else
                                {%>
                            <td  data-th="عملیات">
                                <div class=" d-grid gap-2">
                                    <a class="btn btn-info" href="Factor.aspx?id=<% Response.Write(item.ID); %>">ثبت نام</a>
                                </div>
                            </td>
                            <%} %>
                        </tr>
                        <% } %>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

