-- 다음 순서대로 테이블을 삭제하면 의존관계에 걸리지 않고 모두 삭제 가능합니다. (생성시에는 반대 순서대로 하면 됩니다.)
DROP TABLE preference;
DROP TABLE recent_lookbook;
DROP TABLE book_list;
DROP TABLE cart;
DROP TABLE WISHLIST;

DROP TABLE book_category;
DROP TABLE third_cate;
DROP TABLE second_cate;
DROP TABLE first_cate;

DROP TABLE accuse;
DROP TABLE ACCUSE_CATE;
DROP TABLE review_reply;
DROP TABLE review;
DROP TABLE PAYMENT;
DROP TABLE bookm;
-- BOOKM DROP

DROP TABLE publisher;
DROP TABLE authoredit;
DROP TABLE author;
DROP TABLE country;
DROP TABLE series;
-- SERIES DROP

DROP TABLE board_contact;
DROP TABLE BOARD_FREQUENCY;
DROP TABLE qna_cate2;
DROP TABLE qna_cate1;
-- QNA_CATE1 DROP

DROP TABLE cash_charge;
DROP TABLE cash_charge_type;
DROP TABLE CASH_CHARGE_MENU;
DROP TABLE point;
DROP TABLE MEMBER;
-- MEMBER DROP