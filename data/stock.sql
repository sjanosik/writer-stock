PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE category (
	id TEXT NOT NULL,
	description TEXT, name TEXT,
	CONSTRAINT category_PK PRIMARY KEY (id)
);
INSERT INTO category VALUES('genre','A term for categorisations of pieces of art based on common themes, styles, plots, or explored concepts (e.g. horror, romance, fantasy)','Genre');
INSERT INTO category VALUES('tone','An attitude or emotion communicated by a piece of art (e.g. dark, wholesome, comedy)','Tone');
INSERT INTO category VALUES('theme','A concept or idea explored or represented in a piece of art (e.g. romance, dystopia, death, love)','Theme');
INSERT INTO category VALUES('medium','A format by which a piece of art is presented (e.g. Television, Film, Theatre, Short story)','Medium');
INSERT INTO category VALUES('setting','An environment within which a story or piece of art is presented (e.g. western, space, steampunk)','Setting');
INSERT INTO category VALUES('period_created','A span of time (usually specific to a single culture or collection of cultures) during which a piece of art was created (e.g. 1930s, 19th century, Ancient Rome)','Period (Created)');
INSERT INTO category VALUES('period_setting','A span of time (usually specific to a single culture or collection of cultures) during which events within a piece of art take place (e.g. Ancient Rome, near-future, viet-nam war)','Period (Setting)');
INSERT INTO category VALUES('creator','An author, designer, or creative voice involved in the production of a piece of art (e.g. Jane Austen, Ursula K. Le Guin, Kazuo Ishiguro) ','Creator');
INSERT INTO category VALUES('fairy_tale','A fictional story, often containing moralistic or cautionary lessons behind a fantasy adventure (e.g. Snow White, Little Mermaid, Alice in Wonderland)','Fairy Tale');
CREATE TABLE example (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	tone TEXT,
	theme TEXT,
	medium TEXT,
	setting TEXT,
	period_created TEXT,
	period_setting TEXT,
	creator TEXT,
	public_domain INTEGER
, other TEXT, genre TEXT);
INSERT INTO example VALUES(1,'Emma','Comedy','Romance, Pride','Novel','Aristocracy, English Countryside','1800s','Regency Era','Jane Austen',1,NULL,'Romance');
INSERT INTO example VALUES(2,'Treasure Island','Adventure','Adventure, Bildungsroman, Piracy','Novel','Piracy, Island, England','1800s','Victorian Era','Robert Louis Stevenson',NULL,NULL,'Adventure');
CREATE TABLE default_piece (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	category_id TEXT,
	value TEXT NOT NULL,
	CONSTRAINT default_piece_UN_category_id_value UNIQUE (category_id,value),
	CONSTRAINT default_piece_FK FOREIGN KEY (category_id) REFERENCES category(id)
);
INSERT INTO default_piece VALUES(1,'genre','Horror');
INSERT INTO default_piece VALUES(2,'genre','Comedy');
INSERT INTO default_piece VALUES(3,'genre','Romance');
INSERT INTO default_piece VALUES(4,'theme','Romance');
INSERT INTO default_piece VALUES(5,'tone','Grimdark');
INSERT INTO default_piece VALUES(6,'fairy_tale','Rumplestiltskin');
INSERT INTO default_piece VALUES(7,'creator','Jane Austen');
INSERT INTO default_piece VALUES(8,'fairy_tale','Snow White');
CREATE TABLE IF NOT EXISTS "user" (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	username TEXT NOT NULL
);
CREATE TABLE piece (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	category_id TEXT NOT NULL,
	value TEXT NOT NULL,
	user_id INTEGER,
	CONSTRAINT piece_FK FOREIGN KEY (user_id) REFERENCES "user"(id)
);
CREATE TABLE sketch (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	genre TEXT,
	tone TEXT,
	theme TEXT,
	medium TEXT,
	setting TEXT,
	period_created TEXT,
	period_setting TEXT,
	creator TEXT,
	other TEXT,
	user_id INTEGER,
	CONSTRAINT sketch_FK FOREIGN KEY (user_id) REFERENCES "user"(id)
);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('example',2);
INSERT INTO sqlite_sequence VALUES('default_piece',8);
COMMIT;
