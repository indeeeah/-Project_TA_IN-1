DROP TABLE BoardAdd;
DROP TABLE BusinessBoard;
DROP TABLE Category;
DROP TABLE Follow;
DROP TABLE HashTag;
DROP TABLE BLike;
DROP TABLE BbLike;
DROP TABLE Message;
DROP TABLE ReportBoard;
DROP TABLE ReportMember;
DROP TABLE Board;
DROP TABLE BusinessHashTag;
DROP TABLE ReportBusinessBoard;
DROP TABLE AcceptedAD;
DROP TABLE BusinessMember;
DROP TABLE Out;
DROP TABLE ShoppingBasket;
DROP TABLE Story;
DROP TABLE BusinessBoardAdd;
DROP TABLE OrderDetail;
DROP TABLE OrderManage;
DROP TABLE BusinessBoard;
DROP TABLE Member;

CREATE TABLE Member (
   m_id   varchar2(20)      NOT NULL,
   m_pw   varchar2(20)      NOT NULL,
   m_name   varchar2(20)      NOT NULL,
   m_intro   varchar2(200)    NULL,
   m_email   varchar2(100)      NOT NULL,
   m_addr   varchar2(200)      NOT NULL,
   m_phone   varchar2(13)      NOT NULL,
    m_birth   Date      NOT NULL,
   m_gender   char(1)   CHECK(m_gender IN('M', 'F'))   NOT NULL,
   m_img   varchar2(200)      NULL,
   m_usage   char(1)   DEFAULT 'G'   CHECK(m_usage IN ('G', 'B'))    NOT NULL,
   m_status   number   DEFAULT 0   NOT NULL,
   m_activity   number   DEFAULT 2   NOT NULL,
   m_lastact   Date   DEFAULT sysdate   NOT NULL,
   m_language   char(1)   DEFAULT 'K'   CHECK(m_language IN ('K', 'E'))   NOT NULL
);

insert into Member values ('aaab', 'aaab', '김수민', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaab.jpg', 'G', 0, 2, sysdate, 'K');
insert into Member values ('aaac', 'aaab', '김수민1', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaab.jpg', 'G', 0, 2, sysdate, 'K');
insert into Member values ('aaad', 'aaab', '김수민2', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaab.jpg', 'G', 0, 2, sysdate, 'K');
insert into Member values ('aaae', 'aaab', '김수민3', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaab.jpg', 'G', 0, 2, sysdate, 'K');
insert into Member values ('aaaf', 'aaab', '김수민4', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaab.jpg', 'G', 0, 2, sysdate, 'K');
insert into Member values ('aaag', 'aaab', '김수민5', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaab.jpg', 'G', 0, 2, sysdate, 'K');
insert into Member values ('aaah', 'aaab', '김수민6', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaab.jpg', 'G', 0, 2, sysdate, 'K');
insert into Member values ('aaai', 'aaab', '김수민7', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaab.jpg', 'G', 0, 2, sysdate, 'K');
insert into Member values ('aaaj', 'aaab', '김수민8', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaab.jpg', 'G', 0, 2, sysdate, 'K');
insert into Member values ('aaak', 'aaab', '김수민9', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaab.jpg', 'G', 0, 2, sysdate, 'K');
insert into Member values ('aaal', 'aaab', '김수민10', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaab.jpg', 'G', 0, 2, sysdate, 'K');
insert into Member values ('aaam', 'aaab', '김수민11', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaam.jpg', 'G', 0, 2, sysdate, 'K');
insert into Member values ('aaan', 'aaab', '김수민12', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaan.jpg', 'G', 0, 2, sysdate, 'K');
insert into Member values ('aaao', 'aaab', '김수민13', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaao.jpg', 'G', 0, 2, sysdate, 'K');
insert into Member values ('aaap', 'aaab', '김수민14', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaap.jpg', 'G', 0, 2, sysdate, 'K');
insert into Member values ('aaaq', 'aaab', '김수민15', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaaq.jpg', 'G', 0, 2, sysdate, 'K');
insert into Member values ('aaar', 'aaab', '김수민16', '가가가가', 'aaa@aa.a','경기도', '123456789', sysdate, 'F', 'aaar.jpg', 'G', 0, 2, sysdate, 'K');

commit;

CREATE TABLE BLike (
   b_id   char(11)      NULL,
   m_id   varchar(20)      NOT NULL,
   b_date   Date   DEFAULT sysdate   NOT NULL
);

CREATE TABLE BBLike (
   bb_id   char(11)      NULL,
   m_id   varchar(20)      NOT NULL,
   bb_date   Date   DEFAULT sysdate   NOT NULL
);


CREATE TABLE Board (
   b_id   char(11)      NOT NULL,
   m_id   varchar2(20)      NOT NULL,
   b_title   varchar2(100)      NULL,
   b_content   varchar2(500)      NULL,
   b_type   char(1)   DEFAULT 'G' CHECK(b_type IN ('G', 'C', 'R'))   NOT NULL,
   b_topid   char(11)      NULL,
   b_date   Date   DEFAULT sysdate   NOT NULL
);

insert into board (b_id, m_id, b_type, b_topid) values ('c1', 'aaab', 'C', 'b1');
insert into businessboard (bb_id, m_id, bb_type, bb_topid, bb_price, bb_name, bb_info) values ('c1', 'aaab', 'C', 'bb1', '1', 'n', 'aaaaaa');
select * from businessboard;
select * from board;
desc businessboard;
create table timeline (
t_num number primary key,
m_id varchar2(20) not null);
select * from story;

alter table board add (t_num number);
alter table businessboard add(t_num number);
alter table board add foreign key(t_num) references timeline(t_num);
alter table businessboard add foreign key(t_num) references timeline(t_num);
ALTER TABLE Follow ADD FOREIGN KEY(m_id1) REFERENCES Member(m_id);
create sequence timeline_seq
start with 1 increment BY 1 nomaxvalue;
create sequence total_seq
start with 1 increment by 1 nomaxvalue;

create sequence BOARD_COMMENT_SEQ
start with 1 increment by 1 nomaxvalue;
select * from board;
desc board;
delete board;
delete timeline;
delete businessboard;
insert into timeline values(timeline_seq.nextval, 'aaab');
insert into board (b_id, m_id, b_type, t_num) values ('b1', 'aaab', 'G', TOTAL_SEQ.nextval);
insert into timeline values(timeline_seq.nextval, 'aaac');
insert into BusinessBoard (bb_id, m_id, bb_name, bb_info, bb_price, bb_type, t_num) values ('bb1', 'aaac','bbname','binfo',10000, 'G', TOTAL_SEQ.nextval);
insert into timeline values(timeline_seq.nextval, 'aaac');
insert into BusinessBoard (bb_id, m_id, bb_name, bb_info, bb_price, bb_type, t_num) values ('bb2', 'aaac','bbname','binfo',10000, 'G', TOTAL_SEQ.nextval);
insert into timeline values(timeline_seq.nextval, 'aaad');
insert into board (b_id, m_id, b_type, t_num) values ('b2', 'aaad', 'G', TOTAL_SEQ.nextval);
insert into timeline values(timeline_seq.nextval, 'aaae');
insert into board (b_id, m_id, b_type, t_num) values ('b3', 'aaae', 'G', TOTAL_SEQ.nextval);
insert into timeline values(timeline_seq.nextval, 'aaaf');
insert into board (b_id, m_id, b_type, t_num) values ('b4', 'aaaf', 'G', TOTAL_SEQ.nextval);

select * from timeline;
select * from businessboard;
select * from board;
commit;
select * from follow;

update board set b_content = 'dddd' where b_id='b4';

update businessboard set bb_info='2222' where bb_id='bb2';

select timeline.*, m_img, board.b_id || businessboard.bb_id t_id, b_content||bb_info t_content
, count(blike.b_id)
from timeline join member on timeline.m_id=member.m_id
inner join follow on m_id2 = timeline.m_id
left outer join board on timeline.t_num = board.t_num
left outer join businessboard on timeline.t_num = businessboard.t_num
left outer join boardadd on board.b_id = boardadd.b_id
left outer join businessboardadd on businessboard.bb_id = businessboardadd.bb_id
left outer join blike on blike.b_id = board.b_id
where m_id1='aaab'
or m_id2= 'aaab'
group by blike.b_id,
timeline.t_num, timeline.m_id, m_img, board.b_id || businessboard.bb_id, b_content||bb_info
order by timeline.t_num desc
;

select timeline.*, m_img, a.b_id || aa.bb_id t_id, a.b_content||aa.bb_info t_content
		, b_img1
		||'|'|| b_img2 ||'|'||b_img3 ||'|'||b_img4 ||'|'||b_img5
		||'|'||b_img6
		||'|'||b_img7 ||'|'||b_img8 ||'|'||b_img9 ||'|'||b_img10
		||'|'||
		bb_img1 ||'|'||bb_img2 ||'|'||bb_img3 ||'|'||bb_img4
		||'|'||bb_img5
		||'|'||bb_img6 ||'|'||bb_img7 ||'|'||bb_img8
		||'|'||bb_img9
		||'|'||bb_img10 t_img
		, a.b_type || aa.bb_type t_type, to_char(a.b_date,'YYYY-MM-DD HH24:Mi:SS') ||
		to_char(aa.bb_date,'YYYY-MM-DD HH24:Mi:SS') t_time
        , count(blike.b_id)+count(bblike.bb_id) t_likes
        ,count(c.b_topid)+count(cc.bb_topid)
		from timeline 
        join member on timeline.m_id=member.m_id
		inner join follow on m_id2 = timeline.m_id
		left outer join board a on timeline.t_num = a.t_num
		left outer join businessboard aa on timeline.t_num = aa.t_num
		left outer join boardadd on a.b_id = boardadd.b_id
		left outer join
		businessboardadd on aa.bb_id =
		businessboardadd.bb_id
        left outer join blike on blike.b_id = a.b_id
        left outer join bblike on bblike.bb_id = aa.bb_id
        left outer join board c on c.b_topid = blike.b_id
        left outer join businessboard cc on cc.bb_topid = bblike.bb_id
		where
		m_id1='aaab'
		or m_id2= 'aaab'
        group by blike.b_id, bblike.bb_id, timeline.t_num, timeline.m_id, m_img, 
        a.b_id || aa.bb_id, a.b_content||aa.bb_info, b_img1 ||'|'|| b_img2 ||'|'||b_img3 ||'|'||b_img4 ||'|'||b_img5 ||'|'||b_img6 ||'|'||b_img7 ||'|'||b_img8 ||'|'||b_img9 ||'|'||b_img10 ||'|'|| bb_img1 ||'|'||bb_img2 ||'|'||bb_img3 ||'|'||bb_img4 ||'|'||bb_img5 ||'|'||bb_img6 ||'|'||bb_img7 ||'|'||bb_img8 ||'|'||bb_img9 ||'|'||bb_img10, a.b_type || aa.bb_type, 
        to_char(a.b_date,'YYYY-MM-DD HH24:Mi:SS') || to_char(aa.bb_date,'YYYY-MM-DD HH24:Mi:SS'), c.b_topid, cc.bb_topid
		order by timeline.t_num desc;

select * from board where b_topid='b1';



select timeline.*, m_img, a.b_id || aa.bb_id t_id, a.b_content||aa.bb_info t_content
		, b_img1
		||'|'|| b_img2 ||'|'||b_img3 ||'|'||b_img4 ||'|'||b_img5
		||'|'||b_img6
		||'|'||b_img7 ||'|'||b_img8 ||'|'||b_img9 ||'|'||b_img10
		||'|'||
		bb_img1 ||'|'||bb_img2 ||'|'||bb_img3 ||'|'||bb_img4
		||'|'||bb_img5
		||'|'||bb_img6 ||'|'||bb_img7 ||'|'||bb_img8
		||'|'||bb_img9
		||'|'||bb_img10 t_img
		, a.b_type || aa.bb_type t_type, to_char(a.b_date,'YYYY-MM-DD HH24:Mi:SS') ||
		to_char(aa.bb_date,'YYYY-MM-DD HH24:Mi:SS') t_time
        , count(blike.b_id)+count(bblike.bb_id) t_likes
		from timeline 
        join member on timeline.m_id=member.m_id
		inner join follow on m_id2 = timeline.m_id
		left outer join board a on timeline.t_num = a.t_num
		left outer join businessboard aa on timeline.t_num = aa.t_num
		left outer join boardadd on a.b_id = boardadd.b_id
		left outer join
		businessboardadd on aa.bb_id =
		businessboardadd.bb_id
        left outer join blike on blike.b_id = a.b_id
        left outer join bblike on bblike.bb_id = aa.bb_id
		where
		m_id1='aaab'
		or m_id2= 'aaab'
        group by blike.b_id, bblike.bb_id, timeline.t_num, timeline.m_id, m_img,
        a.b_id || aa.bb_id, a.b_content||aa.bb_info, b_img1 ||'|'|| b_img2 ||'|'||b_img3 ||'|'||b_img4 ||'|'||b_img5 ||'|'||b_img6 ||'|'||b_img7 ||'|'||b_img8 ||'|'||b_img9 ||'|'||b_img10 ||'|'|| bb_img1 ||'|'||bb_img2 ||'|'||bb_img3 ||'|'||bb_img4 ||'|'||bb_img5 ||'|'||bb_img6 ||'|'||bb_img7 ||'|'||bb_img8 ||'|'||bb_img9 ||'|'||bb_img10, a.b_type || aa.bb_type, 
        to_char(a.b_date,'YYYY-MM-DD HH24:Mi:SS') || to_char(aa.bb_date,'YYYY-MM-DD HH24:Mi:SS')
		order by timeline.t_num desc;

select * from blike;
select * from bblike;

select * from timeline;

select * from blike;
commit;
insert into blike values ('b1', 'aaad', sysdate);
insert into blike values ('b2', 'aaae', sysdate);
insert into blike values ('b3', 'aaae', sysdate);
insert into blike values ('b4', 'aaae', sysdate);


select timeline.*, b.b_id || bb.bb_id t_id
, b.b_type || bb.bb_type t_type, c.b_id || cc.bb_id, c.b_topid||cc.bb_topid
from timeline join member on timeline.m_id=member.m_id
inner join follow on m_id2 = timeline.m_id
left outer join board b on timeline.t_num = b.t_num
left outer join businessboard bb on timeline.t_num = bb.t_num
left outer join boardadd on b.b_id = boardadd.b_id
left outer join businessboardadd on bb.bb_id = businessboardadd.bb_id
join board c on c.b_topid = b.b_id
join businessboard cc on cc.bb_topid = bb.bb_id
where m_id1='aaab'
or m_id2= 'aaab'
order by timeline.t_num desc
;

select * from board where b_id='b1';

select c.b_id||cc.bb_id comments, c.b_topid || cc.bb_topid topid,c.m_id||cc.m_id c_id, timeline.* from 
board c join board b on c.b_topid = b.b_id
left outer join timeline on b.t_num = timeline.t_num
left outer join businessboard bb on bb.t_num = timeline.t_num
left outer join businessboard cc on cc.bb_topid = bb.bb_id
order by c.b_date desc
;

select * from board;
select * from businessboard;
update businessboard set bb_type='B';

commit;

desc BoardAdd;
insert into BoardAdd values ('b1', 'b1', 'b2', 'b3', 'b4', 'b5', 'b6', 'b7', 'b8', 'b9', 'b10');
insert into BoardAdd values ('b2', 'b11', 'b22', 'b33', 'b44', 'b55', 'b66', 'b77', 'b88', 'b99', 'b100');
insert into BoardAdd values ('b3', 'b111', 'b222', 'b333', 'b444', 'b555', 'b666', 'b777', 'b888', 'b999', 'b100');
insert into BoardAdd values ('b4', 'b1111', 'b2222', 'b3333', 'b4444', 'b5555', 'b6666', 'b7777', 'b8888', 'b9999', 'b10000');
insert into BusinessBoardAdd values ('bb1', 'b1', 'b2', 'b3', 'b4', 'b5', 'b6', 'b7', 'b8', 'b9', 'b10');
insert into BusinessBoardAdd values ('bb2', 'b11', 'b22', 'b33', 'b44', 'b55', 'b66', 'b77', 'b88', 'b99', 'b100');
insert into BoardAdd values ('b3', 'b111', 'b222', 'b333', 'b444', 'b555', 'b666', 'b777', 'b888', 'b999', 'b100');
insert into BoardAdd values ('b4', 'b1111', 'b2222', 'b3333', 'b4444', 'b5555', 'b6666', 'b7777', 'b8888', 'b9999', 'b10000');




commit;


desc businessboard;

drop sequence timeline_seq;
drop sequence total_seq;
CREATE TABLE BusinessBoard (
   bb_id   char(11)      NOT NULL,
   m_id   varchar(20)      NOT NULL,
   bb_name   varchar2(100)      NOT NULL,
   bb_info   varchar2(500)      NOT NULL,
   bb_price   number      NOT NULL,
   bb_option1   varchar2(100)      NULL,
   bb_option2   varchar2(100)      NULL,
   bb_option3   varchar2(100)      NULL,
   bb_option4   varchar2(100)      NULL,
   bb_type      char(1) DEFAULT 'G' CHECK(bb_type IN ('G', 'C', 'R'))   NOT NULL,
   bb_topid      char(11)      NULL,
   bb_date      Date   DEFAULT sysdate   NOT NULL
);

alter table BusinessBoard
drop constraint SYS_C007540;
select * from businessboard;
alter table Businessboard
add constraint SYS_C007540
check (bb_type in ('B', 'C', 'R'));

CREATE TABLE Story (
   m_id   varchar(20)      NOT NULL,
   s_img   varchar2(200)      NOT NULL,
   s_date   Date   DEFAULT sysdate   NOT NULL,
   s_link   varchar2(200)      NULL,
   s_type   char(1)   DEFAULT 'G'   CHECK(s_type IN ('G', 'A'))   NOT NULL
);

insert into Story values('aaab', 'bbb.jpg', sysdate, 'aaa.com', 'G');
insert into Story values('aaac', 'ccc.jpg', sysdate, 'aaa.com', 'G');
insert into Story values('aaad', 'ddd.jpg', sysdate, 'aaa.com', 'G');
insert into Story values('aaae', 'eee.jpg', sysdate, 'aaa.com', 'G');
insert into Story values('aaaf', 'fff.jpg', sysdate, 'aaa.com', 'G');
insert into Story values('aaag', 'ggg.jpg', sysdate, 'aaa.com', 'G');
insert into Story values('aaah', 'hhh.jpg', sysdate, 'hhh.com', 'G');

commit;


CREATE TABLE AcceptedAD (
   m_id   varchar(20)      NOT NULL,
   ad_approval   char(1)   DEFAULT 'N'   CHECK(ad_approval IN ('N', 'Y'))   NOT NULL
);

CREATE TABLE Follow (
   m_id1   varchar(20)      NOT NULL,
   m_id2   varchar(20)      NOT NULL,
   f_date   Date   DEFAULT sysdate   NOT NULL
);


insert into Follow values('aaab', 'aaac', sysdate);
insert into Follow values('aaab', 'aaad', sysdate);
insert into Follow values('aaab', 'aaae', sysdate);
insert into Follow values('aaab', 'aaaf', sysdate);
insert into Follow values('aaab', 'aaag', sysdate);
insert into Follow values('aaab', 'aaah', sysdate);



insert into Follow values('aaae', 'aaab', sysdate);
insert into Follow values('aaae', 'aaac', sysdate);
insert into Follow values('aaae', 'aaad', sysdate);

commit;

CREATE TABLE BusinessMember (
   m_id   varchar(20)      NOT NULL,
   bm_cate   number   CHECK(bm_cate IN (1, 2, 3, 4, 5))      NOT NULL,
   bm_name   varchar2(200)      NOT NULL,
   bm_addr   varchar2(500)      NOT NULL,
   bm_url   varchar2(200)      NULL,
   bm_account   varchar2(200)      NOT NULL,
   bm_qr   varchar2(200)      NULL,
   bm_intro   varchar2(200)      NULL,
   bm_phone   varchar2(20)      NOT NULL,
   bm_approval   char(1)   DEFAULT 'N' CHECK(bm_approval IN ('N', 'Y'))   NOT NULL
);

CREATE TABLE BoardAdd (
   b_id   char(11)      NOT NULL,
   b_img1   varchar2(200)      NULL,
   b_img2   varchar2(200)      NULL,
   b_img3   varchar2(200)      NULL,
   b_img4   varchar2(200)      NULL,
   b_img5   varchar2(200)      NULL,
   b_img6   varchar2(200)      NULL,
   b_img7   varchar2(200)      NULL,
   b_img8   varchar2(200)      NULL,
   b_img9   varchar2(200)      NULL,
   b_img10   varchar2(200)      NULL
);

CREATE TABLE BusinessBoardAdd (
   bb_id   char(11)      NOT NULL,
   bb_img1   varchar2(200)      NULL,
   bb_img2   varchar2(200)      NULL,
   bb_img3   varchar2(200)      NULL,
   bb_img4   varchar2(200)      NULL,
   bb_img5   varchar2(200)      NULL,
   bb_img6   varchar2(200)      NULL,
   bb_img7   varchar2(200)      NULL,
   bb_img8   varchar2(200)      NULL,
   bb_img9   varchar2(200)      NULL,
   bb_img10   varchar2(200)      NULL
);

CREATE TABLE ShoppingBasket (
   m_id   varchar(20)      NOT NULL,
   bb_id   char(11)      NOT NULL,
   sb_date   Date   DEFAULT sysdate   NOT NULL,
   sb_buy   char(1)   DEFAULT 'N'   CHECK(sb_buy IN ('N', 'Y'))   NOT NULL
);

CREATE TABLE Category (
   c_name   varchar2(100)      NULL,
   bb_id   char(11)      NOT NULL,
   m_id   varchar(20)      NOT NULL
);

CREATE TABLE Message (
   m_id   varchar2(20)      NOT NULL,
   m_sender   varchar2(20)      NOT NULL,
   m_text   varchar2(500)      NOT NULL,
   m_time   Date   DEFAULT sysdate   NOT NULL
);

CREATE TABLE HashTag (
   b_id   char(11)      NOT NULL,
   h_tag   varchar2(200)      NULL
);

CREATE TABLE BusinessHashTag (
   bb_id   char(11)      NOT NULL,
   h_tag   varchar2(200)      NULL
);

CREATE TABLE ReportBoard (
   b_id   char(11)      NOT NULL,
   m_id   varchar2(20)      NOT NULL,
   rb_reason   varchar2(500)      NOT NULL
);

CREATE TABLE ReportMember (
   m_id1   varchar2(20)      NOT NULL,
   m_id2   varchar2(20)      NOT NULL,
   rm_reason   varchar2(500)      NOT NULL,
   rm_date   Date   DEFAULT sysdate   NOT NULL
);

CREATE TABLE ReportBusinessBoard (
   bb_id   char(11)      NOT NULL,
   m_id   varchar2(20)      NOT NULL,
   rbb_reason   varchar2(500)      NOT NULL,
   rbb_date   Date   DEFAULT sysdate   NOT NULL
);

CREATE TABLE Out (
   m_id   varchar2(20)      NOT NULL,
   o_reason   char(1)   CHECK(o_reason IN ('S', 'F'))      NOT NULL,
   o_date   Date   DEFAULT sysdate   NOT NULL
);

CREATE TABLE OrderDetail (
   bb_id   char(11)      NOT NULL,
   m_id   varchar2(20)      NOT NULL,
   od_date   Date   DEFAULT sysdate   NOT NULL,
   od_size   char(2)   CHECK(od_size IN ('S', 'M', 'L', 'XL'))   NULL,
   od_amount   number   DEFAULT 1   NOT NULL,
   od_option1   varchar2(200)   NULL,
   od_option2   varchar2(200)   NULL,
   od_option3   varchar2(200)   NULL,
   od_option4   varchar2(200)   NULL,
   od_price   number   NOT NULL
);

CREATE TABLE OrderManage (
   m_id   varchar2(20)      NOT NULL,
   om_content   varchar2(200)   NOT NULL,
   om_price   number   NOT NULL,
   om_status   char(1)   DEFAULT 'N'   CHECK(om_status IN ('N', 'Y', 'F'))   NOT NULL
);


ALTER TABLE Member ADD CONSTRAINT PR_MEMBER PRIMARY KEY(m_id);
ALTER TABLE Board ADD CONSTRAINT PR_BOARD PRIMARY KEY(b_id);
ALTER TABLE Category ADD CONSTRAINT PR_CATEGORY PRIMARY KEY(c_name);
ALTER TABLE BusinessBoard ADD CONSTRAINT PR_BUSINESSBOARD PRIMARY KEY(bb_id);

ALTER TABLE OrderDetail ADD FOREIGN KEY(bb_id) REFERENCES BusinessBoard(bb_id);
ALTER TABLE OrderDetail ADD FOREIGN KEY(m_id) REFERENCES Member(m_id);
ALTER TABLE OrderManage ADD FOREIGN KEY(m_id) REFERENCES Member(m_id);
ALTER TABLE Out ADD FOREIGN KEY(m_id) REFERENCES Member(m_id);
ALTER TABLE Follow ADD FOREIGN KEY(m_id1) REFERENCES Member(m_id);
ALTER TABLE Follow ADD FOREIGN KEY(m_id2) REFERENCES Member(m_id);
ALTER TABLE BLike ADD FOREIGN KEY(m_id) REFERENCES Member(m_id);
ALTER TABLE BLike ADD FOREIGN KEY(b_id) REFERENCES Board(b_id);
ALTER TABLE BbLike ADD FOREIGN KEY(m_id) REFERENCES Member(m_id);
ALTER TABLE BbLike ADD FOREIGN KEY(bb_id) REFERENCES BusinessBoard(bb_id);
ALTER TABLE Board ADD FOREIGN KEY(m_id) REFERENCES Member(m_id);
ALTER TABLE BoardAdd ADD FOREIGN KEY(b_id) REFERENCES BOARD(b_id);
ALTER TABLE ReportBoard ADD FOREIGN KEY(m_id) REFERENCES Member(m_id);
ALTER TABLE ReportBoard ADD FOREIGN KEY(b_id) REFERENCES Board(b_id);
ALTER TABLE HashTag ADD FOREIGN KEY(b_id) REFERENCES Board(b_id);
ALTER TABLE ShoppingBasket ADD FOREIGN KEY(m_id) REFERENCES Member(m_id);
ALTER TABLE ShoppingBasket ADD FOREIGN KEY(bb_id) REFERENCES BusinessBoard(bb_id);
ALTER TABLE Story ADD FOREIGN KEY(m_id) REFERENCES Member(m_id);
ALTER TABLE ReportMember ADD FOREIGN KEY(m_id1) REFERENCES Member(m_id);
ALTER TABLE ReportMember ADD FOREIGN KEY(m_id2) REFERENCES Member(m_id);
ALTER TABLE Message ADD FOREIGN KEY(m_id) REFERENCES Member(m_id);
ALTER TABLE Category ADD FOREIGN KEY(bb_id) REFERENCES BusinessBoard(bb_id);
ALTER TABLE Category ADD FOREIGN KEY(m_id) REFERENCES Member(m_id);
ALTER TABLE BusinessBoard ADD FOREIGN KEY(m_id) REFERENCES Member(m_id);
ALTER TABLE BusinessMember ADD FOREIGN KEY(m_id) REFERENCES Member(m_id);
ALTER TABLE BusinessBoardAdd ADD FOREIGN KEY(bb_id) REFERENCES BusinessBoard(bb_id);
ALTER TABLE AcceptedAD ADD FOREIGN KEY(m_id) REFERENCES Member(m_id);
ALTER TABLE ReportBusinessBoard ADD FOREIGN KEY(m_id) REFERENCES Member(m_id);
ALTER TABLE ReportBusinessBoard ADD FOREIGN KEY(bb_id) REFERENCES BusinessBoard(bb_id);
ALTER TABLE BusinessHashTag ADD FOREIGN KEY(bb_id) REFERENCES BusinessBoard(bb_id);

desc BusinessBoard;
desc follow;
select m_id1 나, m_id2 팔로우, m_img 프로필사진 from member join follow on m_id = m_id2 where m_id1='aaab';

select m_id1, count(m_id2), m_id2, m_img from member join follow on member.m_id = m_id2
inner join story on m_id2 = story.m_id
where m_id1='aaab'
group by m_id2, m_img, m_id1
;

select m_id1, m_id2, m_img, s_date from member join follow on member.m_id = m_id2
inner join story on m_id2 = story.m_id
where m_id1='aaab'
and TO_CHAR(s_date,'YYYYMMDD') = TO_CHAR(SYSDATE,'YYYYMMDD')
group by m_id2, m_img, m_id1, s_date
;

select * from (select rownum rnum, s.* from (select m_id1, m_id2, m_img from member join follow on member.m_id = m_id2
inner join story on m_id2 = story.m_id
where m_id1='aaab'
and s_date > sysdate  - 1
group by m_id2, m_img, m_id1) s) 
;

select m_id1, m_id2, m_img from member join follow on member.m_id = m_id2
inner join story on m_id2 = story.m_id
where m_id1='aaab'
and s_date > sysdate  - 1
group by m_id2, m_img, m_id1;

select * from follow;
select * from member;
select * from story;

select distinct * from (select story.m_id, m_img, m_id1 from story join member on story.m_id=member.m_id
inner join follow on story.m_id = m_id2
where m_id1 = 'aaab'
and s_date > sysdate  - 1
order by s_date desc);

select * from (select story.m_id, m_img, m_id1, max(s_date) as s_date from story join member on story.m_id=member.m_id
inner join follow on story.m_id = m_id2
where m_id1 = 'aaab'
and s_date > sysdate  - 1
group by m_id1, m_img, story.m_id) order by s_date desc
;

update member set m_img='aaac.jpg' where m_id='aaac';
update story set s_date='20/12/21' where m_id='aaag';

commit;

select b.b_id||bb.bb_id, b.m_id||bb.m_id, b.b_content||bb.bb_info, b.b_date||bb.bb_date, b.t_num from board b 
left outer join timeline t on b.t_num = t.t_num 
left outer join businessboard bb on bb.t_num = t.t_num
;
select * from businessboard;
select * from board;
select timeline.*, b.b_id || bb.bb_id t_id
, b.b_type || bb.bb_type t_type, c.b_id || cc.bb_id, c.b_topid||cc.bb_topid
from timeline join member on timeline.m_id=member.m_id
inner join follow on m_id2 = timeline.m_id
left outer join board b on timeline.t_num = b.t_num
left outer join businessboard bb on timeline.t_num = bb.t_num
left outer join boardadd on b.b_id = boardadd.b_id
left outer join businessboardadd on bb.bb_id = businessboardadd.bb_id
join board c on c.b_topid = b.b_id
join businessboard cc on cc.bb_topid = bb.bb_id
where m_id1='aaab'
or m_id2= 'aaab'
order by timeline.t_num desc
;

commit;

select b_id, m_id, b_content, b_date from board where b_topid='b1' order by b_date desc;
select bb_id b_id, m_id, bb_info b_content, bb_date b_date from businessboard where bb_topid='bb1' order by bb_date desc;

select count(*)likechk from blike where b_id='b1' and m_id='aaab';
select count(*)likechk from bblike where bb_id='bb1' and m_id='aaab';
select * from bblike;
select * from blike;

select count(*) from bblike where bb_id='bb2' and m_id='aaab';
delete from bblike;
commit;

delete from blike where b_id='b1' and m_id='aaab';
commit;

select b.b_id, b.m_id, b.b_content, b.b_date, b.b_topid b_topid, a.b_type
		from board b
        left outer join board a on b.b_topid = a.b_id
        where b.b_topid='b4' order by b.b_date desc;

select * from board;
desc board;
insert into board (b_id, m_id, b_type, b_date, b_topid, b_content) values('R3', 'aaab', 'R', sysdate, 'BR201223001', '대댓글 테스트');

select * from businessboard;

select b.bb_id,c.bb_id r_bid,
		b.m_id,c.m_id r_mid, b.bb_info,c.bb_info r_bcontent, b.bb_date,
		c.bb_date r_bdate
		from businessboard b left outer join businessboard c
		on b.bb_id=c.bb_topid where b.bb_topid='bb1' order by b.bb_date,
		c.bb_date desc;
        
        select b.bb_id b_id,c.bb_id r_bid, b.m_id m_id,c.m_id r_mid, b.bb_info b_content,c.bb_info r_bcontent, b.bb_date b_date, c.bb_date r_bdate
		from businessboard b left outer join businessboard c on b.bb_id=c.bb_topid where b.bb_topid='bb1' order by c.bb_date, b.bb_date desc;
        
        select * from blike;
        
select count(b.m_id2), b.m_id2 r_mid, m_img from follow a 
join follow b on a.m_id2 = b.m_id1 
join member on b.m_id2 = m_id
where a.m_id1 = 'aaab' 
and b.m_id2 not in (select m_id2 from follow where m_id1='aaab')
and b.m_id2!='aaab' 
group by b.m_id2, m_img
order by dbms_random.value
;
select * from follow where m_id1='aaab';
select * from follow;
insert into follow (m_id1, m_id2) values ('aaad', 'aaam');
insert into follow (m_id1, m_id2) values ('aaad', 'aaan');
insert into follow (m_id1, m_id2) values ('aaae', 'aaao');
insert into follow (m_id1, m_id2) values ('aaaf', 'aaap');
insert into follow (m_id1, m_id2) values ('aaaf', 'aaaq');
insert into follow (m_id1, m_id2) values ('aaaf', 'aaar');
insert into follow (m_id1, m_id2) values ('aaab', 'aaac');
insert into follow (m_id1, m_id2) values ('aaab', 'aaad');
insert into follow (m_id1, m_id2) values ('aaab', 'aaae');



select * from follow;
delete from follow where m_id1='aaab';

commit;

commit;

select * from member;

select b.b_id b_id, b.m_id,
		b.b_content, b.b_date, b.b_topid b_topid, a.b_type b_type, count(r.b_topid) count
		from board b
		left outer join board a on b.b_topid = a.b_id
        left outer join board r on b.b_id = r.b_topid
		where b.b_topid='b4' group by b.b_id, b.m_id, b.b_content, b.b_date, b.b_topid, a.b_type
		order by b.b_date
		desc;
        
        commit;
        
        
        select * from board;
        
        delete from board where b_id='R2';
        
        select b.bb_id b_id, b.m_id m_id,
		b.bb_info b_content, b.bb_date b_date,
		a.bb_type b_type, b.bb_topid
		b_topid, count(r.bb_topid) count
		from businessboard b
		left outer join
		businessboard a on
		b.bb_topid = a.bb_id
		left outer join businessboard r on b.bb_id = r.bb_topid
		where
		b.bb_topid='bb1' group by b.bb_id, b.m_id, b.bb_info, b.bb_date, a.bb_type, 
b.bb_topid order by b.bb_date desc;
        
        select b.bb_id b_id, b.m_id m_id,
		b.bb_info b_content, b.bb_date b_date,
		a.bb_type b_type, b.bb_topid
		b_topid, count(r.bb_topid) count
		from businessboard b
		left outer join
		businessboard a on
		b.bb_topid = a.bb_id
		left outer join businessboard r on b.bb_id = r.bb_topid
		where
		b.bb_topid=#{t_id} order by b.bb_date desc;
        
        
        select * from board;
        delete from board where b_topid='b4';
        delete from board where b_type='R';
        commit;
        
        select * from blike;
        
        delete from (select  l.*, a.*,b.*, t.* from board b 
        left outer join blike l on b.b_id = l.b_id
        left outer join board a on b.b_id = a.b_topid
        left outer join timeline t on b.t_num = t.t_num
        where b.b_id='BR201223001');
        
        begin
        delete from blike where b_id='BR201223003';
        delete from board where b_topid = 'BR201223003';
        delete from (select board.*, timeline.* from board left outer join timeline on board.t_num = timeline.t_num where board.b_id='BR201223003');
        end;
        /
        commit;