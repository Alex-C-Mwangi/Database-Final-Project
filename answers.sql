CREATE DATABASE police_case_system;
USE police_case_system;

CREATE TABLE officers(
    officer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    badge_number VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(100)
);

CREATE TABLE citizens(
    citizen_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    national_id VARCHAR(20) UNIQUE NOT NULL,
    address VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE crime_type(
    crimetype_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE case_status(
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

CREATE TABLE cases(
    case_id INT AUTO_INCREMENT PRIMARY KEY,
    case_title VARCHAR(200) NOT NULL,
    description TEXT,
    crimetype_id INT,
    status_id INT,
    officer_id INT,
    citizen_id INT,
    date_filed DATE NOT NULL,
    FOREIGN KEY (crimetype_id) REFERENCES crime_type(crimetype_id),
    FOREIGN KEY (status_id) REFERENCES case_status(status_id),
    FOREIGN KEY (officer_id) REFERENCES officers(officer_id),
    FOREIGN KEY (citizen_id) REFERENCES citizens(citizen_id),
);

CREATE TABLE evidence(
    evidence_id INT AUTO_INCREMENT PRIMARY KEY,
    case_id INT,
    description TEXT,
    submitted_by INT,
    FOREIGN KEY (case_id) REFERENCES cases(case_id),
    FOREIGN KEY (submitted_by) REFERENCES officers(officer_id)
);

CREATE TABLE reports(
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    case_id INT,
    officer_id INT,
    date_logged DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (case_id) REFERENCES cases(case_id),
    FOREIGN KEY (officer_id) REFERENCES officers(officer_id)
);