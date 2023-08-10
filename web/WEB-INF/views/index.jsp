<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Classic Arcade</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <script src="/resources/js/jquery-3.2.1.min.js"></script>
  </head>

  <body>
    <jsp:include page="common/header.jsp" flush="true" />

    <%-- =====  배너 부분 =====  --%>
    <section id="banner">
      <ul>
        <li id="rhythmBanner">

        </li>

        <li id="chatBanner">

        </li>
      </ul>

      <div id="bannerBtnContainer">
        <div class="bannerBtn"></div>
        <div class="bannerBtn"></div>
      </div>

      <div id="bannerLeftBtn"></div>
      <div id="bannerRightBtn"></div>
    </section>


    <%--  JS CODE  --%>
    <script>
      let bannerContainer = document.getElementById("banner");        // banner Container
      let banners = bannerContainer.getElementsByTagName("li");       // banner 요소들

      // 배너 하단부 버튼
      let bannerBtns = bannerContainer.getElementsByClassName("bannerBtn");

      let nowBanner = 0;  // 메인 상태인 배너



      // 배너 이벤트 함수
      function bannerEvent(flag) {
        let isMainNum = flag ? nowBanner + 1 : nowBanner - 1;

        bannerBtns[nowBanner].style.height = "15px";
        bannerBtns[nowBanner].style.backgroundColor = "rgba(255, 255, 255, 0.5)";
        bannerBtns[nowBanner].style.borderRadius = "7.5px";
        bannerBtns[isMainNum].style.height = "20px";
        bannerBtns[isMainNum].style.backgroundColor = "rgba(255, 255, 255, 1)";
        bannerBtns[isMainNum].style.borderRadius = "10px";

        if (flag) {
          banners[nowBanner].style.right = "calc(100% + 50px)";
          banners[isMainNum].style.left = "0";
          nowBanner++;

          $("#bannerRightBtn").css("visibility", "hidden");
          $("#bannerLeftBtn").css("visibility", "visible");
        } else {
          banners[nowBanner].style.left = "calc(100% + 50px)";
          banners[isMainNum].style.right = "0";
          nowBanner--;

          $("#bannerLeftBtn").css("visibility", "hidden");
          $("#bannerRightBtn").css("visibility", "visible");
        }
      }


      // 배너 버튼 이벤트들 ======
      $("#bannerRightBtn").click(() => {
        bannerEvent(true);
      });

      $("#bannerLeftBtn").click(() => {
        bannerEvent(false);
      });

      bannerBtns[0].addEventListener("click", () => {
        if (nowBanner === 0) return;
        bannerEvent(false);
      });

      bannerBtns[1].addEventListener("click", () => {
        if (nowBanner === 1) return;
        bannerEvent(true);
      });
    </script>
  </body>
</html>
