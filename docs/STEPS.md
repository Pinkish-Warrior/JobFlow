# Job Application Tracker: Project Steps

This document outlines the steps to build the Job Application Tracker project using React (TypeScript) for the frontend and Node.js/Express (TypeScript) with PostgreSQL for the backend.

---

## Phase 1: Project Foundation & Database Setup

1\. ✅ **Initialize Project Structure:**

    *   Create a root directory for the project.
    *   Inside the root, create `backend` and `frontend` subdirectories.
    *   Initialize a Git repository in the root directory (`git init`).

2\. ✅ **Set Up PostgreSQL:**

    *   Install PostgreSQL on your local machine or use a hosted service like Supabase.
    *   Create a new database (e.g., `job_tracker`).
    *   Create a user and grant it privileges to the new database. Note the connection details (user, password, host, port).

3\. ✅ **Define and Create Database Schema:**

    *   Following `GEMINI.md`, create a `schema.sql` file in the project's root or a new `db` folder.
    *   Write the `CREATE TABLE` SQL statements for `Companies`, `JobPositions`, `Applications`, and `Interviews`.
    *   Execute the `schema.sql` script to create the tables in your `job_tracker` database.

4\. ✅ **Populate Database with Sample Data:**

    *   Create a `sample_data.sql` file.
    *   Write `INSERT` statements to add a few example companies, jobs, and applications.
    *   Execute the `sample_data.sql` script.

5\. **Secure Database with Row Level Security (RLS):**

    *   **5.1. Enable RLS on Tables:**

        *   Run the following SQL commands in your Supabase SQL Editor (or equivalent PostgreSQL client):

            ```sql

            ALTER TABLE public.Companies ENABLE ROW LEVEL SECURITY;

            ALTER TABLE public.JobPositions ENABLE ROW LEVEL SECURITY;

            ALTER TABLE public.Applications ENABLE ROW LEVEL SECURITY;

            ALTER TABLE public.Interviews ENABLE ROW LEVEL SECURITY;

            ```

        *   *Explanation:* This enforces a "deny by default" security model. After this, no data can be accessed until policies are created.

    *   **5.2. Add `user_id` Column to User-Specific Tables:**

        *   To associate data with authenticated users, add a `user_id` column to tables that will store user-specific data. This column should reference `auth.users(id)`.

        *   Example for `Applications` table:

            ```sql

            ALTER TABLE public.Applications

            ADD COLUMN user_id UUID REFERENCES auth.users(id);

            ```

        *   *Note:* You may need to add `user_id` to other tables (e.g., `Companies`, `JobPositions`, `Interviews`) depending on whether they are owned by individual users or are globally accessible.

    *   **5.3. Create RLS Policies:**

        *   Define policies to grant specific access based on the authenticated user (`auth.uid()`).

        *   **Example Policies for `Applications` (assuming `user_id` column exists):**

            *   **SELECT Policy (Users can view their own applications):**

                ```sql

                CREATE POLICY "Users can view their own applications"

                ON public.Applications FOR SELECT

                USING (auth.uid() = user_id);

                ```

            *   **INSERT Policy (Users can insert their own applications):**

                ```sql

                CREATE POLICY "Users can insert their own applications"

                ON public.Applications FOR INSERT

                WITH CHECK (auth.uid() = user_id);

                ```

            *   **UPDATE Policy (Users can update their own applications):**

                ```sql

                CREATE POLICY "Users can update their own applications"

                ON public.Applications FOR UPDATE

                USING (auth.uid() = user_id)

                WITH CHECK (auth.uid() = user_id);

                ```

            *   **DELETE Policy (Users can delete their own applications):**

                ```sql

                CREATE POLICY "Users can delete their own applications"

                ON public.Applications FOR DELETE

                USING (auth.uid() = user_id);

                ```

        *   *Note:* You will need to create similar policies for other tables as appropriate for your application's access control requirements.

---

### Phase 2: Backend Development (Node.js / Express / TypeScript)

6\. **Initialize Node.js Project:**

    *   Navigate to the `backend` directory.
    *   Run `npm init -y` to create a `package.json` file.
    *   Install core dependencies: `npm install express pg cors`
    *   Install development dependencies: `npm install -D typescript @types/node @types/express @types/pg ts-node nodemon`

7\. **Configure TypeScript:**

    *   Run `npx tsc --init` to create a `tsconfig.json` file.
    *   Adjust the `tsconfig.json` with key settings like `"outDir": "./dist"` and `"rootDir": "./src"`.

8\.  **Establish Database Connection:**

    *   Create a `src` directory.
    *   Inside `src`, create a `db.ts` or `database.ts` file to configure and export a connection pool using the `pg` library.

9\.  **Build the API Server:**

    *   Create a main server file `src/index.ts`.
    *   Set up a basic Express server that listens on a port (e.g., 4000).
    *   Add middleware for JSON parsing (`express.json()`) and CORS (`cors()`).

10\.  **Define Types and Implement API Routes:**

    *  Create a `types.ts` file to define TypeScript interfaces for your database tables (e.g., `Application`, `Company`).
    *   Create a `routes` directory and implement the CRUD (Create, Read, Update, Delete) endpoints for your resources (e.g., `applications.ts`).
    *   In your route handlers, write the raw SQL queries and use the `pg` connection pool to execute them.

---

### Phase 3: Frontend Development (React / TypeScript)

11\. **Initialize React Project:**

    *   Navigate to the `frontend` directory.
    *   Run `npm create vite@latest . -- --template react-ts` to create a new React project with TypeScript support.
    *   Follow the prompts to install dependencies.

12\. **Structure Frontend Application:**

    *   Create a `components` directory for your UI components (e.g., `ApplicationList.tsx`, `ApplicationCard.tsx`, `AddApplicationForm.tsx`).
    *   Create a `services` directory for API communication.

13\. **Create API Service:**

    *   In the `services` directory, create an `api.ts` file.
    *   Write functions that call your backend endpoints using `fetch` or a library like `axios`.
    *   Use the same TypeScript types you defined in the backend for type-safe data exchange.

14\. **Build UI Components:**

    *   Implement the React components to display the job application data.
    *   Use React hooks (`useState`, `useEffect`) to fetch data from your API service and manage the application's state.

15\. **Connect Frontend to Backend:**

    *   Build the forms and buttons that allow users to create, update, and delete applications.
    *   Wire up these UI elements to the functions in your API service.

---

### Phase 4: Finalization and Documentation

16\. **Testing:**

    *   Perform manual testing to ensure all CRUD operations work correctly from the frontend to the backend.
    *   Check for any bugs or UI inconsistencies.

17\. **Documentation:**

    *   Create or update the root `README.md` file.
    *   Include a project description, the tech stack used, and clear instructions on how to set up and run both the backend and frontend servers locally.
