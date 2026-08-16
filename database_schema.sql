-- Database Schema for Cherished Memory Archive
-- Organizes personal media with descriptive metadata for efficient data retrieval

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Memories (
    memory_id INT PRIMARY KEY,
    user_id INT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    file_path VARCHAR(255) NOT NULL, -- Path to uploaded media files
    upload_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Metadata (
    meta_id INT PRIMARY KEY,
    memory_id INT,
    tag_name VARCHAR(50),
    category VARCHAR(100),
    FOREIGN KEY (memory_id) REFERENCES Memories(memory_id)
);

-- Optimized Query example for seamless data retrieval
-- SELECT m.title, m.file_path, meta.tag_name 
-- FROM Memories m 
-- JOIN Metadata meta ON m.memory_id = meta.memory_id;
