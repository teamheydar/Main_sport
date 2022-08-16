<%@ Page Title="" Language="C#" MasterPageFile="Panel.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Factor.aspx.cs" Inherits="Usear_Factor" %>

<asp:Content ID="Content3" ContentPlaceHolderID="Title" runat="Server">خرید سانس</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row invoice-preview">
            <!-- Invoice -->
            <div class="col-xl-9 col-md-8 col-12 mb-md-0 mb-4">                

                <div class="card invoice-preview-card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between flex-xl-row flex-md-column flex-sm-row flex-column p-sm-3 p-0">
                            <div class="mb-xl-0 mb-4">
                                <div class="d-flex align-items-center svg-illustration mb-3 gap-2">
                                    <svg width="26px" height="26px" viewbox="0 0 26 26" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                        <title>آیکن</title>
                                        <defs>
                                            <lineargradient x1="50%" y1="0%" x2="50%" y2="100%" id="linearGradient-1">
                                                <stop stop-color="#5A8DEE" offset="0%"></stop>
                                                <stop stop-color="#699AF9" offset="100%"></stop>
                                            </lineargradient>
                                            <lineargradient x1="0%" y1="0%" x2="100%" y2="100%" id="linearGradient-2">
                                                <stop stop-color="#FDAC41" offset="0%"></stop>
                                                <stop stop-color="#E38100" offset="100%"></stop>
                                            </lineargradient>
                                        </defs>
                                        <g id="Pages" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <g id="Login---V2" transform="translate(-667.000000, -290.000000)">
                                                <g id="Login" transform="translate(519.000000, 244.000000)">
                                                    <g id="Logo" transform="translate(148.000000, 42.000000)">
                                                        <g id="icon" transform="translate(0.000000, 4.000000)">
                                                            <path d="M13.8863636,4.72727273 C18.9447899,4.72727273 23.0454545,8.82793741 23.0454545,13.8863636 C23.0454545,18.9447899 18.9447899,23.0454545 13.8863636,23.0454545 C8.82793741,23.0454545 4.72727273,18.9447899 4.72727273,13.8863636 C4.72727273,13.5423509 4.74623858,13.2027679 4.78318172,12.8686032 L8.54810407,12.8689442 C8.48567157,13.19852 8.45300462,13.5386269 8.45300462,13.8863636 C8.45300462,16.887125 10.8856023,19.3197227 13.8863636,19.3197227 C16.887125,19.3197227 19.3197227,16.887125 19.3197227,13.8863636 C19.3197227,10.8856023 16.887125,8.45300462 13.8863636,8.45300462 C13.5386269,8.45300462 13.19852,8.48567157 12.8689442,8.54810407 L12.8686032,4.78318172 C13.2027679,4.74623858 13.5423509,4.72727273 13.8863636,4.72727273 Z" id="Combined-Shape" fill="#4880EA"></path>
                                                            <path d="M13.5909091,1.77272727 C20.4442608,1.77272727 26,7.19618701 26,13.8863636 C26,20.5765403 20.4442608,26 13.5909091,26 C6.73755742,26 1.18181818,20.5765403 1.18181818,13.8863636 C1.18181818,13.540626 1.19665566,13.1982714 1.22574292,12.8598734 L6.30410592,12.859962 C6.25499466,13.1951893 6.22958398,13.5378796 6.22958398,13.8863636 C6.22958398,17.8551125 9.52536149,21.0724191 13.5909091,21.0724191 C17.6564567,21.0724191 20.9522342,17.8551125 20.9522342,13.8863636 C20.9522342,9.91761479 17.6564567,6.70030817 13.5909091,6.70030817 C13.2336969,6.70030817 12.8824272,6.72514561 12.5388136,6.77314791 L12.5392575,1.81561642 C12.8859498,1.78721495 13.2366963,1.77272727 13.5909091,1.77272727 Z" id="Combined-Shape2" fill="url(#linearGradient-1)"></path>
                                                            <rect id="Rectangle" fill="url(#linearGradient-2)" x="0" y="0" width="7.68181818" height="7.68181818"></rect>
                                                        </g>
                                                    </g>
                                                </g>
                                            </g>
                                        </g>
                                    </svg>

                                    <span id="spanFullName" runat="server" class="app-brand-text h3 mb-0 fw-bold"></span>
                                </div>
                                <p id="pNameGym" runat="server" class="mb-1"></p>
                                <p id="pNameAdminGym" runat="server" class="mb-1"></p>
                                <p id="pUserName" runat="server" class="mb-0"></p>
                            </div>
                            <div>
                                <h4 id="h4SansID" runat="server"></h4>
                                <div class="mb-2 lh-1-85">
                                    <span id="spanDateStart" runat="server" class="me-1"></span>
                                </div>
                                <div class="lh-1-85">
                                    <span id="spanDateEnd" runat="server" class="me-1"></span>
                                </div>
                                <div class="lh-1-85">
                                    <span id="spanDateNow" runat="server" class="me-1"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="my-0">
                    <div class="card-body">
                        <div class="row p-sm-3 p-0">
                            <div class="col-xl-6 col-md-12 col-sm-5 col-12 mb-xl-0 mb-md-4 mb-sm-0 mb-4">
                                <p id="pFilds" runat="server" class="mb-1"></p>
                                <p id="pGender" runat="server" class="mb-1"></p>
                                <p id="pDays" runat="server" class="mb-1"></p>
                            </div>
                            <div class="col-xl-6 col-md-12 col-sm-7 col-12">
                                <table class="lh-2">
                                    <tbody>
                                        <tr>
                                            <td class="pe-3">هزینه:</td>
                                            <td id="tdMony" runat="server"></td>
                                        </tr>
                                      <tr>
                                            <td class="pe-3">جمع مبلغ:</td>
                                            <td id="tdSumMony" runat="server"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                    <div class="card-body">
                        <div class="row">
                            <div class="col-12 lh-1-85">
                                <span class="fw-semibold">آدرس باشگاه:</span>
                                <span id="spanAddressGym" runat="server"></span>
                                <br />
                                <span class="fw-semibold">تلفن باشگاه:</span>
                                <span id="spanNumberGym" runat="server"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Invoice -->

            <!-- Invoice Actions -->
            <div class="col-xl-3 col-md-4 col-12 invoice-actions">
                <div class="card">
                    <div class="card-body">
                        <form>
                            <% var AnySans = Data.tbl_SansBuys.Any(s =>
                            s.SansID == Sans.ID &&
                            s.UserID == User.ID);

                                if (!AnySans)
                                {%>

                               <asp:Button ID="btnBuy" runat="server" OnClick="btnBuy_OnClick" CssClass="btn btn-primary d-grid w-100" Text="ثبت نام و پرداخت" />

                              <%}
                                else
                                {%>
                                 <div class="btn btn-info d-grid w-100">شما این سانس را خریده اید</div> 
                                <%}

                            %>
                            
                            <br />
                            <asp:Button ID="btnBak" class="btn btn-danger d-grid w-100" runat="server" OnClick="btnBak_OnClick" Text="بازگشت به سانس ها" />
                        </form>
                    </div>
                </div>
            </div>
            <!-- /Invoice Actions -->
        </div>
    </div>
    <!--/ Content -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

