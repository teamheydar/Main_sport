<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Panel.master" AutoEventWireup="true" CodeFile="Timex.aspx.cs" EnableEventValidation="false" Inherits="Admin_Reports_Timex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    گزارش حضور و غیاب
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 breadcrumb-wrapper mb-4">ورود و خروج
        </h4>
        
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
                                    <label class="form-label" for="basic-default-company">کد کاربر:</label>
                                    <input type="text" class="form-control" runat="server" id="txtCod" />
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label class="form-label" for="txt_Codeys">کد ملی کاربر:</label>
                                    <input type="text" class="form-control" runat="server" id="txt_Codey" />
                                </div>
                            </div>
                            <div class="d-grid gap-2">
                                <asp:Button ID="btnOK" runat="server" type="submit" OnClick="btnOK_OnClick" Text="ثبت" class="btn btn-primary" />
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
                        <small class="text-muted float-end">لیست ورود و خروج کاربران!</small>
                    </div>
                    <% if (!Timex.Any())
                        {%>
                    <p style="text-align: center">رکوردی یافت نشد</p>
                    <% }
                        else
                        { %>


                    <table class="table table-bordered table-hover rwd-table">
                        <thead>
                            <tr>
                                <th>کد ملی</th>
                                <th>تاریخ</th>
                                <th>روز هفته</th>
                                <th>ساعت ورود</th>
                                <th>ساعت خروج</th>
                            </tr>
                        </thead>
                        <tbody class="table-border-bottom-0 ">
                            <% foreach (var item in Timex)
                                { %>
                            <tr style="text-align: center">
                                <td data-th="کد ملی"><% Response.Write(item.UserCodey); %></td>
                                <td data-th="تاریخ"><% Response.Write(item.Date); %></td>
                                <td data-th="روز هفته"><% Response.Write(item.DateWek); %></td>
                                <td data-th="ساعت ورود"><% Response.Write(item.TimeLogin); %></td>
                                <td data-th="ساعت خروج"><% Response.Write(item.TimeOut); %></td>
                                <td hidden="hidden"></td>
                            </tr>

                            <% }
                            %>
                        </tbody>
                    </table>
                    <% } %>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

