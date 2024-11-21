
---------------CREATE--------------------
CREATE TABLE LIST (
	"NO" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	TITLE TEXT NOT NULL,
	WRITER TEXT NOT NULL,
	DATE INTEGER NOT NULL,
	CONTENT BLOB,
	COUNT INTEGER DEFAULT (0) NOT NULL
);

CREATE TABLE "MEMBER" (
	"NO" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	ID TEXT NOT NULL,
	PASS TEXT NOT NULL,
	PHONE TEXT NOT NULL,
	ADDRESS TEXT
);

-------------------SELECT-----------------
SELECT * FROM LIST;

SELECT  * FROM "MEMBER" ;

--이전글 현재글 다음글 조회--
SELECT 
    current_row.*,
    IFNULL(previous_row.NO, 0) AS `prev`,
    IFNULL(next_row.NO, 0) AS `next`,
    IFNULL(previous_row.TITLE, '이전 글이 없습니다.') AS `prevTitle`,
    IFNULL(next_row.TITLE, '다음 글이 없습니다.') AS `nextTitle`
FROM 
    (SELECT NO,
            TITLE,        
            WRITER,        
            DATE,
            CONTENT,
            COUNT
     FROM LIST
     WHERE NO = ?) AS current_row
LEFT JOIN 
    (SELECT NO, TITLE
     FROM LIST
     WHERE NO < ?
     ORDER BY NO DESC
     LIMIT 1) AS previous_row ON 1 = 1
LEFT JOIN 
    (SELECT NO, TITLE
     FROM LIST
     WHERE NO > ?
     ORDER BY NO ASC
     LIMIT 1) AS next_row ON 1 = 1
ORDER BY 
    current_row.NO DESC;

-------------------DROP--------------------
DROP TABLE LIST;

DROP TABLE MEMBER;

-------------------INSERT------------------
INSERT INTO LIST (TITLE, WRITER, DATE, CONTENT)
VALUES ('Sample Title', 'Author Name', DATETIME('now'), 'Sample Content'); 

INSERT INTO "MEMBER" (ID, PASS, PHONE, ADDRESS)
VALUES ('admin', 'user1234', '01012345678', 'Seoul, Korea');

-------------------UPDATE-------------------
UPDATE LIST SET COUNT = COUNT + 1 WHERE NO = ?;