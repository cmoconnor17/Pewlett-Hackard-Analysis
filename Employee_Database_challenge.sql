CREATE TABLE titles_emp (
     emp_no INT NOT NULL,
     title VARCHAR(40) NOT NULL,
     from_date DATE NOT NULL,
     to_date DATE NOT NULL
);

CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

SELECT emp_no, first_name, last_name, birth_date
FROM employees

SELECT emp_no, title, from_date, to_date
FROM titles_emp


SELECT e.emp_no, first_name, last_name, birth_date, title, from_date, to_date
INTO master
FROM titles_emp
LEFT JOIN employees AS e
ON e.emp_no = titles_emp.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

SELECT emp_no, first_name, last_name, title, from_date, to_date FROM master

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title, from_date, to_date
INTO unique_titles
FROM master
ORDER BY emp_no, from_date DESC;

SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT DESC;

SELECT * FROM retiring_titles

Select * FROM master

SELECT * FROM unique_titles

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, ttl.from_date, ttl.to_date, ttl.title
INTO mentorship
FROM employees AS e
LEFT JOIN titles_emp as ttl
ON  e.emp_no = ttl.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no

SELECT * FROM mentorship