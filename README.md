# 📊 Data Analyst Job Market Exploration

# 🧭 Introduction
Dive into the data job market! Focusing on Data Analyst roles, this project explores top-paying jobs, in-demand skills, and where high demand meets high salary in data analytics.

SQL Queries? Check them out here: [project_sql](project_sql/)

# 🎯 Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills — streamlining efforts to find the most optimal career opportunities in data analytics.

### 🔍 Key Questions Explored:
1. 💰 What are the top-paying Data Analyst jobs?
2. 🧠 What skills are required for those top-paying jobs?
3. 📈 What skills are most in demand for data analysis?
4. 🪙 Which skills are associated with higher salaries?
5. 🚀 What are the most optimal skills to learn?

# 🛠️ Tools I Used

For this deep dive into the Data Analyst job market, I leveraged the power of several key tools:
🗄️ SQL — The backbone of analysis, used to query and extract valuable insights.
🐘 PostgreSQL — The database system used to manage and query large job datasets.
💻 Visual Studio Code — My go-to environment for executing SQL queries and data exploration.
🌐 Git & GitHub — Essential for version control, sharing scripts, and tracking project evolution.

# 🔬 The Analysis

Each query in this project investigates a specific aspect of the Data Analyst job landscape. Here’s how I approached each question:

### 1. Top-Paying Data Analyst Roles
To identify the highest-paying roles, I filtered data analyst positions by yearly average salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```
SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
```
### 2. Skills Required for Top-Paying Roles
To identify the key skills required for the top-paying Data Analyst roles, I used the top 10 results from Query 1 and joined them with the skills data. This reveals which skills are most associated with high-salary roles.

```
WITH top_paying_jobs AS (
SELECT 
    job_id,
    job_title,
    salary_year_avg,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
)

SELECT *
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

```
### 3. Most In-Demand Skills
To identify the most in-demand skills for Data Analyst roles, I analyzed all job postings and counted how often each skill appeared. This query highlights the top five most requested skills in the job market, helping job seekers understand which capabilities are currently most valuable and in demand for remote positions.

```
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS Demand_Count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = True
GROUP BY
    skills
ORDER BY
    Demand_Count DESC
LIMIT 5;
```
### 4. Top Skills by Average Salary
To identify the top skills based on salary, this query calculates the average salary associated with each skill for Data Analyst positions. It focuses on roles with specified salary data, regardless of location. This analysis helps reveal which skills contribute the most to higher salaries, guiding professionals to focus on the most financially rewarding skills.

```
SELECT 
    skills,
    ROUND (AVG(salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

```
### 5. Most Optimal Skills to Learn
To identify the most optimal skills to learn, this query combines demand and salary data for Data Analyst roles. It focuses on remote positions with specified salaries and highlights skills that are both highly demanded and well-paid. This provides a strategic roadmap for professionals aiming to balance job security with strong financial returns in data analytics.

```
WITH skills_demand AS (
SELECT 
    skills_job_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS Demand_Count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = True
GROUP BY
    skills_dim.skills,
     skills_job_dim.skill_id

),
average_salary AS (
    SELECT 
    skills_job_dim.skill_id,
    skills_dim.skills,
    ROUND (AVG(salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL 
    AND job_work_from_home = True
GROUP BY 
    skills_dim.skills,
     skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    Demand_Count,
    avg_salary  
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
ORDER BY 
    avg_salary DESC,
    Demand_Count DESC
LIMIT 25
```
# What I Learned
Throughout this project, I gained hands-on experience in:
- Writing and optimizing SQL queries for real-world analytical problems.
- Using JOINs, CTEs, and aggregation effectively to extract insights.
- Identifying actionable insights from raw job posting data.
- Structuring data projects for clarity and scalability in GitHub repositories.

# Conclusions
- 💼 SQL, Python, and Excel consistently rank among the most in-demand skills.
- 💰 Skills like Snowflake, Tableau, and R are often linked with higher salaries.
- ⚙️ Combining demand and salary data helps pinpoint the most strategic skills to learn.
- 🚀 Mastering these skills enhances both employability and earning potential in the data analytics field.
