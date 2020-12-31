#JSP블로그 프로젝트
##환경
-JDK 1.8
-TOMCAT 9.0
-STS TOOL
-MYSQL 8.0
-POSTMAN
-LOMBOK
-GSON(JSON파싱)
-인코딩(utf-8)
-git


##MYSQL 데이터베이스 생성 및 사용자 생성
```SQL
create user 'bloguser'@'%' identified by 'bitc5600';
grant all privileges on *.* to 'bloguser'@'%';
create database blog;
use blog;
```

##MYSQL 테이블 생성
-bloguser 사용자 생성

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