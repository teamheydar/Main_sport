﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Panel.master" AutoEventWireup="true" CodeFile="CMS.aspx.cs" Inherits="Admin_CMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    ویرایش سایت
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">



    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 breadcrumb-wrapper mb-4">ویرایش سایت
        </h4>
        <div style="text-align: center" class="alert alert-danger" role="alert" id="message" runat="server"><% Response.Write(Tools.Textfotmatimg); %></div>
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <h5 class="card-header">پنل های مدیریتی</h5>
                    <div class="card-body row">
                        <div class="col-md-6">
                            <label for="defaultFormControlInput" class="form-label">عنوان: </label>
                            <input type="text" class="form-control" id="Titel" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-6">
                            <label for="defaultFormControlInput" class="form-label">فوتر: </label>
                            <input type="text" class="form-control" id="FoterPanel" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card mb-4">
                    <h5 class="card-header">صفحه اصلی:</h5>
                    <div class="card-body row">
                        <div class="divider divider-primary">
                            <div class="divider-text">صفحات اصلی</div>
                        </div>
                        <div class="col-md-6">
                            <label for="defaultFormControlInput" class="form-label">لوگو: </label>
                            <asp:FileUpload CssClass="form-control" ID="FileLogo" runat="server" />
                        </div>
                        <div class="col-md-6">
                            <label for="defaultFormControlInput" class="form-label">فوتر: </label>
                            <input type="text" class="form-control" id="Foter" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="divider divider-warning">
                            <div class="divider-text">اسلایدر صفحه اصلی</div>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label for="defaultFormControlInput" class="form-label">اسلایدر عکس (1): </label>
                                        <div class="input-group">
                                            <asp:FileUpload CssClass="form-control" ID="FileSlid1" runat="server" />
                                            <asp:Button runat="server" OnClick="BtnDeleteSlid1_OnClick" Text="حذف تصویر" class="btn btn-outline-danger" ID="BtnDeleteSlid1" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="defaultFormControlInput" class="form-label">اسلایدر عکس (2): </label>
                                        <div class="input-group">
                                            <asp:FileUpload CssClass="form-control" ID="FileSlid2" runat="server" />
                                            <asp:Button runat="server" OnClick="BtnDeleteSlid2_OnClick" Text="حذف تصویر" class="btn btn-outline-danger" ID="BtnDeleteSlid2" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="defaultFormControlInput" class="form-label">اسلایدر عکس (3): </label>
                                        <div class="input-group">
                                            <asp:FileUpload CssClass="form-control" ID="FileSlid3" runat="server" />
                                            <asp:Button runat="server" OnClick="BtnDeleteSlid3_OnClick" Text="حذف تصویر" class="btn btn-outline-danger" ID="BtnDeleteSlid3" />
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="divider divider-danger">
                            <div class="divider-text">توضیحات کوتاهی در رابطه با سایت</div>
                        </div>
                        <div class="col-md-4">
                            <label for="defaultFormControlInput" class="form-label">عنوان: </label>
                            <input type="text" class="form-control" id="CartTitel" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-4">
                            <label for="defaultFormControlInput" class="form-label">متن: </label>
                            <input type="text" class="form-control" id="CartText" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-4">
                            <label for="defaultFormControlInput" class="form-label">عکس: </label>
                            <asp:FileUpload CssClass="form-control" ID="FileAbout" runat="server" />
                        </div>
                        <div class="divider divider-dark">
                            <div class="divider-text">تبلیغ کوتاه درباره سایت</div>
                        </div>
                        <div class="col-md-6">
                            <label for="defaultFormControlInput" class="form-label">عنوان: </label>
                            <input type="text" class="form-control" id="AboutTitel" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-6">
                            <label for="defaultFormControlInput" class="form-label">متن: </label>
                            <input type="text" class="form-control" id="AboutText" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="divider divider-info">
                            <div class="divider-text">اطلاعات تماس</div>
                        </div>
                        <div class="col-md-12">
                            <label for="defaultFormControlInput" class="form-label">آدرس: </label>
                            <input type="text" class="form-control" id="Address" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-12">
                            <label for="defaultFormControlInput" class="form-label">توضیحات: </label>
                            <input type="text" class="form-control" id="Description" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-12">
                            <label for="defaultFormControlInput" class="form-label">شماره های تماس: </label>
                            <input type="text" class="form-control" id="NumberPhone" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-12">
                <div class="card mb-4">
                    <h5 class="card-header">درباره ما</h5>
                    <div class="card-body row">
                        <div class="col-md-12">
                            <label for="defaultFormControlInput" class="form-label">عنوان: </label>
                            <input type="text" class="form-control" id="ATitel" runat="server" aria-describedby="defaultFormControlHelp" />
                        </div>
                        <div class="col-md-12">
                            <label for="defaultFormControlInput" class="form-label">متن توضیحات: </label>
                            <textarea type="text" class="form-control" id="AText" runat="server" aria-describedby="defaultFormControlHelp"></textarea>
                        </div>
                        
                        <div class="divider divider-success">
                            <div class="divider-text">آدرس باشگاه</div>
                        </div>
                        <div class="col-lg-12 col-md-12">
                            <div id='map' class='map' style="height: 500px;"></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <asp:Button CssClass="btn btn-warning d-grid w-100" ID="btnOK" OnClick="btnOK_OnClick" runat="server" Text="ثبت تغیرات" />

    </div>

    <%--<asp:TextBox type="hidden" ID="txtlatmpX" runat="server" Height="1px" Skin="Office2010Silver" Style="border-radius: 8px; font: 20pt BYekan, b nazanin, Geneva, sans-serif; line-height: 20px;" Width="1%">
    </asp:TextBox>
    <asp:TextBox type="hidden" ID="txtlngmpY" runat="server" Height="1px" Skin="Office2010Silver" Style="border-radius: 8px; font: 20pt BYekan, b nazanin, Geneva, sans-serif; line-height: 20px;" Width="1%">
    </asp:TextBox>--%>
    <asp:TextBox type="hidden" ID="imgIndex" runat="server" Height="1px" Skin="Office2010Silver" Style="border-radius: 8px; font: 20pt BYekan, b nazanin, Geneva, sans-serif; line-height: 20px;" Width="1%">
    </asp:TextBox>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            
            <input hidden="hidden" type="text" id="xx" runat="server" name="xx" />
            <input hidden="hidden" type="text" id="yy" runat="server" name="yy" />

        </ContentTemplate>
    </asp:UpdatePanel>

    <input runat="server" type="text" hidden="hidden" visible="False" id="txtID" />


    
<link href="css/select2.min.css" rel="stylesheet" />
    <script src="js/Apply_Select2_Style.js"></script>
    <style type="text/css" runat="server" id="htmlCss"></style>
    <style>
        .select2-dropdown {
            top: 22px !important;
            left: 8px !important;
        }

        #demo_out2 {
            color: blue;
            width: 100%;
        }

        .select2-container--default {
            background-color: #fff;
            border: 1px solid #148cf3;
            border-radius: 4px;
        }

        .select2-container {
            max-width: 100%;
        }
    </style>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Ubuntu">
    <script src="css/num2persian.js" type="text/javascript"></script>
    <script>
        onload = function () {
            var e = document.getElementById('ContentPlaceHolder1_txtCostForosh');

            e.oninput = myHandler;


            e.onpropertychange = e.oninput; // for IE8


            function myHandler() {
                console.log(e.value);

                if (e.value.length) {
                    document.getElementById('demo_out2').innerHTML = e.value.toPersianLetter() + ' ' + 'تومان';
                }

            }
        };





        function itpro(number) {

            number = number.replace("۰", "0").replace("۱", "1").replace("۲", "2").replace("۳", "3").replace("۴", "4").replace("۵", "5").replace("۶", "6").replace("۷", "7").replace("v", "7").replace("۸", "8").replace("۹", "9");
            number += '';
            number = number.replace(',', ''); number = number.replace(',', ''); number = number.replace(',', '');
            number = number.replace(',', ''); number = number.replace(',', ''); number = number.replace(',', '');
            x = number.split('.');
            y = x[0];
            z = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(y))
                y = y.replace(rgx, '$1' + ',' + '$2');
            return y + z;

        }
        function isNumber(evt) {

            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }



        document.addEventListener("DOMContentLoaded", function () {
            var elements = document.getElementsByTagName("INPUT");
            var elSelect = document.getElementsByTagName("SELECT");
            var elarea = document.getElementsByTagName("textarea");
            for (var i = 0; i < elements.length; i++) {
                elements[i].oninvalid = function (e) {
                    e.target.setCustomValidity("");
                    if (!e.target.validity.valid) {
                        e.target.setCustomValidity("مقادیر مورد نیاز را پر کنید");
                        var style = document.createElement('style');
                        style.innerHTML = `
                        input:invalid {
                            border: 0.5px solid red;
                            }
                          `;
                        document.head.appendChild(style);
                    }
                };
                elements[i].oninput = function (e) {
                    e.target.setCustomValidity("");
                };
            }




            for (var i = 0; i < elSelect.length; i++) {
                elSelect[i].oninvalid = function (e) {
                    e.target.setCustomValidity("");
                    if (!e.target.validity.valid) {
                        e.target.setCustomValidity("مقادیر مورد نیاز را پر کنید");
                        window.location.hash = '#startform';
                        var style = document.createElement('style');
                        style.innerHTML = `
                            .frm_Required .select2-container--default
{
                               background-color: #f9fafc;
                                border-radius: 0;
                                border: none;
                                height: 50px;
                                border: 1px solid red;
                                border-radius: 4px;
                                padding-right: 15px;
}select:not(:valid) {
  color: yellow;
}
                          `;
                        document.head.appendChild(style);

                    }
                };
                elSelect[i].oninput = function (e) {
                    e.target.setCustomValidity("");
                };
            }


            for (var i = 0; i < elarea.length; i++) {
                elarea[i].oninvalid = function (e) {
                    e.target.setCustomValidity("");
                    if (!e.target.validity.valid) {
                        e.target.setCustomValidity("مقادیر مورد نیاز را پر کنید");
                        var style = document.createElement('style');
                        style.innerHTML = `
                            textarea: invalid {
                            border: 0.5px solid red;
                            }
                          `;
                        document.head.appendChild(style);
                    }
                };
                elarea[i].oninput = function (e) {
                    e.target.setCustomValidity("");
                };
            }





        })

        function isvalid(val) {
            if (val.length > 0) {
                var style = document.createElement('style');
                style.innerHTML = `
                            .frm_Required .select2-container--default
{
                               background-color: #f9fafc;
                                border-radius: 0;
                                border: none;
                                height: 50px;
                                border: 1px solid #148cf3;
                                border-radius: 4px;
                                padding-right: 15px;
}
                          `;
                document.head.appendChild(style);

            }
            else {
                window.location.hash = '#startform';
                var style = document.createElement('style');
                style.innerHTML = `
                            .frm_Required .select2-container--default
{
                               background-color: #f9fafc;
                                border-radius: 0;
                                border: none;
                                height: 50px;
                                border: 1px solid red;
                                border-radius: 4px;
                                padding-right: 15px;
}
                          `;
                document.head.appendChild(style);

            }


        }


    </script>
    <%-- MAP--%>
    <script src='/assets2/CedarMap/cedarmaps.js'></script>
    <script src='/assets2/CedarMap/access-token.js'></script>

    <!-- Third party libraries used in this demo -->
    <script src='/assets2/CedarMap/js/auto-complete.js'></script>
    <script src='/assets2/CedarMap/js/L.Control.Locate.min.js'></script>
    <script src='/assets2/CedarMap/js/tiniAjax.js'></script>

    <link href='/assets2/CedarMap/cedarmaps.css' rel='stylesheet' />
    <%--<link href='/assets2/CedarMap/css/address-locator.css' rel='stylesheet' />--%>

    <!-- Third party libraries used in this demo -->
    <link href='/assets2/CedarMap/css/auto-complete.css' rel='stylesheet' />
    <link href='/assets2/CedarMap/css/L.Control.Locate.min.css' rel='stylesheet' />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <%--ENDMap--%>




    <script>
        try {
            L.cedarmaps.accessToken = accessToken;
        } catch (err) {
            throw new Error('You need to get an access token to be able to use cedarmaps SDK. ' +
                'Send us an email to <info@cedar.ir>');
        }

        // Setting up our DOM elements and global scope variables.
        var form = document.getElementById('form'),
            provincesList = document.getElementById('provinces'),
            citiesList = document.getElementById('cities'),
            localitiesList = document.getElementById('localities'),
            streetsInput = document.getElementById('streets'),
            toggleCheckbox = document.getElementById('toggle-checkbox'),
            loading = document.getElementById('loading'),
            globalSearchBoundingBox = { sw: [<% Response.Write(Cms.MapX);%>], ne: [<% Response.Write(Cms.MapY);%>] }, // Bounding box of Iran
            marker,
            rectagle;

        var tileJSONUrl = 'https://api.cedarmaps.com/v1/tiles/cedarmaps.streets.json?access_token=' + L.cedarmaps.accessToken;

        // Initializing our map using some options
        var map = L.cedarmaps.map('map', tileJSONUrl, {
            scrollWheelZoom: true,
            maxZoom: 18,
            minZoom: 6,
        }).setView([<% Response.Write(Cms.MapX);%>, <% Response.Write(Cms.MapY);%>], 17);

        // Adding locate control to map
        L.control.locate({ flyTo: true }).addTo(map);

        // We need to initialize our administrativeBoundaries and geocoding module.
        var locator = L.cedarmaps.administrativeBoundaries();
        var geocoder = L.cedarmaps.geocoder('cedarmaps.streets');


        // Defining what to do after finding user's location and then binding the events
        var onLocationFound = function (location) {
            loading.style.visibility = 'visible';

            geocoder.reverseQuery(location.latlng, function callback(err, res) {
                loading.style.visibility = 'hidden';
                autoFillForm(res.result);
            });
        };

        var locationerror = function () {
            console.log('You either blocked browser from accessing your location OR there\'s something really wrong!');
        };

        map.on('locationfound', onLocationFound);
        map.on('locationerror ', locationerror);




        // For the start we need to get the list of all provinces in Iran.
        // As you can see the second param is not needed for this level because there's no parents for provinces.
        // Later on, when we want to get the list of all cities of Tehran province, the second param would be required.
        // see method: selectProvince()
        locator.query('province', '', function (err, json) {
            var html = buildOptionsList(json.results, 'name');
            provincesList.innerHTML = html;
            console.log(html);
        });


        /**
         *   The codes below this point are a very basic implementation of an address locator
         *   and could be replaced with your own logic and needs. This chunks of codes are only supposed to 
         *   show you the basic concepts and not to be considered as a best practice for implementing this
         *   functionality.
         */
        var selectProvince = function (selectedOption) {
            citiesList.disabled = false;
            localitiesList.disabled = true;
            streetsInput.disabled = true;
            console.log('vv', selectedOption);
            var value = selectedOption.value, sw, ne;
            console.log('val', value);
            if (!value) {
                citiesList.value = "";
                localitiesList.value = "";
                citiesList.disabled = true;
                localitiesList.disabled = true;
                sw = [24.827, 44.011], // Bounding box of Iran
                    ne = [39.724, 63.325],
                    globalSearchBoundingBox = { sw: sw, ne: ne };
                drawBoundary();
                map.flyToBounds([sw, ne]);

                return;
            }

            var sw = provincesList.options[provincesList.selectedIndex].getAttribute('data-sw').split(','),
                ne = provincesList.options[provincesList.selectedIndex].getAttribute('data-ne').split(',');

            globalSearchBoundingBox = { sw: sw, ne: ne };
            drawBoundary();

            map.flyToBounds([sw, ne]);

            loading.style.visibility = 'visible';
            locator.query('city', value, function (err, json) {
                loading.style.visibility = 'hidden';
                var html = buildOptionsList(json.results);
                citiesList.innerHTML = html;
            });
        };

        var selectCity = function (selectedOption) {
            localitiesList.disabled = false;
            streetsInput.disabled = false;
            var value = selectedOption.value, sw, ne;

            if (!value) {
                localitiesList.value = "";
                localitiesList.disabled = true;
                streetsInput.disabled = true;
                streetsInput.value = "";
                console.log(provincesList.selectedIndex);
                sw = provincesList.options[provincesList.selectedIndex].getAttribute('data-sw').split(','),
                    ne = provincesList.options[provincesList.selectedIndex].getAttribute('data-ne').split(',');
                globalSearchBoundingBox = { sw: sw, ne: ne };
                drawBoundary();
                map.flyToBounds([sw, ne]);

                return;
            }

            sw = citiesList.options[citiesList.selectedIndex].getAttribute('data-sw').split(','),
                ne = citiesList.options[citiesList.selectedIndex].getAttribute('data-ne').split(',');

            map.flyToBounds([sw, ne]);
            globalSearchBoundingBox = { sw: sw, ne: ne };
            drawBoundary();

            loading.style.visibility = 'visible';
            locator.query('locality', value, function (err, json) {
                var results = json ? json.results : null;
                loading.style.visibility = 'hidden';

                var html = buildOptionsList(results);
                localitiesList.innerHTML = html;
            });
        };

        var selectLocality = function (selectedOption) {
            streetsInput.disabled = false;
            var value = selectedOption.value;

            if (!value) {
                sw = citiesList.options[citiesList.selectedIndex].getAttribute('data-sw').split(','),
                    ne = citiesList.options[citiesList.selectedIndex].getAttribute('data-ne').split(',');
                globalSearchBoundingBox = { sw: sw, ne: ne };
                drawBoundary();
                map.flyToBounds([sw, ne]);

                return;
            }

            var sw = localitiesList.options[localitiesList.selectedIndex].getAttribute('data-sw').split(','),
                ne = localitiesList.options[localitiesList.selectedIndex].getAttribute('data-ne').split(',');

            map.flyToBounds([sw, ne]);
            globalSearchBoundingBox = { sw: sw, ne: ne };
            drawBoundary();
        };

        var buildOptionsList = function (list) {
            if (!list) return '<option value="">دیتا در این بخش در حال تکمیل است...</option>'

            var htmlArray = ['<option value="">لطفا انتخاب کنید...</option>'];
            if (list.length != 31) {
                for (var i = 0; i < list.length; i++) {
                    htmlArray.push('<option data-ne="' + list[i].location.bb.ne + '" data-sw="' + list[i].location.bb.sw + '" value="' + list[i].name + '">' + list[i].name + '</option>');
                }
            } else {
                htmlArray.push('<option data-ne="' + list[7].location.bb.ne + '" data-sw="' + list[7].location.bb.sw + '" value="' + list[7].name + '">' + list[7].name + '</option>');
            }

            return htmlArray.join('\n');
        };

        var setMarker = function (latLng, zoom) {
            // If any, removing the previously added marker of the map
            if (marker) map.removeLayer(marker);

            // Defining our custom marker
            // see: http://leafletjs.com/reference.html#marker
            var cedarmapsIcon = L.icon({
                iconUrl: 'https://api.cedarmaps.com/v1/markers/marker-default.png',
                iconSize: [98, 114],
                iconAnchor: [49, 57]
            });

            // Adding marker to the global map
            marker = new L.marker(latLng, {
                icon: cedarmapsIcon
            }).addTo(map);

            // Flying to the center point in zoom 15
            map.flyTo(latLng, 16);
        };
        var toggleLayer = function () {
            if (toggleCheckbox.checked) {
                drawBoundary();
            } else {
                if (rectagle) map.removeLayer(rectagle);
            }
        };

        var drawBoundary = function () {
            if (toggleCheckbox.checked) {
                // If any, removing the previously added rectagle of the map
                if (rectagle) map.removeLayer(rectagle);
                // create an orange rectangle
                var bounds = [globalSearchBoundingBox.sw, globalSearchBoundingBox.ne];
                rectagle = L.rectangle(bounds, { color: "#12132a", weight: 0 }).addTo(map);
            }
        };

        var autoFillForm = function (address) {
            loading.style.visibility = 'visible';
            locator.query('city', address.province, function (err, json) {
                citiesList.disabled = false;
                var results = json ? json.results : null;
                var html = buildOptionsList(results);
                citiesList.innerHTML = html;


                locator.query('locality', address.city, function (err, json) {
                    var results = json ? json.results : null;
                    var html = buildOptionsList(results);

                    loading.style.visibility = 'hidden';
                    localitiesList.disabled = false;
                    localitiesList.innerHTML = html;

                    provincesList.value = address.province;
                    citiesList.value = address.city;
                    localitiesList.value = address.locality;
                    streetsInput.value = address.address;
                });

            });
        };


        // Just a random third party autocomplete module. Nothing special about this. You can have your own autocomplete module
        // https://goodies.pixabay.com/javascript/auto-complete/demo.html
        var autoCompelete = new autoComplete({
            selector: 'input[name="streets"]',
            minChars: 2,
            cache: 0,  // set to 1 if you need caching and making less requests
            source: function (term, response) {
                // Since we wont have full control over ajax responses and caching problems may occure if we directly
                // use geocoder.query, we build the request URL instead and then we use it our custom auto complete module.
                // It's a workaround for not getting cached results in our list.
                var queryURL = geocoder.queryURL({ query: term, ne: globalSearchBoundingBox.ne, sw: globalSearchBoundingBox.sw });

                // In this demo we use a tiny 3rd party library for AJAX requests as we don't use jQuery or other bulky libraries.
                // So feel free to replace it with your preferred one. jQuery syntax for example would be like: $.ajax()
                Tini.ajax({
                    url: queryURL,
                    type: 'GET',
                    success: function (res) {
                        var json = JSON.parse(res);
                        if (window.console) console.log(json);
                        if (typeof json != 'undefined') {
                            if (json.results) response(json.results);
                            //no results
                            else { }
                        }
                    }
                });
            },
            renderItem: function (item, search) {
                var img, label, addressParts = [];

                switch (item.type) {
                    case 'street':
                        img = 'icon_street@2x.png'
                        label = 'خیابان'
                        break;
                    case 'boulevard':
                        img = 'icon_boulevard@2x.png'
                        label = 'بلوار'
                        break;
                    case 'roundabout':
                        img = 'icon_roundabout@2x.png'
                        label = 'میدان'
                        break;
                    case 'locality':
                        img = 'icon_locality@2x.png'
                        label = 'محله'
                        break;
                    case 'freeway':
                        img = 'icon_freeway@2x.png'
                        label = 'آزادراه'
                        break;
                    case 'expressway':
                        img = 'icon_freeway@2x.png'
                        label = 'اتوبان'
                        break;
                    case 'motorway':
                        label = 'اتوبان'
                        img = 'icon_motorway@2x.png'
                        break;
                    case 'place':
                        label = 'مکان'
                        img = 'icon_place@2x.png'
                        break;
                    case 'city':
                        label = 'شهر'
                        img = 'icon_place@2x.png'
                        break;
                }

                if (!item.address || item.address == '') {
                    if (item.components.province) addressParts.push(item.components.province);
                    if (item.components.city) addressParts.push(item.components.city);

                    item.address = addressParts.join('، ');
                } else {
                    if (item.components.province) addressParts.push(item.components.province);
                    if (item.address) addressParts.push(item.address);

                    item.address = addressParts.join('، ');
                }

                var altName = item.alt_name ? ' (' + item.alt_name + ')' : '';

                return '<div class="autocomplete-suggestion" data-name="' + item.name + '" data-center="' + item.location.center + '">\
                        <div class="address">'+ item.name + altName + '<span>' + item.address + '</span></div>\
                        <div class="street-type">\
                            <img src="img/'+ img + '" alt="" width="20" height="20">\
                            <span>'+ label + '</span>\
                        </div>\
                    </div>';
            },
            onSelect: function (e, term, item) {
                streetsInput.value = item.getAttribute('data-name');
                setMarker(item.getAttribute('data-center').split(','));
            }
        });
        var marker;

        map.on('click', function (e) {
            if (marker) {
                map.removeLayer(marker);
            }
            marker = new L.Marker(e.latlng).addTo(map);
            var lat = e.latlng.lat;
            var lon = e.latlng.lng;


            document.getElementById("Main_xx").value = lat;
            document.getElementById("Main_yy").value = lon;
        });


    </script>

    <script>
        function myFunction() {
            var x = document.getElementById("form");

            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }
    </script>

</asp:Content>

