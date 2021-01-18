<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.bssBtn2 {
   font-size: 15px;
   width: 100%;
   height: 50px;
   border: none;
   background-color: #f2cd54;
   border-radius: 50px;
   background-size: 200%;
   border-color: white;
   color: #fff;
   outline: none;
}
</style>
<script>
   function checkOnlyOne(chk) {
      var obj = document.getElementsByName("bm_cate");
      for (var i = 0; i < obj.length; i++) {
         if (obj[i] != chk) {
            obj[i].checked = false;
         }
      }
   }
</script>
</head>
<body>
   <div class="join_form">
      <form id="frm_businessjoin"
         action="${pageContext.request.contextPath}/member/businessjoin.do"
         method="post">
         <div class="join_box">
            <h2>Business</h2>
            <div class="form_group">
               <input type="text" class="form_control" id="m_id" name="m_id"
                  placeholder="아이디">
               <div class="check_font" id="id_check"></div>
            </div>
            <div class="form_group">
               <input type="text" class="form_control" id="bm_name" name="bm_name"
                  placeholder="브랜드명">
               <div class="check_font" id="name_check"></div>
            </div>
            <div class="form_group_ck">

               <label> <input type="checkbox" class="form_control"
                  id="bm_cate" onclick="checkOnlyOne(this)" name="bm_cate" value="1">
                  패션
               </label> <label> <input type="checkbox" class="form_control"
                  onclick="checkOnlyOne(this)" id="bm_cate" name="bm_cate" value="2">
                  전자 제품
               </label> <label> <input type="checkbox" class="form_control"
                  onclick="checkOnlyOne(this)" id="bm_cate" name="bm_cate" value="3">
                  잡화
               </label> <label> <input type="checkbox" class="form_control"
                  onclick="checkOnlyOne(this)" id="bm_cate" name="bm_cate" value="4">
                  화장품
               </label> <label><input type="checkbox" class="form_control"
                  onclick="checkOnlyOne(this)" id="bm_cate" name="bm_cate" value="5">
                  기타</label>
            </div>
            <div class="form_group">
               <input type="text" class="form_control" id="bm_url" name="bm_url"
                  placeholder="홈페이지">
               <div class="check_font" id="birth_check"></div>
            </div>
            <div class="form_group">
               <input type="tel" class="form_control" id="bm_phone"
                  name="bm_phone" placeholder="회사 번호">
               <div class="check_font" id="phone_check"></div>
            </div>
            <div class="form_group">
               <input type="tel" class="form_control" id="bm_account"
                  name="bm_account" placeholder="계좌번호">
               <div class="check_font" id="phone_check"></div>
            </div>
            <div class="form_group">
               <input type="text" class="form_control" id="bm_intro" name="bm_intro"
                  placeholder="회사 소개">
            </div>
            <div class="form_group">
               <input class="form_control" style="top: 5px;" placeholder="회사 주소"
                  name="bm_addr" id="bm_addr" type="text" />
            </div>
            <div class="text_center">
               <button type="submit" class="btn btn-primary bssBtn2">비즈니시
                  계정 생성</button>
               <div class="bottom-text">
                  <a href="${pageContext.request.contextPath}/member/loginPage">
                     로그인으로 돌아가기</a>
               </div>
            </div>
         </div>
      </form>
   </div>
</body>
</html>