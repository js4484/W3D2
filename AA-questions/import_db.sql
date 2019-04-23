PRAGMA foreign_keys = ON;



CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
);
CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id)
);
CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)   
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    author_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id)''
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (fname, lname) VALUES ("Jake", "Johnson");
INSERT INTO users (fname, lname) VALUES ("Amy", "Park");

INSERT INTO questions (title, body, author_id) VALUES ("god", "Does he exist?", 1);
INSERT INTO questions (title, body, author_id) VALUES ("chocolate", "Who doesn't like it", 2);

INSERT INTO question_follows (user_id, question_id) VALUES (1, 1);
INSERT INTO question_follows (user_id, question_id) VALUES (2, 2);

INSERT INTO replies (question_id, parent_reply_id, author_id, body) VALUES (1, NULL, 2, "No.");
INSERT INTO replies (question_id, parent_reply_id, author_id, body) VALUES (1, 1, 1, "Okay.");

INSERT INTO question_likes (user_id, question_id) VALUES (2, 1);
INSERT INTO question_likes (user_id, question_id) VALUES (1, 1);