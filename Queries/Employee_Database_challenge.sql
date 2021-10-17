--Retrive employee details (emp_no,first-name,last-name etc) in to new retirement_title table by joining employees and titles table. 
SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   ti.title,
	   ti.from_date,
	   ti.to_date
INTO retirement_title
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
					first_name,
					last_name,
					title
INTO unique_titles
FROM retirement_title
ORDER BY emp_no, to_date DESC;
select*from unique_titles;
--retrive title wise employees count who are ready to retirement 
SELECT COUNT(title) AS "Count",title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY "Count" DESC;
select*from retiring_titles;

--Retrive current  employees details who born in 1965 in to  mentorship_eligibility table.
SELECT DISTINCT ON(e.emp_no)e.emp_no,
	   e.first_name,
	   e.last_name,
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no=de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no=ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no; 
select*from mentorship_eligibility;