USE AdventureWorksLT2019;

DECLARE @SalesOrderID int = 1;

-- 1.1-2
BEGIN TRY
    IF NOT EXISTS (SELECT 1 FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID)
    BEGIN
        RAISERROR('Заказ # %d не существует', 16, 1, @SalesOrderID);
    END

    DELETE FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @SalesOrderID;
    DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID;
END TRY
BEGIN CATCH
    PRINT N'Ошибка: ' + ERROR_MESSAGE();
END CATCH

-- 2
BEGIN TRY
    BEGIN TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID)
    BEGIN
        RAISERROR('Заказ #%d не существует', 16, 1, @SalesOrderID);
    END

    DELETE FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @SalesOrderID;

    -- Имитация ошибки
    RAISERROR('Имитация ошибки', 16, 1);

    DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
    BEGIN
        ROLLBACK TRANSACTION;
        THROW;
    END
    ELSE
    BEGIN
        PRINT 'Ошибка: ' + ERROR_MESSAGE();
    END
END CATCH
