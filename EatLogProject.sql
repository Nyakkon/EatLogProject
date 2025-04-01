IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'eatlogdb')
BEGIN
    CREATE DATABASE eatlogdb;
END;
GO

USE eatlogdb;
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tbl_Users' AND xtype='U')
BEGIN
    CREATE TABLE tbl_Users(
        id INT IDENTITY(1,1) CONSTRAINT PK_tbl_Users PRIMARY KEY,
        username NVARCHAR(50) NOT NULL CONSTRAINT UQ_tbl_Users_username UNIQUE,
        role_status TINYINT NOT NULL
            CONSTRAINT DF_tbl_Users_role_id DEFAULT 3,
            CONSTRAINT CK_tbl_Users_role_id CHECK (role_status IN (0,1,2,3,4)),
        password NVARCHAR(512) NOT NULL
    );
END;
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tbl_Information' AND xtype='U')
BEGIN
    CREATE TABLE tbl_Information(
        id INT PRIMARY KEY,
        first_name NVARCHAR(255) NOT NULL,
        last_name NVARCHAR(255) NOT NULL,
        date_of_birth DATE NOT NULL 
            CONSTRAINT DF_tbl_Information_dob DEFAULT GETDATE(),
        email NVARCHAR(255) NOT NULL 
            CONSTRAINT UQ_tbl_Information_email UNIQUE,
        phone_number NVARCHAR(50) NOT NULL
            CONSTRAINT UQ_tbl_Information_phone UNIQUE,
            CONSTRAINT CK_tbl_Information_phone_number CHECK (phone_number NOT LIKE '%[^0-9]%'),
        account_status TINYINT NOT NULL
            CONSTRAINT DF_tbl_Information_account_status DEFAULT 1,
            CONSTRAINT CK_tbl_Information_account_status CHECK (account_status IN (0,1,2)),
        active_account DATETIME NOT NULL 
            CONSTRAINT DF_tbl_Information_active_account DEFAULT GETDATE(),
        address NVARCHAR(MAX) NOT NULL,
        bio NVARCHAR(MAX) NULL,
        update_at DATETIME NOT NULL 
            CONSTRAINT DF_tbl_Information_update_at DEFAULT GETDATE(),
        CONSTRAINT FK_tbl_Information_user_id FOREIGN KEY(id)
            REFERENCES tbl_Users(id)
            ON DELETE CASCADE ON UPDATE CASCADE
    );
END;
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tbl_Account_Status' AND xtype='U')
BEGIN
    CREATE TABLE tbl_Account_Status (
        status_code TINYINT PRIMARY KEY,
        description NVARCHAR(100) NOT NULL
    );
END;
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tbl_Role' AND xtype='U')
BEGIN
    CREATE TABLE tbl_Role(
        role_code TINYINT PRIMARY KEY,
        role_name NVARCHAR(100) NOT NULL
    );
END;
GO

IF NOT EXISTS (SELECT * FROM tbl_Role)
BEGIN
    INSERT INTO tbl_Role (role_code, role_name)
    VALUES 
        (0, N'Hạn Chế'),
        (1, N'Admin'),
        (2, N'Cộng Tác Viên'),
        (3, N'Người Dùng'),
        (4, N'VIP');
END;
GO

IF NOT EXISTS (SELECT * FROM sys.triggers WHERE name = 'trg_tbl_Information_set_update_at')
BEGIN
    EXEC('
    CREATE TRIGGER trg_tbl_Information_set_update_at
    ON dbo.tbl_Information
    AFTER UPDATE
    AS
    BEGIN
        SET NOCOUNT ON;
        UPDATE i
        SET update_at = GETDATE()
        FROM tbl_Information i
        JOIN inserted ins ON i.id = ins.id;
    END;
    ');
END;
GO

IF NOT EXISTS (SELECT * FROM tbl_Account_Status)
BEGIN
    INSERT INTO tbl_Account_Status (status_code, description)
    VALUES 
        (0, N'Bị khóa'),
        (1, N'Chờ xác minh'),
        (2, N'Đã xác minh');
END;
GO
