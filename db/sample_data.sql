-- sample_data.sql

-- Insert sample Companies
INSERT INTO Companies (name, industry, location) VALUES
('Tech Innovations Inc.', 'Software', 'San Francisco, CA'),
('Global Solutions Ltd.', 'Consulting', 'New York, NY'),
('Creative Marketing Agency', 'Marketing', 'Los Angeles, CA'),
('HealthCare United', 'Healthcare', 'Boston, MA');

-- Insert sample JobPositions
INSERT INTO JobPositions (company_id, title, description, job_url) VALUES
((SELECT company_id FROM Companies WHERE name = 'Tech Innovations Inc.'), 'Software Engineer', 'Develop and maintain web applications.', 'https://techinnovations.com/careers/software-engineer'),
((SELECT company_id FROM Companies WHERE name = 'Global Solutions Ltd.'), 'Project Manager', 'Oversee project lifecycle and team.', 'https://globalsolutions.com/jobs/pm'),
((SELECT company_id FROM Companies WHERE name = 'Creative Marketing Agency'), 'Graphic Designer', 'Create visual concepts.', 'https://creativemarketing.com/jobs/designer'),
((SELECT company_id FROM Companies WHERE name = 'HealthCare United'), 'Data Analyst', 'Analyze healthcare data trends.', 'https://healthcareunited.com/careers/data-analyst'),
((SELECT company_id FROM Companies WHERE name = 'Tech Innovations Inc.'), 'DevOps Engineer', 'Manage and improve CI/CD pipelines.', 'https://techinnovations.com/careers/devops');

-- Insert sample Applications
INSERT INTO Applications (job_id, applied_date, status, notes) VALUES
((SELECT job_id FROM JobPositions WHERE title = 'Software Engineer' AND company_id = (SELECT company_id FROM Companies WHERE name = 'Tech Innovations Inc.')), '2023-10-26', 'Applied', 'Applied via LinkedIn. Followed up on Nov 1.'),
((SELECT job_id FROM JobPositions WHERE title = 'Project Manager' AND company_id = (SELECT company_id FROM Companies WHERE name = 'Global Solutions Ltd.')), '2023-10-20', 'Interviewing', 'First interview scheduled for Nov 5.'),
((SELECT job_id FROM JobPositions WHERE title = 'Graphic Designer' AND company_id = (SELECT company_id FROM Companies WHERE name = 'Creative Marketing Agency')), '2023-11-01', 'Applied', 'Portfolio submitted.'),
((SELECT job_id FROM JobPositions WHERE title = 'Data Analyst' AND company_id = (SELECT company_id FROM Companies WHERE name = 'HealthCare United')), '2023-10-15', 'Rejected', 'Received rejection email.'),
((SELECT job_id FROM JobPositions WHERE title = 'DevOps Engineer' AND company_id = (SELECT company_id FROM Companies WHERE name = 'Tech Innovations Inc.')), '2023-11-05', 'Applied', 'Referred by a friend.');

-- Insert sample Interviews (optional)
INSERT INTO Interviews (application_id, interview_date, interviewer, notes) VALUES
((SELECT application_id FROM Applications WHERE job_id = (SELECT job_id FROM JobPositions WHERE title = 'Project Manager' AND company_id = (SELECT company_id FROM Companies WHERE name = 'Global Solutions Ltd.')) AND status = 'Interviewing'), '2023-11-05 10:00:00-05', 'Jane Doe', 'Initial screening call.'),
((SELECT application_id FROM Applications WHERE job_id = (SELECT job_id FROM JobPositions WHERE title = 'Software Engineer' AND company_id = (SELECT company_id FROM Companies WHERE name = 'Tech Innovations Inc.')) AND status = 'Applied'), '2023-11-10 14:30:00-05', 'John Smith', 'Technical interview with hiring manager.');
