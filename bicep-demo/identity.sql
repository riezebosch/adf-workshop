-- copied from: https://docs.microsoft.com/en-us/azure/data-factory/connector-azure-sql-database?tabs=data-factory#managed-identity
CREATE USER [manueladf] FROM EXTERNAL PROVIDER;
ALTER ROLE [db_owner] ADD MEMBER [manueladf];