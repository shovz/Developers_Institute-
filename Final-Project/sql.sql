DROP TABLE users;
DROP TABLE applications;
DROP TABLE contact_info;
DROP TABLE interviews;



CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    fname VARCHAR(100) NOT NULL ,
    lname VARCHAR(100) NOT NULL ,
    email VARCHAR(100) NOT NULL UNIQUE ,
    password VARCHAR(500) NOT NULL,
    gender VARCHAR(100),
    position VARCHAR(100),
    xp_years VARCHAR(50) NOT NULL
);
		
        
        
CREATE TABLE applications (
    application_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users (user_id) ON DELETE CASCADE,
    company VARCHAR(100) NOT NULL ,
--     current_stage INTEGER NOT NULL,
    active BOOLEAN NOT NULL DEFAULT true ,
    salary VARCHAR(100),
    post_url VARCHAR(255),
    website VARCHAR(255),
    position VARCHAR(100) NOT NULL ,
    job_description TEXT,
    location VARCHAR(255),
    createdat timestamp not null,
    endedat timestamp
);

INSERT INTO applications
(user_id,company,active,salary,
 post_url,website,position,
 job_description,location,createdat)

VALUES (1,'KINETICA',true,'50000','https://www.linkedin.com/jobs/',
       'https://www.KINETICA.com','Enginneerr',
       'Deserunt aliqua labore do reprehenderit consequat. Labore adipisicin
        Deserunt aliqua labore do reprehenderit consequat. Labore adipisicin',
       '485 Seigel Court, Dargan, Nevada, 8283',
       '2022-01-09 18:38:07'),
       
       (1,'AEORA',false,'100000','https://www.linkedin.com/jobs/',
       'https://www.AEORA.com','full stack developer',
       'Deserunt aliqua labore do reprehenderit consequat. Labore adipisicin
        Deserunt aliqua labore do reprehenderit consequat. Labore adipisicin',
       '670 Turner Place, Dawn, Michigan, 8874',
       '2022-11-29 15:38:07')
       


CREATE TABLE contact_info (
    contact_id SERIAL PRIMARY KEY,
    application_id INTEGER NOT NULL REFERENCES applications (application_id) ON DELETE CASCADE, 
    contact_fname VARCHAR(100) NOT NULL ,
    contact_lname VARCHAR(100) NOT NULL ,
    contact_email VARCHAR(150) NOT NULL ,
    contact_linkedin VARCHAR(255),
    contact_phone VARCHAR(100)
);




CREATE TYPE methods AS ENUM ('phone', 'video', 'onsite')
CREATE TYPE stages AS ENUM ('applied', 'hr', 'techincal','offer')
CREATE TYPE reasons AS ENUM ('culture', 'techincal', 'experience', 'not relevant', 'other')


CREATE TABLE interviews (
    interview_id SERIAL PRIMARY KEY,
    application_id INTEGER NOT NULL REFERENCES applications (application_id) ON DELETE CASCADE, 
    method methods ,
    stage stages NOT NULL,
    date timestamp NOT NULL,
    notes TEXT,
    assignment BOOLEAN  DEFAULT false ,
    assignment_date timestamp ,
    completed BOOLEAN DEFAULT false ,
    rejected BOOLEAN DEFAULT false ,
    refused BOOLEAN DEFAULT false ,
    reason reasons,
    offer VARCHAR(100),
    offer_details TEXT    
);


INSERT INTO interviews
(
    application_id , 
    method ,
    stage ,
    date,
    notes
--     assignment,
--     assignment_date ,
--     completed ,
--     rejected ,
--     refused,
--     reason ,
--     offer ,
--     offer_details   
 )
 
VALUES 
--    (2,'applied','2022-08-16 11:38:07'),
   
   (1,'onsite','hr','2022-08-16 12:38:07',
  'Deserunt aliqua labore do reprehenderit consequat. Labore adipisicin
   Deserunt aliqua labore do reprehenderit consequat. Labore adipisicin')

SELECT * FROM users;
SELECT * FROM applications;
SELECT * FROM interviews;