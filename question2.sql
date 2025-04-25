CREATE DATABASE contact_book;

USE contact_book;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE contacts (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users (username, email) VALUES
('sharon_ken', 'sharon.ken@example.com'),
('brian_otieno', 'brian.otieno@example.com'),
('lucy_wanjiku', 'lucy.wanjiku@example.com');

INSERT INTO contacts (user_id, name, phone, email) VALUES
(1, 'Jane Muthoni', '0712345678', 'jane.muthoni@gmail.com'),
(1, 'Peter Mwangi', '0722123456', 'peter.mwangi@yahoo.com'),
(2, 'Mercy Achieng', '0733111222', 'mercy.achieng@outlook.com'),
(2, 'Tom Njoroge', '0700778899', 'tom.njoroge@gmail.com'),
(3, 'Linda Chebet', '0744332211', 'linda.chebet@icloud.com');



SELECT * FROM users;
SELECT * FROM contacts;

