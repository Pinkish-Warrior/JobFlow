# Job Application Tracker Project with Gemini CLI

## Project Overview

A small, practical project to track job applications, companies, positions, and interviews. This will help practice SQL, database design, and optionally a small CLI or web app interface.

### Objectives

* Design and implement a relational database schema.
* Practice CRUD operations, joins, filtering, and aggregate queries.
* Optionally connect a CLI tool (Gemini CLI) for data manipulation.

---

## Project Structure

```bash
job-application-tracker/
│
├── GEMINI.md                   # Project plan and structure (this file)
├── schema.sql                  # SQL schema creation script
├── sample_data.sql             # Sample data to populate database
├── queries.sql                 # Example SQL queries
├── gemini_tasks/               # Gemini CLI scripts and prompts
│   ├── create_tables.gemini    # Prompt for Gemini to generate tables
│   ├── insert_data.gemini      # Prompt for Gemini to insert sample data
│   └── queries.gemini          # Prompt for Gemini to generate queries
├── README.md                   # Project description, instructions
└── notes/                      # Any additional notes or learning logs
```

---

## Database Schema

### Companies

* company_id (INT, PK)
* name (VARCHAR)
* industry (VARCHAR, optional)
* location (VARCHAR, optional)

### Job Positions

* job_id (INT, PK)
* company_id (INT, FK -> Companies)
* title (VARCHAR)
* description (TEXT, optional)
* job_url (VARCHAR, optional)

### Applications

* application_id (INT, PK)
* job_id (INT, FK -> Job Positions)
* applied_date (DATE)
* status (VARCHAR, e.g., Applied, Interview, Offer, Rejected)
* notes (TEXT, optional)

### Interviews (Optional)

* interview_id (INT, PK)
* application_id (INT, FK -> Applications)
* interview_date (DATE)
* interviewer (VARCHAR, optional)
* notes (TEXT, optional)

---

## Project Planning & Steps

1. **Database Setup**

   * Use Gemini CLI to generate SQL scripts for table creation.
   * Execute `schema.sql` to create tables in your SQL database.

2. **Populate Sample Data**

   * Use `sample_data.sql` to insert example companies, jobs, and applications.
   * Optional: add interview records.

3. **Gemini CLI Integration**

   * Create `.gemini` scripts to automate CRUD operations.
   * Prompts can include tasks like: inserting new applications, updating status, retrieving upcoming interviews.

4. **Query Practice**

   * Create `queries.sql` to practice:

     * SELECT with JOINs
     * Filtering by status, company, or date
     * Aggregations (COUNT, AVG)
     * Sorting by date or status

5. **Optional Extensions**

   * Add a CLI interface for personal use.
   * Export reports (CSV) for all applications or interviews.
   * Add user authentication if multi-user tracking is needed.

---

## Example Gemini CLI Task Ideas

* `create_tables.gemini`: Generate CREATE TABLE SQL statements from schema.
* `insert_data.gemini`: Insert sample companies, jobs, and applications.
* `queries.gemini`: Generate common SQL queries for tracking applications and interviews.
* `update_status.gemini`: Update application status via CLI prompt.

---

## Learning Outcomes

* Relational database design and normalization.
* SQL query skills (JOINs, aggregates, filtering, updates).
* Automating database tasks with Gemini CLI prompts.
* Optional: practice integrating CLI workflows for personal productivity.
