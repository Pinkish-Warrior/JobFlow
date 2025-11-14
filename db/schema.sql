-- schema.sql

-- Enable pgcrypto extension for UUID generation, if needed in the future.
-- CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Table for Companies
CREATE TABLE Companies (
    company_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    industry VARCHAR(255),
    location VARCHAR(255)
);

-- Table for Job Positions
CREATE TABLE JobPositions (
    job_id SERIAL PRIMARY KEY,
    company_id INT NOT NULL REFERENCES Companies(company_id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    job_url VARCHAR(2048)
);

-- Table for Applications
CREATE TABLE Applications (
    application_id SERIAL PRIMARY KEY,
    job_id INT NOT NULL REFERENCES JobPositions(job_id) ON DELETE CASCADE,
    applied_date DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(50) NOT NULL CHECK (status IN ('Applied', 'Interviewing', 'Offer', 'Rejected', 'Wishlist')),
    notes TEXT
);

-- Table for Interviews
CREATE TABLE Interviews (
    interview_id SERIAL PRIMARY KEY,
    application_id INT NOT NULL REFERENCES Applications(application_id) ON DELETE CASCADE,
    interview_date TIMESTAMP WITH TIME ZONE,
    interviewer VARCHAR(255),
    notes TEXT
);
