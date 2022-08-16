<%@ Page Title="" Language="C#" MasterPageFile="~/MainePanel.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    درباره ما
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">

    <section class="section bg-white text-right">
        <div class="shell shell-bigger">
            <div class="range range-ten range-lg-justify">

                <div style="text-align: center" class="cell-lg-12">
                    <div class="range range-120 no-translate">
                        <div class="cell-xs-12">
                            <h3><% Response.Write(Cms.ATitel); %></h3>
                            <div class="divider divider-default"></div>
                            <p class="text-spacing-sm"><% Response.Write(Cms.AText); %></p>
                        </div>
                        <div class="cell-xs-12">
                            <div class="range range-70">
                               
                                
                                <div class="col-12 center-block">
                                    <h6>اطلاعات تماس</h6>
                                    <ul class="list-xxs text-spacing-sm">
                                        <li class="box-inline-gray line-height-p">
                                            <a href="javascript:void(0);"><% Response.Write(Cms.Description); %></a>
                                        </li>
                                        <li class="box-inline-gray line-height-p">
                                            <a href="javascript:void(0);"><% Response.Write(Cms.Address); %></a>
                                        </li>
                                        <li class="box-inline-gray line-height-p">
                                            <a href="javascript:void(0);"><span class="ltr-text"><% Response.Write(Cms.NumberPhone); %></span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <br />
    <br />
    <section class="section section-md text-center text-sm-right bg-gradient-1">
        <div class="shell-wide">
            <div class="range range-50 range-xs-center">
                <div class="cell-xl-8">
                    <div class="box-cta box-cta-inline">
                        <div class="box-cta-inner">
                            <h3 class="box-cta-title"><%  Response.Write(Cms.TitelCart); %> </h3>
                            <p><% Response.Write(Cms.TextCart); %></p>
                        </div>
                        <div class="box-cta-inner"><a class="button button-secondary" href="index.aspx">رفتن به صفحه اصلی</a></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

