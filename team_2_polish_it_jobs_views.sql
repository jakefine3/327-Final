/* Final Views for DB, Team 02 */

/* View 1 */

CREATE VIEW job_details AS
SELECT j.job_id, j.if_permanent, j.if_remote, t.title_name, t.marker_icon,
	c.company_size_from, c.company_size_to, l.country_code, l.city,
    s.currency, s.salary_from, s.salary_to, e.experience_level
FROM job j
JOIN title t ON j.title_id = t.title_id
JOIN company_details c ON j.job_id = c.company_id
JOIN locations l ON j.location_id = l.location_id
JOIN salary s ON j.salary_id = s.salary_id
JOIN experience e ON j.experience_id = e.experience_id;

SELECT * FROM job_details;

/* View 2 */
CREATE VIEW permanent_senior_jobs AS
SELECT title_name, country_code, city, if_permanent, experience_level 
FROM job_details
WHERE if_permanent = 'TRUE' AND experience_level = 'senior';

SELECT * FROM permanent_senior_jobs;

/* View 3 */
