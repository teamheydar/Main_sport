<%@ Page Language="C#" MasterPageFile="Panel.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="Usear_Edit" %>

<asp:Content ID="Content3" ContentPlaceHolderID="Title" runat="Server">ویرایش حساب</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    
    
    <script>
        function GetDate(d) {
            var val = d.value.replace("-", "/").replace("-", "/");
            document.getElementById("Main_txtDateBirth").value = val;
        }
        function GetDate1(d) {
            var val = d.value.replace("-", "/").replace("-", "/");
            document.getElementById("Main_txtDateEInsurance").value = val;
        }
    </script>

    <div class="container-xxl flex-grow-1 container-p-y" data-select2-id="13">
        <h4 class="py-3 breadcrumb-wrapper mb-4">
            <%--<span class="text-muted fw-light">تنظیمات حساب /</span>--%> 
                  ویرایش حساب

        </h4>

        <div class="row fv-plugins-icon-container">
            <div class="col-md-12">

                <div id="MessageNotFullAccont" runat="server" style="margin-bottom: 20px" class="card">
                    <h5 class="card-header">تکمیل حساب کاربری</h5>
                    <div class="card-body">
                        <div class="mb-3 col-12 mb-0">
                            <div class="alert alert-danger">
                                <h6 class="alert-heading mb-1">برای استفاده از سایت باید حساب خود را تکمیل کنید!</h6>
                                <p class="mb-0">درصورتی که اطلاعات حساب خود را تکمیل نکنید نمی توانید از امکانات سایت استفاده کنید.</p>
                            </div>
                        </div>
                        <%-- <form id="formAccountDeactivation" onsubmit="return false" class="fv-plugins-bootstrap5 fv-plugins-framework" novalidate="novalidate">
                        <div class="form-check mb-3">
                          <input class="form-check-input" type="checkbox" name="accountActivation" id="accountActivation">
                          <label class="form-check-label" for="accountActivation">من غیرفعال کردن حساب خود را تایید می‌کنم</label>
                        <div class="fv-plugins-message-container invalid-feedback"></div></div>
                        <button type="submit" class="btn btn-danger deactivate-account">غیرفعال کردن حساب</button>
                      <div></div><input type="hidden"></form>--%>
                    </div>
                </div>

                <%-- <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link active" href="javascript:void(0);"><i class="bx bx-user me-1"></i> حساب</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="pages-account-settings-security.html"><i class="bx bx-lock-alt me-1"></i> امنیت</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="pages-account-settings-billing.html"><i class="bx bx-detail me-1"></i> صورتحساب و پلن‌ها</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="pages-account-settings-notifications.html"><i class="bx bx-bell me-1"></i> اعلان‌ها</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="pages-account-settings-connections.html"><i class="bx bx-link-alt me-1"></i> اتصالات</a>
                    </li>
                  </ul>--%>
                <div class="card mb-4">

                    <div style="text-align: center" class="alert alert-danger" role="alert" id="message" runat="server"></div>

                    <h5 class="card-header">ویرایش حساب</h5>
                    <!-- Account -->
                    <div class="card-body">
                        <div class="d-flex align-items-start align-items-sm-center gap-4">
                            <img runat="server" alt="img" class="d-block rounded" height="100" width="100" id="imgUser" />
                            <div class="row">
                                <label for="formFile" class="form-label">عکس </label>
                                <div class="col-md-6 mb-3 fv-plugins-icon-container">
                                    <asp:FileUpload CssClass="form-control" ID="IMG_User" runat="server" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>

                                <asp:Button runat="server" OnClick="btnDeleteimg_OnClick" ID="btnDeleteimg" Text="حذف تصویر" class="col-md-3 btn btn-danger btn-label-secondary account-image-reset mb-4" />

                            </div>
                        </div>
                        <p class="mb-0"><% Response.Write(Tools.Textfotmatimg); %></p>
                    </div>
                    <hr class="my-0">
                    <div class="card-body">
                        <form class="fv-plugins-bootstrap5 fv-plugins-framework" novalidate="novalidate" data-select2-id="formAccountSettings">
                            <div class="row" data-select2-id="12">

                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtFullName" class="form-label">نام کامل:</label>
                                    <input class="form-control " required="required" type="text" id="txtFullName" runat="server" autofocus="" placeholder="نام و نام خوانوادگی" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtctCody" class="form-label">کد ملی:</label>
                                    <input class="form-control" required="required" type="text" id="txtctCody" runat="server" autofocus="" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtUserName" class="form-label">نام کاربری:</label>
                                    <input class="form-control" required="required" type="text" id="txtUserName" runat="server" autofocus="" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <%--<div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="firstName" class="form-label">رمز عبور:</label>
                                    <div class="input-group input-group-merge">
                                        <input class="form-control" type="password" id="firstName" autofocus="">
                                        <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                                    </div>
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>--%>
                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <div class="mb-3 form-password-toggle">
                                        <label class="form-label" for="txtPassword">رمز عبور:</label>
                                        <div class="input-group input-group-merge">
                                            <input type="text" required="required" id="txtPassword" class="form-control text-start" dir="ltr" placeholder="رمز عبور خود را وارد کنید" aria-describedby="password" runat="server" />
                                            <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                                        </div>
                                    </div>
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <div class="col-md-6 col-12 mb-4">
                                    <label for="flatpickr-date" class="form-label">تاریخ تولد:</label>
                                    <input onchange="GetDate(this)" type="text" class="form-control flatpickr-input" placeholder="YYYY/MM/DD" id="flatpickr-date" name="flatpickr-date">
                                </div>
                                <input hidden="hidden" type="text" id="txtDateBirth" runat="server" />
                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtNumberPhone" class="form-label">شماره تلفن همراه:</label>
                                    <input class="form-control" required="required" type="text" id="txtNumberPhone" runat="server" autofocus="" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtNumberHome" class="form-label">شماره تلفن ثابت:</label>
                                    <input class="form-control" required="required" type="text" id="txtNumberHome" runat="server" placeholder="شماره تلفن منزل" autofocus="" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label class="form-label" for="slcGender">جنسیت:</label>
                                    <div class="position-relative">
                                        <select id="slcGender" required="required" runat="server" class="select2 form-select select2-hidden-accessible" data-select2-id="country" tabindex="-1" aria-hidden="true">
                                            <option value="-1">انتخاب</option>
                                            <option value="0">مرد</option>
                                            <option value="1">زن</option>
                                        </select><span class="select2 select2-container select2-container--default" dir="rtl" data-select2-id="1" style="width: 655px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-country-container"><span class="select2-selection__rendered" id="select2-country-container" role="textbox" aria-readonly="true" title="انتخاب"></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                    </div>
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label class="form-label" required="required" for="slcMarital">وضعیت تاهل:</label>
                                    <div class="position-relative">
                                        <select id="slcMarital" runat="server" class="select2 form-select select2-hidden-accessible" data-select2-id="country" tabindex="-1" aria-hidden="true">
                                            <option value="-1">انتخاب</option>
                                            <option value="0">مجرد</option>
                                            <option value="1">متاهل</option>
                                        </select><span clas="select2 select2-container select2-container--default" dir="rtl" data-select2-id="1" style="width: 655px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-country-container"><span class="select2-selection__rendered" id="select2-country-container" role="textbox" aria-readonly="true" title="انتخاب"></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                    </div>
                                </div>
                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtDateRegister" class="form-label">تاریخ عضویت:</label>
                                    <input style="pointer-events: none;" class="form-control" type="text" id="txtDateRegister" runat="server" autofocus="" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <%--<div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtDateE" class="form-label">تاریخ اعتبار:</label>
                                    <input style="pointer-events: none;" class="form-control" type="text" id="txtDateE" runat="server" autofocus="" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>--%>
                                <div class="mb-3 col-md-6 fv-plugins-icon-container">
                                    <label for="txtNumberInsurance" class="form-label">شماره بیمه:</label>
                                    <input class="form-control" type="text" id="txtNumberInsurance" runat="server" autofocus="" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <div class="col-md-6 col-12 mb-4">
                                    <label for="flatpickr-date" class="form-label">تاریخ اعتبار بیمه:</label>
                                    <input onchange="GetDate1(this)" type="text" class="form-control flatpickr-input" placeholder="YYYY/MM/DD" id="flatpickr-date1" name="flatpickr-date">
                                </div>
                                <input hidden="hidden" type="text" id="txtDateEInsurance" runat="server" />
                                <div class="mb-3 col-12 fv-plugins-icon-container">
                                    <label for="txtDescription" class="form-label">توضیحات:</label>
                                    <input class="form-control" type="text" id="txtDescription" runat="server" autofocus="" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>
                                <div class="mb-3  fv-plugins-icon-container">
                                    <label for="txtAddress" class="form-label">آدرس:</label>
                                    <input class="form-control" type="text" id="txtAddress" runat="server" autofocus="" />
                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                </div>


                            </div>
                            <div class="mt-2">
                                <%--<asp:button type="button" class="btn btn-primary me-2">ذخیره تغییرات</asp:button>--%>
                                <%--<button type="reset" class="btn btn-danger">انصراف</button>--%>
                                <asp:Button type="button" CssClass="btn btn-primary me-2" ID="btnEditForm" runat="server" OnClick="btnEditForm_OnClick" Text="ذخیره تغیرات" />
                                <a class="btn btn-danger text-white" href="Dashboard.aspx">انصراف</a>
                            </div>
                            <div></div>
                            <input type="hidden">
                        </form>
                    </div>
                    <!-- /Account -->
                </div>

            </div>
        </div>
    </div>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

