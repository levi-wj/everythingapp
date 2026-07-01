-- 1. Create the table
CREATE TABLE event (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    start_time TIMESTAMPTZ NOT NULL,
    end_time TIMESTAMPTZ NOT NULL,
    all_day BOOLEAN NOT NULL DEFAULT false,
    rrule VARCHAR(512), 
    
    -- This is now provided entirely by the client application.
    -- Stored as TIMESTAMPTZ to ensure it is handled in UTC.
    last_edited_at TIMESTAMPTZ NOT NULL,
    
    CONSTRAINT chk_start_before_end CHECK (start_time <= end_time) 
);

GRANT ALL ON TABLE public.event TO authenticated;
GRANT ALL ON TABLE public.event TO anon;
GRANT ALL ON TABLE public.event TO service_role;

-- 2. Create the conflict resolution function
CREATE OR REPLACE FUNCTION enforce_last_edit_wins()
RETURNS TRIGGER AS $$
BEGIN
    -- If the incoming edit's timestamp is older than (or equal to) the currently saved edit, 
    -- we discard the incoming change.
    IF NEW.last_edited_at <= OLD.last_edited_at THEN
        -- Returning OLD skips the update entirely for this row without throwing a database error.
        -- This allows batch syncs to proceed smoothly even if some records are stale.
        RETURN OLD; 
    END IF;
    
    -- If the incoming edit is newer, allow the update to proceed.
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 3. Bind the conflict resolution trigger to the table
CREATE TRIGGER trigger_enforce_last_edit_wins
BEFORE UPDATE ON event
FOR EACH ROW
EXECUTE FUNCTION enforce_last_edit_wins();

ALTER TABLE event ENABLE ROW LEVEL SECURITY;

-- Create a single policy for everything
CREATE POLICY "Allow access to authenticated users" 
ON event 
FOR ALL 
TO authenticated 
USING (true) 
WITH CHECK (true);