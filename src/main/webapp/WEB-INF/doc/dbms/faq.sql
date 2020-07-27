/**********************************/
/* Table Name: faq */
/**********************************/

drop table  faq;

CREATE TABLE faq(
    faqno                  NUMBER(10) NOT NULL primary key,
    cateno                  NUMBER(10)         NOT NULL ,
    faq_categrp            VARCHAR2(100) NOT NULL,
    faq_word               VARCHAR2(300)    NULL , 
    faq_title                 VARCHAR2(300)    NOT NULL,
    faq_content            CLOB    NOT NULL,
    FOREIGN KEY (cateno) REFERENCES fcate (cateno)
);

COMMENT ON TABLE faq is '자주 하는 질문';
COMMENT ON COLUMN faq.faqno is '질문 번호';
COMMENT ON COLUMN faq.faq_categrp is '질문유형';
COMMENT ON COLUMN faq.faq_word is '검색어';
COMMENT ON COLUMN faq.faq_title is '질문제목';
COMMENT ON COLUMN faq.faq_content is '질문내용';

DROP SEQUENCE faq_seq;
CREATE SEQUENCE faq_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
--등록
INSERT INTO faq(faqno, cateno, faq_categrp, faq_word, faq_title, faq_content)
VALUES(faq_seq.nextval, 1, '이용권/요금', '요금', 'SOLMUSIC에서 구매 가능한 이용권의 종류를 알고 싶어요.',
        'SOLMUSIC에서 구매 가능한 이용권은 아래와 같습니다. 1.모바일 이용권, 2.올인원 이용권');

INSERT INTO faq(faqno, cateno, faq_categrp, faq_word, faq_title, faq_content)
VALUES(faq_seq.nextval, 2, '회원정보/로그인', '탈퇴', '계정을 탈퇴하고 싶어요',
        '홈화면 > 설정버튼 > 정보관리 > 회원탈퇴를 진행해주세요.');
        
INSERT INTO faq(faqno, cateno, faq_categrp, faq_word, faq_title, faq_content)
VALUES(faq_seq.nextval, 1, '이용권/요금', '요금', 'SOLMUSIC에서 구매 가능한 이용권의 가격을 알고 싶어요.',
        'SOLMUSIC의 이용권 가격은 아래와 같습니다. 1.모바일 이용권 1억, 2.올인원 이용권 2억');    

commit;
   
-- 전체목록
SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content
FROM faq 
ORDER BY faqno DESC;

-- 유형별 목록
SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content
FROM faq 
WHERE cateno = 1
ORDER BY faqno DESC;

-- 유형별 검색 목록
-- title, content, word column search
SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content
FROM faq
WHERE cateno = 1 AND (faq_title LIKE '%요금%' OR faq_content LIKE '%요금%' OR faq_word LIKE '%요금%')
ORDER BY faqno DESC;

--검색 레코드 갯수
-- 전체 레코드 갯수
SELECT COUNT(*) as cnt
FROM faq
WHERE faq_categrp='회원정보/로그인';

SELECT COUNT(*) as cnt
FROM faq
WHERE faq_categrp='회원정보/로그인' AND (faq_title LIKE '%탈퇴%' OR faq_content LIKE '%탈퇴%' OR faq_word LIKE '%탈퇴%')

-- 1건 조회
SELECT faqno, faq_categrp, faq_word, faq_title, faq_content
FROM faq
WHERE faqno = 1;


-- 유형별 조회
SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content
FROM faq 
WHERE cateno = 2;

--join
select c.cateno as c_cateno, c.name as c_name,
         f.faqno, f.cateno, f.faq_categrp, f.faq_word, f.faq_title, f.faq_content
from fcate c, faq f
where (c.cateno=f.cateno) AND c.cateno=1
order by c.cateno ASC;

-- 수정
UPDATE faq 
SET faq_title='제목', faq_content='내용', faq_word='http://'
WHERE faqno = 1;

--삭제
DELETE FROM faq
WHERE faqno=1;

--검색페이징

-- step 1
SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content
FROM faq
WHERE cateno=1  AND faq_word LIKE '%요금%'
ORDER BY faqno DESC;

-- step 2
SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content, rownum as r
FROM (
            SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content
            FROM faq
            WHERE cateno=1  AND faq_word LIKE '%요금%'
            ORDER BY faqno DESC
);

-- step 3, 1 page
SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content, r
FROM (
            SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content, rownum as r
            FROM (
                         SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content
                         FROM faq
                         WHERE faqno=1 AND faq_word LIKE '%요금%'
                         ORDER BY faqno DESC
            )   
)
WHERE r >= 1 AND r <= 10;

--step 3,2 page
SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content, r
FROM (
            SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content, rownum as r
            FROM (
                         SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content
                         FROM faq
                         WHERE cateno=1 AND faq_word LIKE '%탈퇴%'
                         ORDER BY faqno DESC
            )   
)
WHERE r >= 11 AND r <= 20;

commit;