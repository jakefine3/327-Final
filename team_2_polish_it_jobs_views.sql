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
CREATE VIEW remote_salary_average AS
SELECT j.if_remote, AVG(s.salary_from) AS "Average Salary Minimum", AVG(s.salary_to) AS "Average Salary Maximum"
FROM job j
JOIN salary s ON j.salary_id = s.salary_id
WHERE j.if_remote = "TRUE"
GROUP BY j.if_remote;

/*View 4*/
CREATE VIEW high_skill_jobs AS 
SELECT j.job_id, t.title_name, t.marker_icon, s.skill_id, SUM(s.skill_value_1 + s.skill_value_2 + s.skill_value_3) AS total_skill_value
FROM job j
JOIN title t ON j.title_id = t.title_id
JOIN skills s ON j.skill_id = s.skill_id
GROUP BY j.job_id, t.title_name, t.marker_icon, s.skill_id
HAVING SUM(s.skill_value_1 + s.skill_value_2 + s.skill_value_3) > 10;

SELECT * FROM high_skill_jobs;

/*View 5*/
CREATE VIEW top_salaries AS
SELECT j.job_id, t.title_name, s.salary_to AS "Max Salaries", s.currency
FROM job j
JOIN title t ON j.title_id = t.title_id
JOIN salary s ON j.salary_id = s.salary_id
WHERE s.salary_id IN (
    SELECT salary_id
    FROM salary
    GROUP BY salary_id
    ORDER BY MAX(salary_to) DESC
);

