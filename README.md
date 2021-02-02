# TA_IN 1.0.0
------------
## Contents
1. [프로젝트 계획 이유](#프로젝트-계획-이유)
2. [설계의 주안점](#설계의-주안점)
3. [Using](#Using)
4. [업무일정](#업무일정)
5. [TA_IN 기능 설명](#TA_IN-기능-설명)
6. [Document](#Document)
7. [추후 구현 예정 기능](#추후-구현-예정-기능)
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
2. BackEnd - JACA(JDK 1.8), Spring, Servlet, Mybatis
3. OS - Windows, MacOS
4. Library&API - Google Developers Charts, kakaomap, WebSocket, I'mport, JBCrypt, Commons FileUpload, JavaMail API JAR, Gson, JSON.simple, Spring JDBC, Oracle JDBC Driver
5. IDE - Spring Tool Suite 3
6. Server - Tomcat(v8.5)
7. Document - Google Drive, StarUML, Eclipse
8. Cl - Github, git
9. DataBase - Oracle DataBase 11g
------------
## 업무일정
<img width="840" alt="스크린샷 2021-01-29 오후 6 36 52" src="https://user-images.githubusercontent.com/72774483/106258404-1e9eb780-6261-11eb-9a55-37419ccac6bd.png">

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
<img width="1680" alt="스크린샷 2021-01-25 오후 9 42 27" src="https://user-images.githubusercontent.com/72774483/106257583-15f9b180-6260-11eb-8ba8-324b6045027f.png">

1. WebSocket을 이용한 실시간 알림 기능
> + 새로운 알림, 새로운 메세지 유무 표시 기능
2. 팔로우 하는 계정 로그인 유무 확인 기능
3. 해시태그, 계정 아이디 자동 검색어 완성 기능
### [타임라인]
<img width="1680" alt="스크린샷 2021-01-25 오후 9 41 02" src="https://user-images.githubusercontent.com/72774483/106258086-bbad2080-6260-11eb-9d2a-917569e7d9a1.png">

1. 팔로우하고 있는 계정의 게시물 조회 기능
2. 2개 이상 사진 슬라이드 기능
3. 댓글&답글 작성, 수정, 삭제, 신고 기능
> + 글 작성자와 접속자 체크 후 다르게 나타내는 기능
4. 추천 계정 팔로우 기능
> + 추천계정은 내가 팔로우하고 있는 계정이 팔로우하는 계정 랜덤 추천
5. 좋아요 표시 기능
> + 좋아요 표시, 취소에 따른 좋아요 총 개수 변화
6. 주소 공유 기능
7. AJAX를 이용한 무한 스크롤
### [검색 완료 페이지]
<img width="1680" alt="스크린샷 2021-01-25 오후 9 41 36" src="https://user-images.githubusercontent.com/72774483/106257935-8dc7dc00-6260-11eb-8fe9-43b6d6561ac1.png">

1. 해시태그, 계정 '#', '@'에 따른 분류로 다른 페이지로 이동 기능
2. 해당 해시태그를 포함한 게시물 조회 기능
3. AJAX를 이용한 무한 스크롤
### [일반 계정 프로필 페이지]
<img width="1680" alt="스크린샷 2021-01-25 오후 9 41 08 1" src="https://user-images.githubusercontent.com/72774483/106258049-b0f28b80-6260-11eb-822a-a6f52dbe2fe3.png">

<img width="1680" alt="스크린샷 2021-01-25 오후 9 41 16" src="https://user-images.githubusercontent.com/72774483/106258000-a33d0600-6260-11eb-8944-c3bf76c4f730.png">

1. 계정 아이디와 접속자, 팔로우 유무 체크 후 다르게 나타나는 아이콘
2. 계정 신고 기능
3. AJAX를 이용한 무한 스크롤
4. 게시글 클릭 시 모달
> + 2개 이상 사진 슬라이드 기능
> + 댓글&답글 작성, 수정, 삭제, 신고 기능
5. 팔로우, 팔로우 취소 기능
### [일반 게시글 페이지]
<img width="1680" alt="스크린샷 2021-01-25 오후 9 53 13" src="https://user-images.githubusercontent.com/72774483/106257118-7a684100-625f-11eb-82f1-55d1e31ed5bc.png">

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
<img width="1680" alt="스크린샷 2021-01-25 오후 9 41 45" src="https://user-images.githubusercontent.com/72774483/106257894-81dc1a00-6260-11eb-8c27-7db069a8c378.png">

1. 여러 이미지 파일 업로드 기능
2. 사진 필터 적용 기능
3. 웹캠 캡쳐 기능
### [스토리]

1. 스토리 작성

<img width="1680" alt="스크린샷 2021-01-25 오후 9 41 55" src="https://user-images.githubusercontent.com/72774483/106257847-712ba400-6260-11eb-8789-9e9fc24ce4d3.png">

> + 이미지 파일 업로드 기능
> + 사진 필터 적용 기능
> + 웹캠 캡쳐 기능
2. 스토리 관리

<img width="1680" alt="스크린샷 2021-01-25 오후 9 42 15" src="https://user-images.githubusercontent.com/72774483/106257664-33c71680-6260-11eb-90e7-60e3c424cb30.png">

> + 스토리 사진 다운로드 기능
> + 스토리 삭제 기능
3. 하이라이트 관리

<img width="1680" alt="스크린샷 2021-01-25 오후 9 42 01" src="https://user-images.githubusercontent.com/72774483/106257753-51947b80-6260-11eb-91c4-ee12b84f6849.png">

> + 하이라이트 생성 및 삭제 기능
4. 메세지 전송 기능(추후 구현 예정)
### [메세지]
1. 팔로우하고 있는 계정 아이디 자동 검색어 완성 기능
2. WebSocket 양방향 통신을 이용한 1:1 채팅 기능
### [관리자 페이지]
1. 기간 설정에 따른 회원가입 수 통계 조회 기능
2. 신고 관리
> + 신고된 회원, 게시글 조회 기능
> + 신고된 회원, 게시글 삭제 기능
3. 회원에게 이메일 전송 기능
4. 게시글, 회원 조회 기능
5. 탈퇴 회원 조회 기능
### [고객 센터]
<img width="1680" alt="스크린샷 2021-01-25 오후 9 42 44" src="https://user-images.githubusercontent.com/72774483/106257526-024e4b00-6260-11eb-969b-a702c45a70d0.png">

1. 각 링크로 이동 기능
2. 탈퇴

<img width="1680" alt="스크린샷 2021-01-25 오후 9 43 11" src="https://user-images.githubusercontent.com/72774483/106257444-e21e8c00-625f-11eb-9c9e-d31d43060865.png">


> + 비밀번호 체크 기능
> + 사이트 개선을 위한 탈퇴 이유 수집 기능
> + 세션값 삭제 기능
### [로그아웃]
> 세션값 삭제 기능
------------
## Document
+ Detailed Document : can be found in [this Link.](https://drive.google.com/drive/folders/1IeWR4BBKugRTOphRTcaBkhKF0DDV16j3?usp=sharing)
1. 기능정의서

<img width="840" alt="스크린샷 2021-01-29 오후 6 38 17" src="https://user-images.githubusercontent.com/72774483/106258635-6e7d7e80-6261-11eb-8be5-9f401a4c8d02.png">

2. 유스케이스

<img width="840" alt="스크린샷 2021-01-29 오후 6 38 27" src="https://user-images.githubusercontent.com/72774483/106258673-7dfcc780-6261-11eb-85a7-39edc1484091.png">

3. UI 설계서

<img width="840" alt="스크린샷 2021-01-29 오후 6 38 37" src="https://user-images.githubusercontent.com/72774483/106258736-92d95b00-6261-11eb-9688-5e9ac7110a1f.png">

4. ERD

<img width="840" alt="스크린샷 2021-01-29 오후 6 38 58" src="https://user-images.githubusercontent.com/72774483/106258768-9c62c300-6261-11eb-88bc-9e3483d8abed.png">

5. 테이블 정의서

<img width="841" alt="스크린샷 2021-01-29 오후 6 39 07" src="https://user-images.githubusercontent.com/72774483/106258793-a8e71b80-6261-11eb-956d-1206d41e540e.png">

6. 클래스 다이어그램

<img width="838" alt="스크린샷 2021-01-29 오후 6 39 24" src="https://user-images.githubusercontent.com/72774483/106258817-b4d2dd80-6261-11eb-9255-7c766f29f161.png">

7. 시퀀스 다이어그램

<img width="839" alt="스크린샷 2021-01-29 오후 6 39 36" src="https://user-images.githubusercontent.com/72774483/106258847-c1573600-6261-11eb-8573-fb1316ff736d.png">

------------
## 추후 구현 예정 기능
1. 스토리 메세지 전송 기능
2. 다크모드
3. 언어 선택 기능
4. 이미지 편집, 웹캠 캡쳐 후 바로 업로드 기능
5. 반응형 UI