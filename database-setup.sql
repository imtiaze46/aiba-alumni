-- Alumni Directory Database Setup
-- This script creates the necessary table for tracking search statistics

-- Create search_stats table
CREATE TABLE IF NOT EXISTS search_stats (
    id INTEGER PRIMARY KEY,
    total_searches INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert initial row
INSERT INTO search_stats (id, total_searches)
VALUES (1, 0)
ON CONFLICT (id) DO NOTHING;

-- Create index for better performance
CREATE INDEX IF NOT EXISTS idx_search_stats_id ON search_stats(id);

-- Add comment to table
COMMENT ON TABLE search_stats IS 'Tracks the total number of searches performed in the alumni directory';
COMMENT ON COLUMN search_stats.id IS 'Primary key (always 1 for single row)';
COMMENT ON COLUMN search_stats.total_searches IS 'Total number of searches performed';
COMMENT ON COLUMN search_stats.created_at IS 'Timestamp when the record was created';
COMMENT ON COLUMN search_stats.updated_at IS 'Timestamp when the record was last updated';

-- Query to check current stats
-- SELECT * FROM search_stats WHERE id = 1;

-- Query to reset stats (if needed)
-- UPDATE search_stats SET total_searches = 0 WHERE id = 1;
