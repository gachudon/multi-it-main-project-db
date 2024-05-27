create table user(
	userId int primary key auto_increment, -- int형으로 바꿈, 로그인 할 때 필요한 정보는 이메일이기도 하고, int형이 관리가 쉬움, auto_increment 걸어두면 insert에 용이함
	userName varchar(30) not null,
    email varchar(50),
    address varchar(50),
    category varchar(30), -- 
    password varchar(50), 
    approval int -- 0:대기, 1: 거절, 2: 승인, 3:개인회원
);

create table qna(
	qnaId int primary key auto_increment, 
    userId int,
    qnaTitle varchar(50),
    qnaContent varchar(300),
    writenDate Date
);

alter table qna
add constraint
foreign key(userId) references user(userId);

create table trainers(
	trainerId int primary key,
    gymId int,
    trainerCareer varchar(512)
);

create table gym(
gymId int primary key auto_increment,
gymName varchar(512),
CRNumber varchar(512),
address varchar(512));

alter table trainers
add constraint
foreign key(gymId) references gym(gymId);

alter table trainers
add constraint
foreign key(trainerId) references user(userId);

create table personalTraining(
	PTId int primary key auto_increment,
    userId int,
    trainerId int,
    ptcount int,
    ptcontent varchar(512)
);

alter table personalTraining
add constraint
foreign key(userId) references user(userId);

alter table personalTraining
add constraint
foreign key(trainerId) references trainers(trainerId);

create table ptCalendar(
ptCalendarId int primary key auto_increment,
ptId int,
ptDate date,
startTime time,
endTime time,
ptPart varchar(512),
foreign key(ptId) references personalTraining(PTId));

create table exerciseCalendar(
ECId int primary key auto_increment,
userId int,
startTime time,
endTime time,
exerciseContent varchar(512),
exerciseSet varchar(512),
foreign key(userId) references user(userId));

create table chat(
chatId int primary key auto_increment,
userId int,
trainerId int,
chatDate date,
log varchar(512),
foreign key(userId) references user(userId),
foreign key(trainerId) references trainers(trainerId));

create table gymRegistrationInformation(
GRIId int primary key auto_increment,
userId int,
gymId int,
endDate date,
foreign key(userId) references user(userId),
foreign key(gymId) references gym(gymId));