-- 00_create_database_and_schemas.sql
-- Creates the project database and the three layer schemas (raw, stg, analytics).
-- Safe to re-run: each object is created only if it does not already exist.

IF DB_ID('ComplaintIntelligence') IS NULL
    CREATE DATABASE ComplaintIntelligence;
GO

USE ComplaintIntelligence;
GO

IF SCHEMA_ID('raw') IS NULL
    EXEC('CREATE SCHEMA raw');

IF SCHEMA_ID('stg') IS NULL
    EXEC('CREATE SCHEMA stg');

IF SCHEMA_ID('analytics') IS NULL
    EXEC('CREATE SCHEMA analytics');
GO