use education;

# student table에서 전체 내용 검색하기 
select * from student;

# student table 에서 코드, 이름, 주소만 불러오기 
select scode, sname, saddress from student;

# student table에서 주소가 서울인 학생의 코드, 이름, 전공 불러오기 
select scode, sname, sdept from student where saddress = '서울';

# professor전체 내용 불러오기 
select * from professor;

# professor 전체 record 개수 확인 
select count(*) from professor;

# professor 이름 오름차순 정렬 
select * from professor order by pname;

# professor 이름순 정렬, 이름, 전공, 주소 보여주기 
select pname, pdept, paddress from professor order by pname;

# 전체 교수 리스트를 학과별로 출력 
select * from professor order by pdept, pname;

# 국문학과 교수 리스트 이름 순서로 출력 
select * from professor where pdept = '국문학과' order by pname;

# 전체교수 리스트 이름 역순으로 출력 
select * from professor order by pname desc;

# MySQL 과목을 강의하는 교수님의 이름, 전화번호와 강의실을 검색하는 문장을 작성하시오.
select p.pname, p.pphone, c.croom
from professor p , course c , lecture l
where c.cname = 'MySQL' 
and c.ccode = l.lccode and l.lpcode = p.pcode;

# 김구 교수님이 강의하는 과목명, 강의시간, 강의실을 검색하는 문장을 작성하시오.
select c.cname , c.ctime, c.croom
from professor p, course c, lecture l 
where p.pname = '김구' and c.ccode = l.lccode and l.lpcode = p.pcode;

# 각 학생이 수강 신청한 과목에 대해서 학생이름, 과목명, 강의실, 강의시간을 검색하는 문장을 작성하시오.
select s.sname, c.cname, c.croom, c.ctime
from student s , course c, register r
where c.ccode = r.rccode and r.rscode = s.scode
order by s.sname, c.cname;

# 각 학과별 교수님은 몇분인지 구하는 검색 문장
select pdept , count(*) from professor 
group by pdept;

# 김구 교수님의 이름을 허은용으로 변경하기
update professor set 
pname = '허은용' 
where pname = '김구';

select * from professor;

# 학생 테이블에서 전공이 국문학과 인 학생 삭제하기
delete from student where sdept = '국문학과';

select * from student;