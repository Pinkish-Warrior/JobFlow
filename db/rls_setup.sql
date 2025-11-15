-- JobFlow/db/rls_setup.sql

-- This script sets up Row Level Security (RLS) for the JobFlow database.
-- It should be executed in your Supabase SQL Editor.

-- Step 1: Enable RLS on all tables
-- This enforces a "deny by default" policy. No data can be accessed
-- until a policy explicitly grants access.
ALTER TABLE public.Companies ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.JobPositions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.Applications ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.Interviews ENABLE ROW LEVEL SECURITY;

-- Step 2: Add user_id columns to user-specific tables
-- This links records to an authenticated user.
ALTER TABLE public.Applications
ADD COLUMN user_id UUID REFERENCES auth.users(id);

ALTER TABLE public.Interviews
ADD COLUMN user_id UUID REFERENCES auth.users(id);

-- Step 3: Create RLS Policies for the "Applications" table
-- These policies grant access to rows based on the user's ID.

-- 3.1. Allow users to view their own applications
CREATE POLICY "Users can view their own applications"
ON public.Applications FOR SELECT
USING (auth.uid() = user_id);

-- 3.2. Allow users to insert new applications for themselves
CREATE POLICY "Users can insert their own applications"
ON public.Applications FOR INSERT
WITH CHECK (auth.uid() = user_id);

-- 3.3. Allow users to update their own applications
CREATE POLICY "Users can update their own applications"
ON public.Applications FOR UPDATE
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

-- 3.4. Allow users to delete their own applications
CREATE POLICY "Users can delete their own applications"
ON public.Applications FOR DELETE
USING (auth.uid() = user_id);


-- Step 4: Create RLS Policies for other tables (Optional but Recommended)

-- For now, we will allow all authenticated users to view Companies
-- and JobPositions. You can restrict this further if needed.
CREATE POLICY "Allow authenticated users to view companies"
ON public.Companies FOR SELECT
USING (auth.role() = 'authenticated');

CREATE POLICY "Allow authenticated users to view job positions"
ON public.JobPositions FOR SELECT
USING (auth.role() = 'authenticated');

-- Note: You will need to create policies for the "Interviews" table
-- similar to the ones for "Applications" when you start using it.

-- End of RLS Setup Script
