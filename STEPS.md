# Job Application Tracker: Project Steps

This document outlines the steps to build the Job Application Tracker project using React (TypeScript) for the frontend and Node.js/Express (TypeScript) with PostgreSQL for the backend.

---

## Phase 1: Project Foundation & Database Setup

1\. **Initialize Project Structure:**

    *   Create a root directory for the project.
    *   Inside the root, create `backend` and `frontend` subdirectories.
    *   Initialize a Git repository in the root directory (`git init`).

2\. **Set Up PostgreSQL:**

    *   Install PostgreSQL on your local machine.
    *   Create a new database (e.g., `job_tracker`).
    *   Create a user and grant it privileges to the new database. Note the connection details (user, password, host, port).

3\. **Define and Create Database Schema:**

    *   Following `GEMINI.md`, create a `schema.sql` file in the project's root or a new `db` folder.
    *   Write the `CREATE TABLE` SQL statements for `Companies`, `JobPositions`, `Applications`, and `Interviews`.
    *   Execute the `schema.sql` script to create the tables in your `job_tracker` database.

4\.  **Populate Database with Sample Data:**

    *   Create a `sample_data.sql` file.
    *   Write `INSERT` statements to add a few example companies, jobs, and applications.
    *   Execute the `sample_data.sql` script.

---

### Phase 2: Backend Development (Node.js / Express / TypeScript)

5\. **Initialize Node.js Project:**

    *   Navigate to the `backend` directory.
    *   Run `npm init -y` to create a `package.json` file.
    *   Install core dependencies: `npm install express pg cors`
    *   Install development dependencies: `npm install -D typescript @types/node @types/express @types/pg ts-node nodemon`

6\. **Configure TypeScript:**

    *   Run `npx tsc --init` to create a `tsconfig.json` file.
    *   Adjust the `tsconfig.json` with key settings like `"outDir": "./dist"` and `"rootDir": "./src"`.

7\.  **Establish Database Connection:**

    *   Create a `src` directory.
    *   Inside `src`, create a `db.ts` or `database.ts` file to configure and export a connection pool using the `pg` library.

8\.  **Build the API Server:**

    *   Create a main server file `src/index.ts`.
    *   Set up a basic Express server that listens on a port (e.g., 4000).
    *   Add middleware for JSON parsing (`express.json()`) and CORS (`cors()`).

9\.  **Define Types and Implement API Routes:**

    *  Create a `types.ts` file to define TypeScript interfaces for your database tables (e.g., `Application`, `Company`).
    *   Create a `routes` directory and implement the CRUD (Create, Read, Update, Delete) endpoints for your resources (e.g., `applications.ts`).
    *   In your route handlers, write the raw SQL queries and use the `pg` connection pool to execute them.

---

### Phase 3: Frontend Development (React / TypeScript)

10\. **Initialize React Project:**

    *   Navigate to the `frontend` directory.
    *   Run `npm create vite@latest . -- --template react-ts` to create a new React project with TypeScript support.
    *   Follow the prompts to install dependencies.

11\. **Structure Frontend Application:**

    *   Create a `components` directory for your UI components (e.g., `ApplicationList.tsx`, `ApplicationCard.tsx`, `AddApplicationForm.tsx`).
    *   Create a `services` directory for API communication.

12\. **Create API Service:**

    *   In the `services` directory, create an `api.ts` file.
    *   Write functions that call your backend endpoints using `fetch` or a library like `axios`.
    *   Use the same TypeScript types you defined in the backend for type-safe data exchange.

13\. **Build UI Components:**

    *   Implement the React components to display the job application data.
    *   Use React hooks (`useState`, `useEffect`) to fetch data from your API service and manage the application's state.

14\. **Connect Frontend to Backend:**

    *   Build the forms and buttons that allow users to create, update, and delete applications.
    *   Wire up these UI elements to the functions in your API service.

---

### Phase 4: Finalization and Documentation

15\. **Testing:**

    *   Perform manual testing to ensure all CRUD operations work correctly from the frontend to the backend.
    *   Check for any bugs or UI inconsistencies.

16\. **Documentation:**

    *   Create or update the root `README.md` file.
    *   Include a project description, the tech stack used, and clear instructions on how to set up and run both the backend and frontend servers locally.
