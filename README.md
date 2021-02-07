# TA_IN 1.0.0
------------
## Contents
1. [프로젝트 계획 이유](#프로젝트-계획-이유)
2. [설계의 주안점](#설계의-주안점)
3. [Using](#Using)
4. [업무일정](#업무일정)
5. [Part](#Part)
7. [TA_IN 기능 설명](#TA_IN-기능-설명)
8. [Document](#Document)
9. [추후 구현 예정 기능](#추후-구현-예정-기능)
------------
## 프로젝트 계획 이유
> 타인과 일상을 소통하다.
>
> 코로나19 팬데믹은 우리의 삶을 전적으로 변화시켰습니다. 직접적인 만남이 제한되고, 우리 생활의 많은 영역이 디지털로 전환되었습니다. 이런 상황에서 의사소통 및 사회적인 교류를 위한 대안으로 소셜 미디어가 급부상했으며, 이 같은 역할을 넘어서 이제는 쇼핑 채널로서의 기능을 위해 새로운 서비스들이 속속히 출시되고 있습니다.
>
> 이에 우리는 개인과 개인 간의 소통뿐만 아니라 기존 인스타그램에는 없던 개인과 기업, 개인과 브랜드 간의 연결과 소통을 보다 쉽게 열 수 있도록 “타인” 프로젝트를 기획하게 되었습니다.
------------
## 설계의 주안점
1. HTML, CSS, jQuery, JavaScript를 이용한 편안하고 게시글에 집중을 위한 심플한 UI 구성
2. Spring MVC를 이용한 CRUD 기능
3. Web Socket 양방향 통신을 이용한 실시간 알림, 채팅 기능
4. AJAX를 이용한 데이터 처리
5. 코로나로 인해 웹캠 사용 증가에 따른 웹캠 캡쳐 기능
6. 편리한 검색을 위한 자동 검색어 완성 기능
7. SNS에서 결제까지 이어질 수 있는 비즈니스 계정 서비스
------------
## Using
1. FrontEnd - HTML5, JS, CSS3, jQuery
2. BackEnd - JAVA(JDK 1.8), Spring, Servlet, Mybatis
3. OS - Windows, MacOS
4. Library&API - Google Developers Charts, kakaomap, WebSocket, I'mport, JBCrypt, Commons FileUpload, JavaMail API JAR, Gson, JSON.simple, Spring JDBC, Oracle JDBC Driver
5. IDE - Spring Tool Suite 3
6. Server - Tomcat(v8.5)
7. Document - Google Drive, StarUML, Eclipse
8. Cl - Github, git
9. DataBase - Oracle DataBase 11g
------------
## 업무일정
<img width="840" alt="스크린샷 2021-01-29 오후 6 36 52" src="https://user-images.githubusercontent.com/72774483/106258404-1e9eb780-6261-11eb-9a55-37419ccac6bd.png">

------------
## Part
### 김수민
+ 검색 기능
+ 타임라인 관리
+ 스토리 관리
+ 일반회원 페이지 관리
+ 고객센터 관리
+ 서비스 소개
+ 통계 기능
------------
## TA_IN 기능 설명
### [회원가입]
1. 일반 회원가입
> + 카카오맵 API 사용
> + 회원가입 완료 후 인증 메일 전송 기능
2. 비즈니스 회원가입
> + 일반 회원가입 후 비즈니스 정보 입력, 승인 후 계정 완료
### [로그인]
1. 이메일 인증 유무 체크 기능
2. 세션값 저장(아이디)
### [헤더]
<img width="1680" alt="스크린샷 2021-01-25 오후 9 42 27" src="https://user-images.githubusercontent.com/72774483/106257583-15f9b180-6260-11eb-8ba8-324b6045027f.png">

1. WebSocket을 이용한 실시간 알림 기능
> + 새로운 알림, 새로운 메세지 유무 표시 기능
2. 팔로우 하는 계정 로그인 유무 확인 기능
3. 해시태그, 계정 아이디 자동 검색어 완성 기능

<img width="652" alt="스크린샷 2021-02-04 오후 1 36 19" src="https://user-images.githubusercontent.com/72774483/106845446-4624d280-66ee-11eb-9aa8-3d031a267426.png">


#
timeline-mapper.xml
``` xml
<select id="autocomplete" parameterType="string"
		resultType="arrayList" resultMap="resultTimeLine">
        <!-- 해시태그는 '#'를 붙여서 출력, 계정 아이디는 '@'를 붙여서 출력 -->
		select '#'||h_tag word from hashtag
        <!-- 대문자, 소문자 구분 없이 모두 검색한다. -->
		where h_tag like concat('%',concat(UPPER(#{word}),'%')) or
		h_tag like concat('%',concat(LOWER(#{word}),'%'))
		union
		select '#'||h_tag word from businesshashtag
		where h_tag like concat('%',concat(UPPER(#{word}),'%')) or
		h_tag like concat('%',concat(LOWER(#{word}),'%'))
		union
		select '@'||m_id word from member 
        where m_id like concat('%',concat(UPPER(#{word}),'%')) or
		m_id like concat('%',concat(LOWER(#{word}),'%'))
	</select>
```
header.jsp
``` javascript
    // 자동검색어완성 
$(function() {
    $("#search").autocomplete({
        source: function(request, response) {
            var request = $("#search").val();
            console.log(request);
            $.ajax({
                url: "${pageContext.request.contextPath}/autocomplete.do",
                type: "post",
                dataType: "json",
                data: {
                    word: request
                },
                success: function(data) {
                    var value = new Array();
                    for (var i = 0; i < data.length; i++) {
                        // 배열형태로 넣어준다.
                        value.push(data[i].word)
                    }
                    response(
                        $.map(value, function(item) {
                            return {
                                value: item,
                                test: item + "test"
                            }
                        })
                    )
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
    });
```
+ 사용자가 검색을 빠르고 간편하게 할 수 있게 자동 검색어 완성 기능을 추가하였습니다.
+ union을 사용하여 일반 게시글 해시태그, 비즈니스 게시글 해시태그, 계정 아이디가 모두 함께 출력되어 나오며, jsp 파일에서 '@'의 유무를 확인해 해시태그와 계정 아이디를 구분합니다.
+ json 형태로 받아온 데이터는 for문을 이용해 배열 형태로 넣어준 후, 다시 map에 넣어주어 결과를 리턴합니다.

#
### [타임라인]
<img width="1680" alt="스크린샷 2021-01-25 오후 9 41 02" src="https://user-images.githubusercontent.com/72774483/106258086-bbad2080-6260-11eb-9d2a-917569e7d9a1.png">

1. 팔로우하고 있는 계정의 게시물 조회 기능
2. 2개 이상 사진 슬라이드 기능

<img width="715" alt="스크린샷 2021-02-04 오후 5 47 44" src="https://user-images.githubusercontent.com/72774483/106867640-3074d480-6711-11eb-8ae5-d9e8f950fa9d.png">

#
timeline.css
``` css
.timeline_photo {
	width: 660px;
	height: 660px;
	position: relative;
	overflow: hidden;
}

.timephoto {
	width: 660px;
	height: 660px;
	overflow: hidden;
	display: flex;
	position: absolute;
	justify-content: center;
	top: 0px;
	left: 0px;
}

.show_t_img_con {
	width: 660px;
	height: 660px;
	overflow: hidden;
}

.show_t_img {
	width: 660px;
	z-index: 2;
}
``` 
timeline.jsp
``` javascript
var slideWrapper = document.querySelector('.timeline_photo' + t_id);
var slides = document.querySelectorAll('.show_t_img_con' + t_id);
var totalSlides = slides.length;
var sliderWidth = slideWrapper.clientWidth;
var slideIndex = 0;
var slider = document.querySelector('.photo' + t_id);
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
var nextBtn = document.querySelector('.slide_btn_next' + t_id);
var prevBtn = document.querySelector('.slide_btn_prev' + t_id);
nextBtn.addEventListener('click', function() {
    plusSlides(1);
});
prevBtn.addEventListener('click', function() {
    plusSlides(-1);
});
```
+ 슬라이드는 타임라인, 프로필 페이지, 게시물 페이지, 스토리 페이지에 있는 기능입니다.
+ 이미지의 넓이와 개수로 버튼을 누를 때마다 x좌표를 바꿔줍니다.

#
3. 댓글&답글 작성, 수정, 삭제, 신고 기능
> + 글 작성자와 접속자 체크 후 다르게 나타내는 기능
4. 추천 계정 팔로우 기능
> + 추천계정은 내가 팔로우하고 있는 계정이 팔로우하는 계정 랜덤 추천
5. 좋아요 표시 기능
> + 좋아요 표시, 취소에 따른 좋아요 총 개수 변화
6. 주소 공유 기능
7. AJAX를 이용한 무한 스크롤
### [검색 완료 페이지]
<img width="1680" alt="스크린샷 2021-01-25 오후 9 41 36" src="https://user-images.githubusercontent.com/72774483/106257935-8dc7dc00-6260-11eb-8fe9-43b6d6561ac1.png">

1. 해시태그, 계정 '#', '@'에 따른 분류로 다른 페이지로 이동 기능

#
header.jsp
``` javascript
// 해시태그, 계정 검색 분류
$("#search").on("keypress", function(event) {
    // 검색 버튼이 아닌 Enter 눌렀을 때 이벤트 발생
    if (window.event.keyCode == 13) {
        var at = "@";
        var hashtag = $("#search").val();
        // 사용자가 입력한 검색어가 '@'로 시작할 때
        if (hashtag.startsWith(at)) {
            // '@'를 없애준다.
            hashtag = hashtag.replace(/[@]/g, '');
	    // 개인 계정 프로필로 이동
	    var url = "${pageContext.request.contextPath}/gnMain?m_id=" + hashtag;
	    $(location).attr('href', url);
               
            // '@'로 시작하는 것이 아닌 검색어
        } else {
            // '#'이 있다면 없애준다.
            hashtag = hashtag.replace(/[#]/g, '');
            // 검색 완료 페이지로 이동
            var url = "${pageContext.request.contextPath}/explore?hashtag=" + hashtag;
            $(location).attr('href', url);

        }
    }
});
```

+ '@'의 유무를 확인해 해시태그와 계정 아이디를 구분합니다.
+ '@'로 시작하지 않을 때 '#'가 있다면 #를 삭제하고 검색 결과 화면으로 이동합니다.

#

2. 해당 해시태그를 포함한 게시물 조회 기능
3. AJAX를 이용한 무한 스크롤
#
timeline.jsp
``` javascript
// 스크롤 페이징
// page선언
var page = 1; 

$(function() { 
    // 리스트 추가 조회
    getList(page); 
    // 첫 화면 로드시 page 증가.
    page++;
});

//스크롤이 최하단으로 내려가면 리스트 조회 후 page 증가.
$(window).scroll(function() { 
    if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
        getList(page); // 리스트 추가 조회
        page++;
    }
});

// 리스트 추가 조회
function getList(page) { 
    $.ajax({
        url: 'timeLineScroll.do',
        method: 'post',
        data: {
            "page": page
        },
        dataType: 'json',
        success: function(resp) {
            var data = resp.list.length;
            var htmls = "";
            if (page == 1) { //페이지 1일 경우 id가 page인 html을 비운다.
                $("#page").html("");
            }
            console.log(resp.currentPage + ":" + resp.maxPage);
            if (resp.currentPage <= resp.maxPage) {
                if (data > 0) {
                    for (var i = 0; i < data; i++) {
                        htmls += // 나타낼 코드
                    }
                }
```
TimeLineController.java
``` java
// 게시물 스크롤 페이징
@ResponseBody
@RequestMapping(value="/timeLineScroll.do", method = RequestMethod.POST)
public HashMap<String, Object> timeLineScroll(Model model, HttpServletRequest request,
		@RequestParam(name="page", defaultValue = "1") int page) {
	HashMap<String, Object> result = new HashMap <String,Object>();
	HttpSession session = request.getSession();
	String my_name = (String) session.getAttribute("my_name");
	int currentPage=page;
	int listCount=tService.timeLineListCount(my_name);
	int maxPage=(int)((double)listCount/LIMIT+0.9);
	List<TimeLine> logList = tService.showTimeLineListPage(my_name, currentPage, LIMIT);
	result.put("count", tService.timeLineListCount(my_name));	// 게시물카운트
	result.put("currentPage", currentPage);				// 현재 페이지
	result.put("maxPage", maxPage);						// 최대 페이지
	result.put("list", logList);	// 게시물 텍스트정보
	System.out.println("list:"+ logList);
	return result;
}
```	

+ 스크롤이 하단에 닿으면 다음 Ajax를 이용해 다음 페이지의 데이터를 보여주는 기능입니다.
+ 보여줄 데이터가 많을 시 속도 저하와 서버 과부하를 예방하기 위해 추가하였습니다.
+ 추후 수정 사항 : 스크롤이 하단에 닿았을 때 좋아요 및 댓글 기능에서 페이지 수 만큼 실행되는 오류가 있습니다.

#
### [일반 계정 프로필 페이지]
<img width="1680" alt="스크린샷 2021-01-25 오후 9 41 08 1" src="https://user-images.githubusercontent.com/72774483/106258049-b0f28b80-6260-11eb-822a-a6f52dbe2fe3.png">

<img width="1680" alt="스크린샷 2021-01-25 오후 9 41 16" src="https://user-images.githubusercontent.com/72774483/106258000-a33d0600-6260-11eb-8944-c3bf76c4f730.png">

1. 계정 아이디와 접속자, 팔로우 유무 체크 후 다르게 나타나는 아이콘
2. 계정 신고 기능
3. AJAX를 이용한 무한 스크롤
4. 게시글 클릭 시 모달
> + 2개 이상 사진 슬라이드 기능
> + 댓글&답글 작성, 수정, 삭제, 신고 기능
5. 팔로우, 팔로우 취소 기능
### [일반 게시글 페이지]
<img width="1680" alt="스크린샷 2021-01-25 오후 9 53 13" src="https://user-images.githubusercontent.com/72774483/106257118-7a684100-625f-11eb-82f1-55d1e31ed5bc.png">

1. 단일 게시글 조회 기능
2. 게시글 클릭 시 모달
> + 2개 이상 사진 슬라이드 기능
> + 댓글&답글 작성, 수정, 삭제, 신고 기능
### [비즈니스 계정 프로필 페이지]
1. 계정 아이디와 접속자, 팔로우 유무 체크 후 다르게 나타나는 아이콘
2. 계정 신고 기능
3. AJAX를 이용한 무한 스크롤
4. 게시글 클릭 시 모달
> + 2개 이상 사진 슬라이드 기능
> + 댓글&답글 작성, 수정, 삭제, 신고 기능
5. 팔로우, 팔로우 취소 기능
6. 옵션 선택 후 장바구니에 추가 기능
### [계정 설정 페이지]
1. 회원 정보 수정 기능
2. 비즈니스 계정 전환 기능
3. 좋아요한 목록, 장바구니, 구매목록 조회 기능
4. 주문이 들어온 제품 상태 변경 기능
### [주문 페이지]
1. 옵션 선택 후 그에 따른 총액 계산 기능
2. I'mport를 이용한 결제 기능
### [게시글 작성 페이지]
<img width="1680" alt="스크린샷 2021-01-25 오후 9 41 45" src="https://user-images.githubusercontent.com/72774483/106257894-81dc1a00-6260-11eb-8c27-7db069a8c378.png">


1. 여러 이미지 파일 업로드 기능
#
gnWrite-mapper.xml
``` xml
<!-- 텍스트 업로드 -->
<insert id="insertboard" parameterType="GnWrite"
	flushCache="true" statementType="PREPARED" timeout="20">
	insert into board
	(B_ID, M_ID, B_CONTENT) values
	('BO'||TO_CHAR(SYSDATE,'RRMMDD')||LPAD(#{seq},3,'0'),
	#{my_name},
	#{b_content})
</insert>

<!-- 다중 파일 업로드 -->
<insert id="insertboardimg" parameterType="GnWrite"
    flushCache="true" statementType="PREPARED" timeout="20">
    <!-- 10개까지 이미지 업로드 가능 -->
    insert into
    boardadd values(
    'BO'||TO_CHAR(SYSDATE,'RRMMDD')||LPAD(#{seq},3,'0'),
    #{b_img1}, #{b_img2}, #{b_img3}, #{b_img4},
    #{b_img5}, #{b_img6}, #{b_img7}, #{b_img8}, #{b_img9}, #{b_img10})
</insert>
```
gnWriteController.java
``` java
@RequestMapping(value = "/insertboard.do", method = RequestMethod.POST)
public ModelAndView insertboard(GnWrite gw, @RequestParam(name = "upfile") MultipartFile report,
        MultipartHttpServletRequest request, ModelAndView mv, @RequestParam(name = "h_tag") String h_tag,
        @RequestParam(name = "seq") int seq) {

// 배열 생성
    String[] bImgList = { gw.getB_img1(), gw.getB_img2(), gw.getB_img3(), gw.getB_img4(), gw.getB_img5(),
            gw.getB_img6(), gw.getB_img7(), gw.getB_img8(), gw.getB_img9(), gw.getB_img10() };
    try {
        if (request != null && !request.equals("")) {
            uploadFiles(request);
        }
        System.out.println("게시물 등록 파일저장성공");
        List<MultipartFile> fileList = request.getFiles("upfile");
        for (int i = 0; i < fileList.size(); i++) {
            bImgList[i] = fileList.get(i).getOriginalFilename();
        }

        // set 되지 않은 컬럼에는 null 표시
        gw.setB_img1(bImgList[0]);
        gw.setB_img2(bImgList[1]);
        gw.setB_img3(bImgList[2]);
        gw.setB_img4(bImgList[3]);
        gw.setB_img5(bImgList[4]);
        gw.setB_img6(bImgList[5]);
        gw.setB_img7(bImgList[6]);
        gw.setB_img8(bImgList[7]);
        gw.setB_img9(bImgList[8]);
        gw.setB_img10(bImgList[9]);
        gwService.insertboard(gw);
        gwService.insertboardimg(gw);

        // hashtag insert
        int h_taglen = h_tag.length();
        if (h_taglen != 0) {

            // 해시태그는 '#해시태그1 #해시태그2 #해시태그3' 으로 입력되기 때문에
            // split을 위해서 맨 앞의 '#'을 잘라주기 위해 substring(1)을 사용했다.
            // 여기서 substring을 사용했을 때 null 값이 들어오면 에러가 발생하기 때문에
            // h_tag의 length를 먼저 확인해주고 0이 아닐 때의 조건을 주었다.
            h_tag = h_tag.substring(1);
            // " #"을 split 해주어 array에 넣어준다.
            String[] array = h_tag.split(" #");
            for (int i = 0; i < array.length; i++) {
                gw.setH_tag(array[i]);
                gwService.insertboardhashtag(gw);
            }
        }
        mv.setViewName("redirect:/timeLine");
    } catch (Exception e) {
        e.printStackTrace();
    }
    return mv;
}

public void uploadFiles(MultipartHttpServletRequest request) {
    List<MultipartFile> fileList = request.getFiles("upfile");
    // 파일 저장 위치
    String root = request.getSession().getServletContext().getRealPath("resources");
    String savePath = root + "//uploadFiles";
    File folder = new File(savePath);

    // 폴더가 없다면 새로 만들어 준다.
    if (!folder.exists()) {
        folder.mkdir();
    }
    String filePath = null;
    for (MultipartFile mf : fileList) {
        System.out.println("originFileName : " + mf.getOriginalFilename());
        filePath = folder + "/" + mf.getOriginalFilename();
        System.out.println("파일 경로 : " + filePath);
        try {
            mf.transferTo(new File(filePath));
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
```
+ 여러 파일을 업로드 하는 코드입니다.
+ 배열에 넣어주어 여러 파일을 업로드 하였습니다.
+ 해시태그는 substring으로 첫 '#'을 없애주고 ' #'을 기준으로 split을 사용해서 여러개의 해시태그를 insert 해주었습니다.


#
2. 사진 필터 적용 기능


<img width="1680" alt="스크린샷 2021-02-02 오후 9 42 28" src="https://user-images.githubusercontent.com/72774483/106693574-1c01e080-661a-11eb-9510-2bd30c2b985d.png">

#
gnWrite.jsp
``` javascript
// 사진 수정
var canvas1 = $('#canvas1')[0];
// 이미지는 하나씩만 수정 가능 함
var ctx = canvas1.getContext('2d');

function drawImageData(image) {
    image.height *= canvas1.offsetWidth / image.width;
    image.width = canvas1.offsetWidth;

    if (image.height > canvas1.offsetHeight) {
        image.width *= canvas1.offsetHeight / image.height;
        image.height = canvas1.offsetHeight;
    }

    ctx.drawImage(image, 0, 0, image.width, image.height);
    console.log(ctx.getImageData(0, 0, canvas1.width, canvas1.height));
}

// input type='file'에서 변화가 있을 때
$('#loadButton').on('change', function(e) {
    // 이미지는 하나씩만 수정 가능 함
    var file = e.target.files[0];
    var fileReader = new FileReader();

    fileReader.onload = function(e) {
        var image = new Image();
        image.src = e.target.result;
        image.onload = function() {
            drawImageData(image);
        }
    };

    fileReader.readAsDataURL(file);
});

// 수정본 다운로드
$("#canvas_down").on('click', function() {
    var dataURL = canvas1.toDataURL('image/png');
    dataURL = dataURL.replace(/^data:image\/[^;]*/, 'data:application/octet-stream');
    dataURL = dataURL.replace(/^data:application\/octet-stream/, 'data:application/octet-stream;headers=Content-Disposition%3A%20attachment%3B%20filename=Canvas.png');
    // a태그를 만들고
    var aTag = document.createElement('a');
    // 클릭하면 'from_canvas.png'의 이름으로 저장됨
    aTag.download = 'from_canvas.png';
    aTag.href = dataURL;
    aTag.click();
});

// 필터 클릭
$('#invertFilter').on('click', function() {
    var pixels = ctx.getImageData(0, 0, canvas1.width, canvas1.height);
    var filteredData = invertFilter(pixels, 100);
    ctx.putImageData(filteredData, 0, 0);
});
$('#brightnessFilter').on('click', function() {
    var pixels = ctx.getImageData(0, 0, canvas1.width, canvas1.height);
    var filteredData = brightnessFilter(pixels, 100);
    ctx.putImageData(filteredData, 0, 0);
});
$('#grayscaleFilter').on('click', function() {
    var pixels = ctx.getImageData(0, 0, canvas1.width, canvas1.height);
    var filteredData = grayscaleFilter(pixels, 100);
    ctx.putImageData(filteredData, 0, 0);
});
$('#sepiaFilter').on('click', function() {
    var pixels = ctx.getImageData(0, 0, canvas1.width, canvas1.height);
    var filteredData = sepiaFilter(pixels, 100);
    ctx.putImageData(filteredData, 0, 0);
});


// 필터
function invertFilter(pixels) {
    var d = pixels.data;
    for (var i = 0; i < pixels.data.length; i += 4) {
        d[i] = 255 - d[i]; // R
        d[i + 1] = 255 - d[i + 1]; // G
        d[i + 2] = 255 - d[i + 2]; // B
        d[i + 3] = 255; // Alpha
    }
    return pixels;
}

function brightnessFilter(pixels, value) {
    var d = pixels.data;
    for (var i = 0; i < d.length; i += 4) {
        d[i] += value / 3;
        d[i + 1] += value / 3;
        d[i + 2] += value / 3;
    }
    return pixels;
}

function grayscaleFilter(pixels) {
    var d = pixels.data;
    for (var i = 0; i < d.length; i += 4) {
        var r = d[i];
        var g = d[i + 1];
        var b = d[i + 2];

        var v = 0.2126 * r + 0.7152 * g + 0.0722 * b;
        d[i] = d[i + 1] = d[i + 2] = v
    }
    return pixels;
}

function sepiaFilter(pixels) {
    var d = pixels.data;
    for (var i = 0; i < d.length; i += 4) {
        var r = d[i];
        var g = d[i + 1];
        var b = d[i + 2];

        d[i] = r * 0.3588 + g * 0.7044 + b * 0.1368;
        d[i + 1] = r * 0.2990 + g * 0.5870 + b * 0.1140;
        d[i + 2] = r * 0.2392 + g * 0.4696 + b * 0.0912;
    }
    return pixels;
}
```

+ 파일을 선택하고, 필터를 적용하는 코드입니다.
+ 총 네 개의 필터를 추가하였으며 추후 추가할 예정입니다.
+ 필터 추가 후 img의 src로 저장하는 것이 아닌 canvas에 복사된 이미지를 편집하고 저장하기 위해 canvas 태그를 사용하였습니다.

#
3. 웹캠 캡쳐 기능

<img width="1680" alt="스크린샷 2021-02-02 오후 9 41 38" src="https://user-images.githubusercontent.com/72774483/106693570-199f8680-661a-11eb-99bb-9f5a7edb891e.png">

#
gnWrite.jsp
``` javascript
// 웹캠 연결
if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
    navigator.mediaDevices.getUserMedia({
        video: true
    }).then(function(stream) {
        // webcam 연결 승인하면 id가 'video'인 곳에 화면이 보여진다.
        var video = document.getElementById('video');
        video.srcObject = stream;
        video.play();
    });
}

// 웹캠 화면 캡쳐
var canvas = document.getElementById('canvas');
var context = canvas.getContext('2d');
var video = document.getElementById('video');
document.getElementById("webcamBtn").addEventListener("click", function() {
    $("#canvas").css("display", "block");
    // 'webcamBtn'을 누르면 가로 500px 세로 375px 사이즈로 캡쳐된다.
    context.drawImage(video, 0, 0, 500, 375);
});

// download="capture.png"로 정해놓은 a태그를 누르면 다운로드 된다.
document.querySelector('a').addEventListener('click', event =>
    event.target.href = canvas.toDataURL()
);
```

+ 웹캠을 연결하고 캡쳐 후 다운로드 하는 코드입니다.
+ 최초 게시물 작성 페이지 진입 시 웹캠 연결을 허용하냐는 알림이 뜨고, 허용한다면 웹캠으로 사진을 캡쳐 할 수 있습니다.

#
### [스토리]

1. 스토리 작성

<img width="1680" alt="스크린샷 2021-01-25 오후 9 41 55" src="https://user-images.githubusercontent.com/72774483/106257847-712ba400-6260-11eb-8789-9e9fc24ce4d3.png">

> + 이미지 파일 업로드 기능
> + 사진 필터 적용 기능
> + 웹캠 캡쳐 기능
2. 스토리 관리
> + 스토리 사진 다운로드 기능
> + 스토리 삭제 기능
3. 하이라이트 관리

<img width="1680" alt="스크린샷 2021-01-25 오후 9 42 01" src="https://user-images.githubusercontent.com/72774483/106257753-51947b80-6260-11eb-91c4-ee12b84f6849.png">

> + 하이라이트 생성 및 삭제 기능
4. 메세지 전송 기능(추후 구현 예정)
5. 스토리 조회 기능

<img width="1680" alt="스크린샷 2021-02-04 오후 6 30 07" src="https://user-images.githubusercontent.com/72774483/106872960-408fb280-6717-11eb-9e2f-191f4fca815b.png">

#
story-mapper.xml
``` xml
<select id="showAllStory" parameterType="string"
		resultType="Story">
<!-- 일반 스토리 조회 -->
    select listagg(m_id,'|') within group (order by s_date desc) as m_id, s_type
    from (select max(s_date) as s_date, m_id, s_type
    from story join follow 
    on m_id = m_id2
    where m_id1=#{m_id}
    and s_type='G'
    and s_date > SYSDATE - 1
    group by m_id, s_type
    union
    select max(s_date) as s_date, m_id, s_type
    from story 
    where m_id=#{m_id}
    and s_type='G'
    and s_date > SYSDATE - 1
    group by m_id, s_type
    )
    group by s_type
</select>
<select id="showAllAStory" resultType="Story">
<!-- 광고 스토리 조회 -->
    select listagg(m_id,'|')
    within group (order by s_date desc) as m_id, s_type
    from (select
    max(s_date) as s_date, m_id, s_type
    from story join follow on m_id =
    m_id2
    and s_type='A'
    group by m_id, s_type)
    group by s_type
</select>
```
stories.jsp
``` javascript
function split(a, a_t, b, b_t) {
    // a : 일반스토리의 m_id
    // a_t : 일반스토리의 type
    // b : 광고스토리의 m_id
    // b_t : 광고스토리의 type
    var arr = a.split("|");
    var arrb = b.split("|");
    for (i = 0; i < arr.length; i += 3) {
        for (j = i; j < i + 3; j++) {
            if (arr[j] != undefined) {
                $("#story").append(
                    '<div class="story_photo_con" onclick="showeach(\'' + arr[j] + '\',\'' + a_t + '\');">' +
                    '<div class="scon_con scon_con' + arr[j] + '"><div class="scon scon' + arr[j] + a_t + '"></div></div></div>');
            }
        }
        if (arrb[i] != "") {
            $("#story").append(
                '<div class="story_photo_con" onclick="showeach(\'' + arrb[i] + '\',\'' + b_t + '\');">' +
                '<div class="scon_con scon_con' + arrb[i] + '"><div class="scon scon' + arrb[i] + b_t + '"></div></div></div>');
        } 
    }
```

+ 전체 스토리 조회는 일반 스토리 3개와 광고 스토리 1개 순으로 조회할 수 있게 되어있습니다.
+ listagg를 사용해 일반&광고 스토리의 데이터를 가져오고, for문을 돌려 나타냈습니다.

#

### [메세지]
1. 팔로우하고 있는 계정 아이디 자동 검색어 완성 기능
2. WebSocket 양방향 통신을 이용한 1:1 채팅 기능
### [관리자 페이지]
<img width="1320" alt="스크린샷 2021-02-02 오후 8 54 33" src="https://user-images.githubusercontent.com/72774483/106693637-3936af00-661a-11eb-8261-bd1c8a4e0443.png">

1. 기간 설정에 따른 회원가입 수 통계 조회 기능

#
chartTest.jsp
``` javascript
<script type="text/javascript"
    src="https://www.gstatic.com/charts/loader.js"></script>
// google Chart 사용

<script>
$.ajax({
    url : "${pageContext.request.contextPath}/forchartTest.do",
    method : "POST",
    // 시작 날과 끝 날을 지정해 보내준다.
    data : {
        first_date : rfdate,
        second_date : rsdate
    },
    success : function(chart, chartl) {
        var value = new Array();
        for (var i = 0; i < chart.length; i++) {
            // 회원가입 날짜와 회원가입 수를 배열로 넣어준다.
            value.push([ chart[i].m_joindate, chart[i].count ]);
        }
        google.charts.load('current', {
            'packages' : [ 'corechart' ]
        });
        google.charts.setOnLoadCallback(drawChart);

        // 차트를 그려준다.
        function drawChart() {
            var data = new google.visualization.DataTable();
            // 날짜와 회원가입 수 컬럼 추가
            data.addColumn('string', 'date1');
            data.addColumn('number', 'count');
            // 만들어준 배열을 넣어준다.
            data.addRows(value);

            // 차트 style에 관한 설정
            var options = {
                title : 'Register',
                hAxis : {
                    title : 'Date',
                    titleTextStyle : {
                        color : '#333'
                    }
                },
                vAxis : {
                    minValue : 0
                }
            };

            // 'chart_div'에 차트를 그려준다.
            var chart = new google.visualization.AreaChart(
                    document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    },
    error : function(request, status, error) {
        alert("code:" + request.status + "\n"
                + "message:"
                + request.responseText + "\n"
                + "error:" + error);
    }
});
</script>
```
``` xml
<select id="forRegChart" parameterType="TimeLine"
    resultType="arrayList" resultMap="resultTimeLine">
    select count(m_id) count, to_char(m_joindate, 'yyyy/mm/dd') m_joindate
    from member where m_joindate between #{first_date} and #{second_date}
    group by to_char(m_joindate, 'yyyy/mm/dd') order by m_joindate asc
</select>
```

+ input type="date"에서 받아온 value를 Ajax로 보내주어 차트를 구성할 데이터를 받아오는 방식입니다.
+ 필요한 컬럼은 '회원가입 날짜'와 '회원가입 수'이며 배열로 넣어주어 차트를 완성했습니다.

#

2. 신고 관리
> + 신고된 회원, 게시글 조회 기능
> + 신고된 회원, 게시글 삭제 기능
3. 회원에게 이메일 전송 기능
4. 게시글, 회원 조회 기능
5. 탈퇴 회원 조회 기능
### [고객 센터]
<img width="1680" alt="스크린샷 2021-01-25 오후 9 42 44" src="https://user-images.githubusercontent.com/72774483/106257526-024e4b00-6260-11eb-969b-a702c45a70d0.png">

1. 각 링크로 이동 기능
2. 탈퇴

<img width="1680" alt="스크린샷 2021-01-25 오후 9 43 11" src="https://user-images.githubusercontent.com/72774483/106257444-e21e8c00-625f-11eb-9c9e-d31d43060865.png">

#
out.jsp
``` javascript
var today = new Date();
var b = document.getElementById("chkdatee");
var htmls2 = "";

htmls2 += '<div id="dates2" style="color:#262626;">삭제를 클릭하시면 회원님의 프로필과 계정 상세 정보는 ' + today + '에 삭제되며 모든 게시글과 댓글은 복구할 수 없습니다.</div>';
$(b).html(htmls2);
```
#

> + 비밀번호 체크 기능
> + 사이트 개선을 위한 탈퇴 이유 수집 기능
> + 세션값 삭제 기능
### [로그아웃]
> 세션값 삭제 기능
------------
## Document
+ Detailed Document : can be found in [this Link.](https://drive.google.com/drive/folders/1IeWR4BBKugRTOphRTcaBkhKF0DDV16j3?usp=sharing)
1. 기능정의서

<img width="840" alt="스크린샷 2021-01-29 오후 6 38 17" src="https://user-images.githubusercontent.com/72774483/106258635-6e7d7e80-6261-11eb-8be5-9f401a4c8d02.png">

2. 유스케이스

<img width="840" alt="스크린샷 2021-01-29 오후 6 38 27" src="https://user-images.githubusercontent.com/72774483/106258673-7dfcc780-6261-11eb-85a7-39edc1484091.png">

3. UI 설계서

<img width="840" alt="스크린샷 2021-01-29 오후 6 38 37" src="https://user-images.githubusercontent.com/72774483/106258736-92d95b00-6261-11eb-9688-5e9ac7110a1f.png">

4. ERD

<img width="1238" alt="스크린샷 2021-02-04 오후 8 12 55" src="https://user-images.githubusercontent.com/72774483/106885275-b864d980-6725-11eb-98ff-7ef86e4cf839.png">

> + TA_IN은 로그인 후에만 이용할 수 있는 사이트로, 대부분의 테이블이 Member 테이블의 m_id(계정 아이디)를 부모키로 가지고 있습니다.
> + 게시판은 일반 게시판과 비즈니스 게시판으로 분리되어 있으며, 각 게시판에 대한 좋아요, 신고, 이미지 파일 테이블들도 일반과 비즈니스가 분리되어 있습니다.
> + 각 게시판에 대한 테이블들은 b_id(일반 게시판 번호)와 bb_id(비즈니스 게시판 번호)를 부모키로 가지고 있습니다.
> + g_seq, b_seq, s_seq 세 개의 시퀀스를 사용하고 있으며 각 일반 게시판, 비즈니스 게시판, 스토리에 쓰이는 시퀀스입니다.

5. 테이블 정의서

<img width="841" alt="스크린샷 2021-01-29 오후 6 39 07" src="https://user-images.githubusercontent.com/72774483/106258793-a8e71b80-6261-11eb-956d-1206d41e540e.png">

6. 클래스 다이어그램

<img width="838" alt="스크린샷 2021-01-29 오후 6 39 24" src="https://user-images.githubusercontent.com/72774483/106258817-b4d2dd80-6261-11eb-9255-7c766f29f161.png">

7. 시퀀스 다이어그램

<img width="839" alt="스크린샷 2021-01-29 오후 6 39 36" src="https://user-images.githubusercontent.com/72774483/106258847-c1573600-6261-11eb-8573-fb1316ff736d.png">

------------
## 추후 구현 예정 기능
1. 스토리 메세지 전송 기능
2. 다크모드
3. 언어 선택 기능
4. 이미지 편집, 웹캠 캡쳐 후 바로 업로드 기능
5. 반응형 UI
