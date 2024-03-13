DROP DATABASE IF EXISTS  madang;
DROP USER IF EXISTS  madang@localhost;
create user madang@localhost identified WITH mysql_native_password  by 'madang';
create database madang;
grant all privileges on madang.* to madang@localhost with grant option;
commit;
 
USE madang;

CREATE TABLE Movies (
  Movieid INT primary key,  
  title VARCHAR(45),
  RunningTime TIME,
  Rating INT,
  Director VARCHAR(45),
  Actor VARCHAR(45),
  Genre VARCHAR(45),
  Synopsis VARCHAR(45),
  ReleaseDay DATE
  );

CREATE TABLE Halls (
  Hallid INT PRIMARY KEY,
  numSeat INT,
  HallStatus TINYINT
  );

CREATE TABLE Schedules (
  ScheduleId INT primary key,
  MovieId INT,
  Hallid INT,
  openingDate DATE,
  dayofweek VARCHAR(45),
  times INT,
  StartTime TIME,
  Foreign key (MovieId) references movies(Movieid),
  Foreign key (Hallid) references halls(hallid)
  );
    
CREATE TABLE Seats (
  SeatId INT Primary key,
  Hallid INT,
  SeatStatus TINYINT ,
  Foreign key (Hallid) references halls(hallid) 
  );
  
  

CREATE TABLE Members (
  MemberId INT primary key,
  memberName VARCHAR(45),
  Phone VARCHAR(45),
  Email VARCHAR(45)
  );
  
CREATE TABLE Reservations (
  ReservationId INT Primary key,
  Payment VARCHAR(45),
  PayStatus VARCHAR(45),
  Price INT,
  memberId INT,
  PayDate DATE,
  Foreign key (memberId) references members(memberid)
  );
    
  CREATE TABLE Tickets (
  TicketId INT primary key,
  ScheduleId INT,
  Hallid INT,
  Seatid INT,
  Reservationid INT,
  IssueStatus TINYINT,
  Price INT,
  SellingPrice INT,
  foreign key (Scheduleid) references schedules(scheduleid),
  foreign key (Hallid) references Halls(hallid),
  foreign key (Seatid) references seats(seatid),
  foreign key (Reservationid) references reservations(reservationId)
  );
  
  
  
  insert into movies values(1, '범죄도시2', 020000, 15, '이상용', '마동석, 손석구, 최귀화', '범죄, 액션', '금천서 강력반은 베트남으로 도주한 용의자를 인도받아 오라는 미션을 받는다.', str_to_date('2021-01-14', '%Y-%m-%d'));
  insert into movies values(2, '시네마천국', 020400, 0, '쥬세페토르나토레', '마르코레오나르디, 필립느와레, 자끄페렝', '드라마', '재개봉, 영화인 토토의 이야기', str_to_date('2021-02-22', '%Y-%m-%d'));
  insert into movies values(3, '아이언맨', 020500, 12, '존파브로', '로버트다우니주니어, 테렌스하워드, 제프브리지스', 'SF, 액션', '하이테크 슈퍼 히어로의 탄생!', str_to_date('2021-03-30', '%Y-%m-%d'));
  insert into movies values(4, '쇼생크탈출', 022200, 15, '프랭크다라본트', '팀로빈스, 모건프리먼', '드라마', '두려움은 너를 죄수로 가두고 희망은 너를 자유롭게 하리라', str_to_date('2021-04-24', '%Y-%m-%d'));
  insert into movies values(5, '클래식', 021200, 12, '곽재용', '손예진, 조승우, 조인성', '멜로', '우연히 그러나 반드시, 잊혀진 약속이 깨어났다.', str_to_date('2021-05-30', '%Y-%m-%d'));
  insert into movies values(6, '타이타닉', 031400, 15, '제임스카메론', '레오나르도디카프리오, 케이트윈슬렛', '멜로', '영원으로 기억될 세기의 러브 스토리', str_to_date('2021-06-01', '%Y-%m-%d'));
  insert into movies values(7, '레옹', 021200, 19, '뤽베송', '장르노, 나탈리포트만', '범죄, 액션', '나도 행복해 지고 싶어. 잠도 자고, 뿌리도 내릴거야.', str_to_date('2021-07-11', '%Y-%m-%d'));
  insert into movies values(8, '살인의추억', 021200, 15, '봉준호', '송강호, 김상경', '범죄', '미치도록 잡고 싶었습니다. 당신은 누구십니까', str_to_date('2021-08-25', '%Y-%m-%d'));
  insert into movies values(9, '쥬라기월드', 022700, 12, '콜린트레보로우', '크리스프랫, 브라이스달라스하워드', '액션, 모험', '이제 모든 것이 끝난다.', str_to_date('2021-09-01', '%Y-%m-%d'));
  insert into movies values(10, '우상', 022400, 15, '이수진', '한석규, 설경구, 천우희', '드라마', '아들의 사고로 정치 인생 최악의 위기를 맞게 된 남자', str_to_date('2021-11-20', '%Y-%m-%d'));
    
  insert into halls values(1, 30, false);
  insert into halls values(2, 30, false);
  insert into halls values(3, 30, false);
  insert into halls values(4, 30, true);
  insert into halls values(5, 30, true);
  insert into halls values(6, 30, true);
  insert into halls values(7, 30, true);
  insert into halls values(8, 30, true);
  insert into halls values(9, 30, true);
  insert into halls values(10, 30, true);
  
  insert into schedules values(1, 1, 1, str_to_date('2021-01-14', '%Y-%m-%d'), '목', 8, 093000);
  insert into schedules values(2, 2, 3, str_to_date('2021-03-01','%Y-%m-%d'), '월', 6, 082000);
  insert into schedules values(3, 3, 2, str_to_date('2021-04-01', '%Y-%m-%d'), '목', 10, 075000);
  insert into schedules values(4, 3, 3, str_to_date('2021-04-01', '%Y-%m-%d'), '목', 9, 081000);
  insert into schedules values(5, 4, 7, str_to_date('2021-04-28', '%Y-%m-%d'), '수', 7, 100000);
  insert into schedules values(6, 5, 4, str_to_date('2021-06-01', '%Y-%m-%d'), '화', 8, 091000);
  insert into schedules values(7, 6, 5, str_to_date('2021-06-01', '%Y-%m-%d'), '화', 7, 085000);
  insert into schedules values(8, 7, 6, str_to_date('2021-07-11', '%Y-%m-%d'), '일', 6, 101000);
  insert into schedules values(9, 8, 8, str_to_date('2021-08-26', '%Y-%m-%d'), '목', 7, 110000);
  insert into schedules values(10, 9, 10, str_to_date('2021-09-12', '%Y-%m-%d'), '일', 8, 091500);
  insert into schedules values(11, 10, 9, str_to_date('2021-11-20', '%Y-%m-%d'), '토', 6, 101000);
  
  insert into members values(1, '유재석', '010-1234-5678', 'qwerty@naver.com');
  insert into members values(2, '박명수', '010-2143-6587', 'asdfgh@daum.net');
  insert into members values(3, '정준하', '010-9876-5432', 'zxcv@gmail.com');
  insert into members values(4, '정형돈', '010-5678-9000', 'dodo@naver.com');
  insert into members values(5, '노홍철', '010-7777-1234', 'hong123@gmail.com');
  insert into members values(6, '하동훈', '010-4232-5342', 'haha77@naver.com');
  insert into members values(7, '길성준', '010-2233-4321', 'lee@daum.net');
  insert into members values(8, '김태호', '010-6541-6512', 'teo123@gmail.com');
  insert into members values(9, '제영재', '010-4569-4412', 'young33@gmail.com');
  insert into members values(10, '제임스', '010-9123-4012', 'james00@gmail.com');
  
  insert into reservations values(1, '카드', '결제완료', 9000, 3, str_to_date('2021-01-14', '%Y-%m-%d'));
  insert into reservations values(2, '현금', '결제완료', 12000, 6, str_to_date('2021-01-15', '%Y-%m-%d'));
  insert into reservations values(3, '카드', '결제완료', 12000, 5, str_to_date('2021-03-02', '%Y-%m-%d'));
  insert into reservations values(4, '카드', '결제완료', 9000, 1, str_to_date('2021-04-09', '%Y-%m-%d'));
  insert into reservations values(5, '카드', '결제완료', 9000, 1, str_to_date('2021-06-03', '%Y-%m-%d'));
  insert into reservations values(6, '카드', '결제완료', 12000, 1, str_to_date('2021-06-15', '%Y-%m-%d'));
  insert into reservations values(7, '현금', '결제완료', 8000, 4, str_to_date('2021-07-20', '%Y-%m-%d'));
  insert into reservations values(8, '카드', '결제완료', 12000, 2, str_to_date('2021-08-27', '%Y-%m-%d'));
  insert into reservations values(9, '카드', '결제대기', 9000, 1, str_to_date('2021-09-08', '%Y-%m-%d'));
  insert into reservations values(10, '현금', '결제대기', 12000, 9, str_to_date('2021-09-10', '%Y-%m-%d'));
  
  insert into seats values(1, 1, false);
  insert into seats values(2, 1, false);
  insert into seats values(3, 3, false);
  insert into seats values(4, 3, true);
  insert into seats values(5, 4, true);
  insert into seats values(6, 5, true);
  insert into seats values(7, 6, true);
  insert into seats values(8, 8, true);
  insert into seats values(9, 10, true);
  insert into seats values(10, 9, true);
  
  insert into tickets values(1, 1, 1, 1, 1, true, 12000, 9000);
  insert into tickets values(2, 2, 1, 2, 2, true, 12000, 12000);
  insert into tickets values(3, 2, 3, 3, 3, true, 12000, 12000);
  insert into tickets values(4, 4, 3, 4, 4, true, 12000, 9000);
  insert into tickets values(5, 5, 4, 5, 5, true, 12000, 9000);
  insert into tickets values(6, 7, 5, 6, 6, true, 12000, 12000);
  insert into tickets values(7, 8, 6, 7, 7, true, 12000, 8000);
  insert into tickets values(8, 9, 8, 8, 8, true, 12000, 12000);
  insert into tickets values(9, 10, 10, 9, 9, false, 12000, 9000);
  insert into tickets values(10, 11, 9, 10, 10, false, 12000, 12000);
  
  select * from movies;
  select * from halls;
  select * from schedules;  
  select * from members;
  select * from reservations;
  select * from seats;
  select * from tickets;
  
  commit;