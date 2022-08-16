<%@ Page Title="" Language="C#" MasterPageFile="~/MainePanel.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    خانه
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">

    <!-- slider -->
    <% if (Cms.Slidimg1 != "" || Cms.Slidimg2 != "" || Cms.Slidimg3 != "")
        {%>

    <section class="section">
        <div class="swiper-form-wrap">
            <!-- Swiper-->
            <div class="swiper-container swiper-slider swiper-slider_height-1 swiper-align-left context-dark" data-loop="false" data-autoplay="5500" data-simulate-touch="false" data-slide-effect="fade">
                <div class="swiper-wrapper">
                    <% if (Cms.Slidimg1 != "")
                        {%>
                    <div class="swiper-slide" data-slide-bg="File/img/<% Response.Write(Cms.Slidimg1); %>">
                        <div class="swiper-slide-caption">
                            <div class="shell shell-bigger swiper-main-section">
                                <div class="range range-xs-center range-sm-left range-ten">
                                    <div class="cell-sm-6 cell-md-4 cell-xl-4">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <% } %>
                    <% if (Cms.Slidimg2 != "")
                        {%>
                    <div class="swiper-slide" data-slide-bg="File/img/<% Response.Write(Cms.Slidimg2); %>">
                        <div class="swiper-slide-caption">
                            <div class="shell shell-bigger swiper-main-section">
                                <div class="range range-xs-center range-sm-left range-ten">
                                    <div class="cell-sm-6 cell-md-4 cell-xl-4">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <% } %>
                    <% if (Cms.Slidimg3 != "")
                        {%>
                    <div class="swiper-slide" data-slide-bg="File/img/<% Response.Write(Cms.Slidimg3); %>">
                        <div class="swiper-slide-caption">
                            <div class="shell shell-bigger swiper-main-section">
                                <div class="range range-xs-center range-sm-left range-ten">
                                    <div class="cell-sm-6 cell-md-4 cell-xl-4">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <% } %>
                </div>
                <!-- Swiper controls-->
                <div class="swiper-pagination-wrap">
                    <div class="shell shell-bigger">
                        <div class="range range-ten">
                            <div class="cell-xs-12">
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <% } %>


    <!--our services -->
    <%--<% if (Gym != null)
        {%>

    <section class="section section-lg text-center">
        <div class="shell-wide">
            <h3>باشگاه ها</h3>
            <div class="divider divider-default"></div>
            <div class="range range-50 range-xs-center">

                <% foreach (var Item in Gym.Take(4))
                    {%>
                <div class="cell-xs-10 cell-sm-6 cell-lg-3">
                    <article class="box-minimal-modern">
                        <div class="box-minimal-icon mdi"></div>
                        <h6 class="box-minimal-title"><% Response.Write(Item.FullNameGym); %></h6>
                    </article>
                </div>
                <%} %>
            </div>
        </div>
    </section>

    <% } %>


    <!-- a few words about us-->--%>
    <section class="section section-lg bg-gray-lighter">
        <div class="shell shell-bigger">
            <div class="range range-ten range-50 range-sm-center range-md-middle range-lg-justify range-lg-reverse">
                <div class="cell-sm-9 cell-md-5 cell-xl-4 text-gray-light">
                    <h3><% Response.Write(Cms.TitelMinAbut); %></h3>
                    <div class="divider divider-default"></div>
                    <p class="heading-5 primary-font"><% Response.Write(Cms.TextMinAbut); %></p>
                    <a class="button button-default-outline" href="About.aspx">درباره ما</a>
                </div>
                <div class="cell-sm-9 cell-md-5">
                    <img src="File/img/<% Response.Write(Cms.imgMinAbut); %>" alt="" width="720" height="459">
                </div>
            </div>
        </div>
    </section>

    <%--    <!-- our advantages -->
    <section class="section section-lg text-center bg-image bg-image-7">
        <div class="shell-wide">
            <h3>برتری های ما</h3>
            <div class="divider divider-default"></div>
            <div class="range range-xs-center range-50">
                <div class="cell-sm-9 cell-md-6 cell-lg-3">
                    <div class="thumbnail-classic unit unit-sm-horizontal unit-md-vertical">
                        <div class="thumbnail-classic-icon unit-left"><span class="icon mdi mdi-thumb-up-outline"></span></div>
                        <div class="thumbnail-classic-caption unit-body">
                            <h6 class="thumbnail-classic-title">رویکرد فکری</h6>
                            <hr class="divider divider-default divider-sm">
                            <p class="thumbnail-classic-text">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان</p>
                        </div>
                    </div>
                </div>
                <div class="cell-sm-9 cell-md-6 cell-lg-3">
                    <div class="thumbnail-classic unit unit-sm-horizontal unit-md-vertical">
                        <div class="thumbnail-classic-icon unit-left"><span class="icon mdi mdi-account-multiple"></span></div>
                        <div class="thumbnail-classic-caption unit-body">
                            <h6 class="thumbnail-classic-title">کارمندان واجد شرایط</h6>
                            <hr class="divider divider-default divider-sm">
                            <p class="thumbnail-classic-text">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان</p>
                        </div>
                    </div>
                </div>
                <div class="cell-sm-9 cell-md-6 cell-lg-3">
                    <div class="thumbnail-classic unit unit-sm-horizontal unit-md-vertical">
                        <div class="thumbnail-classic-icon unit-left"><span class="icon mdi mdi-headset"></span></div>
                        <div class="thumbnail-classic-caption unit-body">
                            <h6 class="thumbnail-classic-title">پشتیبانی 24 ساعته</h6>
                            <hr class="divider divider-default divider-sm">
                            <p class="thumbnail-classic-text">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است</p>
                        </div>
                    </div>
                </div>
                <div class="cell-sm-9 cell-md-6 cell-lg-3">
                    <div class="thumbnail-classic unit unit-sm-horizontal unit-md-vertical">
                        <div class="thumbnail-classic-icon unit-left"><span class="icon mdi mdi-credit-card"></span></div>
                        <div class="thumbnail-classic-caption unit-body">
                            <h6 class="thumbnail-classic-title">روش های پرداخت متعدد</h6>
                            <hr class="divider divider-default divider-sm">
                            <p class="thumbnail-classic-text">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>--%>

    <!-- Gallery -->
    <% if (Teacher.Any())
        {%>

    <section class="section section-lg bg-white text-center">
        <div class="shell-wide">
            <h3>مربیان</h3>
            <div class="divider divider-default"></div>
            <div class="range range-50 range-xs-center" data-lightgallery="group">
                <% foreach (var Item in Teacher.Take(6))
                    {%>

                <div class="cell-sm-3 cell-md-3">
                    <a class="gallery-item titled-gallery-item">
                        <div class="gallery-item-image">
                            <figure>
                                <img src="Teacher/File/img/<% Response.Write(Item.img); %>" alt="" width="570" height="380">
                            </figure>

                        </div>
                    </a>
                    <div class="titled-gallery-caption"><a><% Response.Write(Item.FullName); %></a></div>
                </div>


                <%} %>
            </div>
        </div>
    </section>

    <% } %>

    <!-- do you need a consultation?-->
    <section class="section section-md bg-gradient-1 text-center text-sm-right">
        <div class="shell-wide">
            <div class="range range-50 range-xs-center">
                <div class="cell-xl-8">
                    <div class="box-cta box-cta-inline">
                        <div class="box-cta-inner">
                            <h3 class="box-cta-title"><% Response.Write(Cms.TitelCart); %></h3>
                            <p><% Response.Write(Cms.TextCart); %></p>
                        </div>
                        <div class="box-cta-inner">
                            <a class="button button-secondary" href="About.aspx">درباره ما</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- Icon carousel-->
    <section style="margin-top: 50px" class="section section-2-columns bg-gray-lighter bg-additional-gray-darker">
        <div class="shell-custom">
            <div class="range range-sm-center range-md-middle range-lg-left range-0">
                <div class="cell-sm-10 cell-md-6">
                    <div class="section-lg">
                        <div class="shell-custom-inner">
                            <h3>اطلاعات کلی درباره سایت</h3>
                            <hr class="divider divider-default">
                            <!-- Slick Carousel-->

                        </div>
                    </div>
                </div>
                <div class="cell-md-6 bg-additional-item">
                    <div class="section-lg">
                        <div class="shell-custom-inner shell-custom-inner-1 text-center">
                            <div class="range range-120">
                                <div class="cell-xs-6 cell-sm-4 cell-md-6">
                                    <div class="counter-wrap">
                                        <div class="heading-3"><span class="counter"><% Response.Write(Teacher.Count()); %></span></div>
                                        <p>مربیان</p>
                                    </div>
                                </div>
                                <div class="cell-xs-6 cell-sm-4 cell-md-6">
                                    <div class="counter-wrap">
                                        <div class="heading-3"><span class="counter"><% Response.Write(User.Count()); %></span></div>
                                        <p>کاربران</p>
                                    </div>
                                </div>
                                <%--<div class="cell-xs-6 cell-sm-3 cell-md-6">
                                    <div class="counter-wrap">
                                        <div class="heading-3"><span class="counter"><% Response.Write(Gym.Count()); %></span></div>
                                        <p>باشگاه ها</p>
                                    </div>
                                </div>--%>
                                <div class="cell-xs-12 cell-sm-4 cell-md-12">
                                    <div class="counter-wrap">
                                        <div class="heading-3"><span class="counter"><% Response.Write(Sans); %></span></div>
                                        <p>سانس ها</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section section-wrap section-reverse bg-white">
        <div class="section-wrap-inner section-lg">
            <div class="shell shell-bigger">
                <div class="range range-50">
                    <div class="cell-md-5 cell-xl-5 text-md-right">
                        <div class="section-wrap-content">
                            <h3>اطلاعات تماس</h3>
                            <div class="divider divider-default"></div>
                            <p class="text-spacing-sm"><% Response.Write(Cms.Description); %></p>
                            <ul class="list-xs list-darker">
                                <li class="box-inline"><span class="icon icon-md-smaller icon-secondary mdi mdi-map-marker"></span>
                                    <div><a href="javascript:void(0);" class="text-spacing-sm"><% Response.Write(Cms.Address); %></a></div>
                                </li>
                                <li class="box-inline text-center"><span class="icon icon-md-smaller icon-secondary mdi mdi-phone"></span>
                                    <ul class="list-comma">
                                        <li><a class="text-spacing-sm" href="javascript:void(0);"><% Response.Write(Cms.NumberPhone); %></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section-wrap-aside section-wrap-aside-custom google-map-section">
                <!-- RD Google Map-->
                <%--<div class="rd-google-map rd-google-map-novi rd-google-map__model rd-google-map-with-icon rd-google-map-default" data-zoom="15" data-y="38.064941" data-x="46.327593">
                    <ul class="map_locations">
                        <li data-y="<% Response.Write(Cms.MapY);%>" data-x="<% Response.Write(Cms.MapX);%>"></li>
                    </ul>
                </div>--%>
                <div class="col-lg-12 col-md-12">
                    <div id='map' class='map' style="height: 500px;"></div>
                </div>

            </div>
        </div>
    </section>

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

        //map.on('click', function (e) {
        //    if (marker) {
        //        map.removeLayer(marker);
        //    }
        //    marker = new L.Marker(e.latlng).addTo(map);
        //    var lat = e.latlng.lat;
        //    var lon = e.latlng.lng;


        //    console.log("You clicked the map at LAT: " + lat + " and LONG: " + lon);
        //    $('#ContentPlaceHolder1_txtlatmpX').val(lat);
        //    $('#ContentPlaceHolder1_txtlngmpY').val(lon);
        //});


    </script>

    <script>
        function myFunction() {
            var x = document.getElementById("form");

            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }  </script>

</asp:Content>

