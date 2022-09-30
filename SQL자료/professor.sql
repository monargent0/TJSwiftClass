# 한줄 실행 cmd + enter
use education; # 특정 스키마 사용 선언
SELECT * FROM professor; # 테이블 전체 보기 (* : 전체 선택 , * 자리 : column이름)
# 데이터 삽입 
insert into professor 
(pcode, pname, pdept, pphone) 
values
('p001','김구','컴퓨터 공학과','0001');
# 데이터 업데이트
update professor
set paddress = '서울'
where pcode = 'p001'; # 업데이트 할 데이터 조건 
# 데이터 삭제
delete from professor where pcode = 'p001'; 
# 주의! 동명이인 등의 중복 case가 있기 때문에 delete는 unique한 column으로만 조건을 건다
