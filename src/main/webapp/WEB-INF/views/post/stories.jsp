<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>TA_IN 스토리</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
            <!-- <script src="js/jquery-1.7.2.js"></script>
            <script src="js/jquery.easing.1.3.js"></script>
            <script src="js/jquery.slideinslide.js"></script> -->
            <style>
                body {
                    width: 100%;
                    height: 100%;
                }
                
                #story_con {
                    display: flex;
                    justify-content: center;
                    width: 100%;
                    height: 800px;
                }
                
                #story_big_con {
                    width: 1000px;
                    max-height: 98%;
                    margin-top: 1%;
                    margin-bottom: 1%;
                }
                
                #show_story {
                    max-width: 1000px;
                    height: 100%;
                    position: relative;
                    overflow: hidden;
                }
                
                #story {
                    display: flex;
                    position: absolute;
                    top: 0px;
                    left: 0px;
                }
                
                .story_photo_con {
                    width: 1000px;
                    height: 800px;
                }
                
                .scon_con {
                    max-width: 1000px;
                    height: 800px;
                    position: relative;
                    overflow: hidden;
                }
                
                .scon {
                    display: flex;
                    position: absolute;
                    top: 0px;
                    left: 0px;
                }
                
                .story_each_con {
                    width: 1000px;
                    height: 800px;
                }
            </style>
        </head>

        <body>
            <div id="story_con">
                <div id="story_big_con">
                    <div id="show_story">
                        <input type="hidden" id="showst" value="${showAllStory.m_id}" onclick="split('${showAllStory.m_id}','${showAllStory.s_type}','${showAllAStory.m_id}','${showAllAStory.s_type}');">
                        <div id="story">
                        </div>
                        <%-- <img src="${pageContext.request.contextPath}/resources/uploadFiles/${vo.s_img}"> --%>
                    </div>
                </div>
                <button type="button" class="slide_btn_prev">Prev</button>
                <button type="button" class="slide_btn_next">Next</button>
                <button type="button" class="slide_btn_prev_s">sPrev</button>
                <button type="button" class="slide_btn_next_s">sNext</button>
            </div>
        </body>
        <script>
            $(function() {
                $("#showst").trigger('click');
                $(".story_photo_con").trigger('click');
            });

            function split(a, a_t, b, b_t) {
                console.log(a);
                console.log(a_t);
                console.log(b);
                console.log(b_t);
                var arr = a.split("|");
                var arrb = b.split("|");
                for (i = 0; i < arr.length; i += 3) {
                    for (j = i; j < i + 3; j++) {
                        console.log(arr[j]);
                        if (arr[j] != undefined) {
                            $("#story").append('<div class="story_photo_con" onclick="showeach(\'' + arr[j] + '\',\'' + a_t + '\');">' + '<div class="scon_con scon_con' + arr[j] + '"><div class="scon scon' + arr[j] + a_t + '"></div></div></div>')
                        }
                    }
                    console.log("광고" + arrb[i]);
                    $("#story").append('<div class="story_photo_con" onclick="showeach(\'' + arrb[i] + '\',\'' + b_t + '\');">' + '<div class="scon_con scon_con' + arrb[i] + '"><div class="scon scon' + arrb[i] + b_t + '"></div></div></div>')
                }
                // 게시물 슬라이드
                var slideWrapper = document.querySelector('#show_story');
                var slides = document.querySelectorAll('.story_photo_con');
                var totalSlides = slides.length;
                var sliderWidth = slideWrapper.clientWidth;
                var slideIndex = 0;
                var slider = document.querySelector('#story');
                slider.style.width = sliderWidth * totalSlides + 'px';

                function showSlides(n) {
                    slideIndex = n;
                    if (slideIndex == -1) {
                        slideIndex = totalSlides - 1;
                    } else if (slideIndex === totalSlides) {
                        slideIndex = 0;
                    }
                    slider.style.left = -(sliderWidth * slideIndex) + 'px';
                }

                function plusSlides(n) {
                    showSlides(slideIndex += n);
                }

                function currentSlide(n) {
                    showSlides(slideIndex = n);
                }
                var nextBtn = document.querySelector('.slide_btn_next');
                var prevBtn = document.querySelector('.slide_btn_prev');
                nextBtn.addEventListener('click', function() {
                    plusSlides(1);
                });
                prevBtn.addEventListener('click', function() {
                    plusSlides(-1);
                });

            }

            function showeach(id, s_type) {
                console.log(id);
                console.log(s_type);
                $.ajax({
                    url: "${pageContext.request.contextPath}/storyResult.do",
                    method: "POST",
                    data: {
                        id: id,
                        s_type: s_type
                    },
                    dataType: "json",
                    success: function(story) {
                        var count = story;
                        console.log(count.story.length);
                        for (var i = 0; i < count.story.length; i++) {
                            var s_img = count.story[i].s_img;
                            console.log(s_img);
                            $(".scon" + id + s_type).append('<div class="story_each_con story_each_con' + id + '"><img src="${pageContext.request.contextPath}/resources/uploadFiles/' + s_img + '"></div>');
                        }
                        // 게시물 슬라이드
                        var slideWrapper = document.querySelector('.scon_con' + id);
                        var slides = document.querySelectorAll('.story_each_con' + id);
                        var totalSlides = slides.length;
                        var sliderWidth = slideWrapper.clientWidth;
                        var slideIndex = 0;
                        var slider = document.querySelector('.scon' + id + s_type);
                        slider.style.width = sliderWidth * totalSlides + 'px';

                        function showSlides(n) {
                            slideIndex = n;
                            if (slideIndex == -1) {
                                slideIndex = totalSlides - 1;
                            } else if (slideIndex === totalSlides) {
                                slideIndex = 0;
                            }
                            slider.style.left = -(sliderWidth * slideIndex) + 'px';
                        }

                        function plusSlides(n) {
                            showSlides(slideIndex += n);
                        }

                        function currentSlide(n) {
                            showSlides(slideIndex = n);
                        }
                        var nextBtn = document.querySelector('.slide_btn_next_s');
                        var prevBtn = document.querySelector('.slide_btn_prev_s');
                        nextBtn.addEventListener('click', function() {
                            plusSlides(1);
                        });
                        prevBtn.addEventListener('click', function() {
                            plusSlides(-1);
                        });
                    },
                    error: function(request, status, error) {
                        alert("code:" +
                            request.status +
                            "\n" +
                            "message:" +
                            request.responseText +
                            "\n" + "error:" +
                            error);
                    }
                });

            }
        </script>

        </html>