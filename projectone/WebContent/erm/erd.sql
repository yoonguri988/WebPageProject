SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS alarm;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS warnboard;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS mylist;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS playlist;
DROP TABLE IF EXISTS qalist;




/* Create Tables */

CREATE TABLE alarm
(
	alarmnum int NOT NULL,
	memnum int NOT NULL,
	boardnum int NOT NULL,
	commentnum int NOT NULL,
	PRIMARY KEY (alarmnum)
);


CREATE TABLE board
(
	boardnum int NOT NULL,
	memnum int NOT NULL,
	boardtype int NOT NULL,
	boardcategory int,
	title varchar(100) NOT NULL,
	content varchar(300),
	file1 varchar(100),
	readcnt int NOT NULL,
	grp int NOT NULL,
	PRIMARY KEY (boardnum)
);


CREATE TABLE comment
(
	commentnum int NOT NULL,
	boardnum int NOT NULL,
	memnum int NOT NULL,
	content varchar(300),
	PRIMARY KEY (commentnum)
);


CREATE TABLE member
(
	memnum int NOT NULL,
	id varchar(80) NOT NULL,
	pass varchar(80) NOT NULL,
	name varchar(80) NOT NULL,
	nick varchar(80) NOT NULL,
	tel varchar(80) NOT NULL,
	chk int unsigned NOT NULL,
	warncnt int,
	deadmem int DEFAULT 0,
	PRIMARY KEY (memnum),
	UNIQUE (id),
	UNIQUE (nick)
);


CREATE TABLE mylist
(
	mylistnum int NOT NULL,
	memnum int NOT NULL,
	listnum int NOT NULL,
	PRIMARY KEY (mylistnum)
);


CREATE TABLE playlist
(
	listnum int NOT NULL,
	youtubeurl varchar(200) NOT NULL,
	PRIMARY KEY (listnum)
);


CREATE TABLE qalist
(
	qanum int NOT NULL,
	question varchar(100),
	answer varchar(100),
	PRIMARY KEY (qanum)
);


CREATE TABLE warnboard
(
	warnnum int NOT NULL,
	memnum int NOT NULL,
	boardnum int NOT NULL,
	state int,
	title varchar(100),
	content varchar(100),
	PRIMARY KEY (warnnum)
);



/* Create Foreign Keys */

ALTER TABLE alarm
	ADD FOREIGN KEY (boardnum)
	REFERENCES board (boardnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE comment
	ADD FOREIGN KEY (boardnum)
	REFERENCES board (boardnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE warnboard
	ADD FOREIGN KEY (boardnum)
	REFERENCES board (boardnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE alarm
	ADD FOREIGN KEY (commentnum)
	REFERENCES comment (commentnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE alarm
	ADD FOREIGN KEY (memnum)
	REFERENCES member (memnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (memnum)
	REFERENCES member (memnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE comment
	ADD FOREIGN KEY (memnum)
	REFERENCES member (memnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE mylist
	ADD FOREIGN KEY (memnum)
	REFERENCES member (memnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE warnboard
	ADD FOREIGN KEY (memnum)
	REFERENCES member (memnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE mylist
	ADD FOREIGN KEY (listnum)
	REFERENCES playlist (listnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



