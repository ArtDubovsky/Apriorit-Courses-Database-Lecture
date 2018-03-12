IF  NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = N'SqlLectureDb')
BEGIN
    CREATE DATABASE SqlLectureDb
END;
