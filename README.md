# JSP블로그 프로젝트
## 환경
- JDK 1.8
- TOMCAT 9.0
- STS TOOL
- MYSQL 8.0
- POSTMAN
- LOMBOK
- GSON(JSON파싱)
- 인코딩(utf-8)
- git



## MYSQL 데이터베이스 생성 및 사용자 생성
```SQL
create user 'bloguser'@'%' identified by 'bitc5600';
grant all privileges on *.* to 'bloguser'@'%';
create database blog;
use blog;
```

## MYSQL 테이블 생성
- bloguser 사용자 생성
- use blog;  데이터 베이스 선택

```SQL
CREATE TABLE users(
	id int primary key auto_increment,
    username varchar(100) not null unique,
    password varchar(100) not null,
    email varchar(100) not null,
    address varchar(100),
    userRole varchar(20),
    createDate timestamp
) engine=InnoDB default charset=utf8 ;

CREATE TABLE board(
	id int primary key auto_increment,
    userId int,
    title varchar(100) not null,
    content longtext,
    readCount int default 0,
    createDate timestamp,
    foreign key (userId) references users (id)
) engine=InnoDB default charset=utf8;

CREATE TABLE reply(
	id int primary key auto_increment,
    userId int,
    boardId int,
    content varchar(300) not null,
    createDate timestamp,
    foreign key (userId) references users (id) on delete set null,
    foreign key (boardId) references board (id) on delete cascade
) engine=InnoDB default charset=utf8;
```

## 🥇기능요소
⚙메인화면 
+ 상세보기 및 글검색 가능 <br/> 
![image](https://user-images.githubusercontent.com/74044292/104454001-9675ac80-55e8-11eb-937c-f9811255a676.png)<br/><br/>

⚙상세보기화면<br/>
![image](https://user-images.githubusercontent.com/74044292/104454056-a55c5f00-55e8-11eb-8ae6-0e576a60a6f9.png)<br/><br/>

⚙로그인화면
+ 로그인 시 자신의 해당하는 글 삭제 및 수정 가능 <br/>
![image](https://user-images.githubusercontent.com/74044292/104454094-ae4d3080-55e8-11eb-911f-78fe051f5db8.png)
![image](https://user-images.githubusercontent.com/74044292/104454125-b73e0200-55e8-11eb-8c41-3ba318c35425.png)
![image](https://user-images.githubusercontent.com/74044292/104454421-2ca9d280-55e9-11eb-8875-6e03cd67978a.png)<br/><br/>

⚙글쓰기화면 
+ 로그인 한 사람만 글쓰기 가능 <br/>
![image](https://user-images.githubusercontent.com/74044292/104454385-1d2a8980-55e9-11eb-96bb-dcb8fed0f028.png)<br/><br/>

⚙기타<br/>
+ 로그아웃을 할 수 있다.
+ 댓글을 쓸 수 있다.
+ 댓글을 쓴 사람은 자신의 댓글을 삭제할 수 있다. <br/>

🥉블로그
https://blog.naver.com/rlawjdgus051
