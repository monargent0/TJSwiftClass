use madang;
# 도서번호가 1인 도서의 이름 구하기
select bookname from book where bookid = 1;

# 가격이 20000원 이상인 도서의 이름
select bookname from book where price >= 20000;

# 박지성이 구매한 도서의 수
select count(*) from book b, customer c, orders o
where c.name = '박지성' and b.bookid = o.bookid and c.custid = o.custid;

# 마당서점의 도서의 총 갯수
select count(*) from book;

# 이름의 성이 김씨인 고객의 이름과 주소
select name, address from customer where name like '김%';
select name, address from customer where name like '%이';
select name, address from customer where name like '%김%';


# 현재일자 
select now() as date;