1) 테이블 삭제: 자식 -> 부모
② 자식 테이블 삭제: DROP TABLE faq;
③ 부모 테이블 삭제: DROP TABLE fcate;
  
2) 테이블 생성: 부모 -> 자식
② 부모 테이블 먼저 생성: fcate
③ 자식 테이블 생성: faq


drop table fcate;
CREATE TABLE fcate(
		cateno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR(50)		 NOT NULL
);

DROP SEQUENCE fcate_seq;
CREATE SEQUENCE fcate_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
--1 
INSERT INTO fcate(cateno, name)
VALUES(fcate_seq.nextval, '전체');

--2
INSERT INTO fcate(cateno, name)
VALUES(fcate_seq.nextval, '이용권/요금');

--3
INSERT INTO fcate(cateno, name)
VALUES(fcate_seq.nextval, '결제/해지/환불');

--4
INSERT INTO fcate(cateno, name)
VALUES(fcate_seq.nextval, '회원정보/로그인');

--5
INSERT INTO fcate(cateno, name)
VALUES(fcate_seq.nextval, '플레이어/재생목록');

--6
INSERT INTO fcate(cateno, name)
VALUES(fcate_seq.nextval, '서비스문의/오류');

SELECT * FROM fcate;

--전체목록
SELECT cateno,name
FROM fcate 
ORDER BY cateno DESC;



SELECT cateno, name
FROM faq_cate
WHERE cateno=1;

commit;


--삭제
DELETE FROM fcate
WHERE cateno = 11;
commit;

--수정
UPDATE faq_cate
SET cateno=1, name='식당'
WHERE cateno = 5;
