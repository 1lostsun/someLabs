USE AdventureWorksLT2019;

--1.1-2
DECLARE @schemaName sysname = 'SalesLT';
DECLARE @tableName sysname = 'Product';
DECLARE @stringToFind nvarchar(2000) = 'Bike';
DECLARE @sql nvarchar(max);

DECLARE @columns TABLE (ColumnName sysname, Type sysname);

INSERT INTO @columns (ColumnName, Type)
SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = @schemaName
    AND TABLE_NAME = @tableName
    AND DATA_TYPE IN ('char', 'nchar', 'varchar', 'nvarchar', 'text', 'ntext');

SET @sql = 'SELECT * FROM ' + QUOTENAME(@schemaName) + '.' + QUOTENAME(@tableName) + ' WHERE ';

DECLARE @column sysname;
DECLARE @type sysname;
DECLARE @firstColumn bit = 1;

DECLARE column_cursor CURSOR FOR
SELECT ColumnName, Type FROM @columns;

OPEN column_cursor;
FETCH NEXT FROM column_cursor INTO @column, @type;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF @firstColumn = 0
    BEGIN
        SET @sql = @sql + ' OR ';
    END
    ELSE
    BEGIN
        SET @firstColumn = 0;
    END

    SET @sql = @sql + QUOTENAME(@column) + ' LIKE ''%' + @stringToFind + '%''';

    FETCH NEXT FROM column_cursor INTO @column, @type;
END

CLOSE column_cursor;
DEALLOCATE column_cursor;

PRINT @sql;

EXEC sp_executesql @sql;


GO

--2.1
CREATE PROCEDURE SalesLT.uspFindStringInTable
    @schema sysname,
    @table sysname,
    @stringToFind nvarchar(2000)
AS
BEGIN
    DECLARE @sql nvarchar(max);
    DECLARE @result int = 0;

    DECLARE @columns TABLE (ColumnName sysname, Type sysname);

    INSERT INTO @columns (ColumnName, Type)
    SELECT 
        COLUMN_NAME,
        DATA_TYPE
    FROM 
        INFORMATION_SCHEMA.COLUMNS
    WHERE 
        TABLE_SCHEMA = @schema
        AND TABLE_NAME = @table
        AND DATA_TYPE IN ('char', 'nchar', 'varchar', 'nvarchar', 'text', 'ntext');

    SET @sql = 'SELECT * FROM ' + QUOTENAME(@schema) + '.' + QUOTENAME(@table) + ' WHERE ';

    DECLARE @column sysname;
    DECLARE @type sysname;
    DECLARE @firstColumn bit = 1;

    DECLARE column_cursor CURSOR FOR
    SELECT ColumnName, Type FROM @columns;

    OPEN column_cursor;
    FETCH NEXT FROM column_cursor INTO @column, @type;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @firstColumn = 0
        BEGIN
            SET @sql = @sql + ' OR ';
        END
        ELSE
        BEGIN
            SET @firstColumn = 0;
        END

        SET @sql = @sql + QUOTENAME(@column) + ' LIKE ''%' + @stringToFind + '%''';

        FETCH NEXT FROM column_cursor INTO @column, @type;
    END

    CLOSE column_cursor;
    DEALLOCATE column_cursor;

    EXEC sp_executesql @sql;

    SET @result = @@ROWCOUNT;
    RETURN @result;
END;
GO

DECLARE @result int;
EXEC @result = SalesLT.uspFindStringInTable 'SalesLT', 'Product', 'Bike';
PRINT N'Найдено строк: ' + CAST(@result AS nvarchar);
GO


--2.2
GO
DECLARE @stringToFind nvarchar(2000) = 'Bike';

DECLARE @schema sysname;
DECLARE @table sysname;
DECLARE @result int;

DECLARE table_cursor CURSOR FOR
SELECT 
    TABLE_SCHEMA, 
    TABLE_NAME
FROM 
    INFORMATION_SCHEMA.TABLES
WHERE 
    TABLE_TYPE = 'BASE TABLE';

OPEN table_cursor;
FETCH NEXT FROM table_cursor INTO @schema, @table;

WHILE @@FETCH_STATUS = 0
BEGIN
    BEGIN TRY
        EXEC @result = SalesLT.uspFindStringInTable @schema, @table, @stringToFind;
        IF @result > 0
        BEGIN
            PRINT N'В таблице ' + QUOTENAME(@schema) + '.' + QUOTENAME(@table) + N' найдено строк: ' + CAST(@result AS nvarchar);
        END
        ELSE
        BEGIN
            PRINT N'В таблице ' + QUOTENAME(@schema) + '.' + QUOTENAME(@table) + N' не найдено строк совпадений';
        END
    END TRY
    BEGIN CATCH
        PRINT N'Ошибка при поиске в таблице ' + QUOTENAME(@schema) + '.' + QUOTENAME(@table) + ': ' + ERROR_MESSAGE();
    END CATCH

    FETCH NEXT FROM table_cursor INTO @schema, @table;
END

CLOSE table_cursor;
DEALLOCATE table_cursor;
