/* T-SQL - Structured Query Language: Ngôn ngữ truy vấn có cấu trúc SQL cho phép Tạo CSDL, Thao tác trên dữ liệu
		(Lưu trữ dữ liệu, Sửa dữ liệu, Xóa dữ liệu) Đa số các DBMS hiện nay sử dụng SQL (MS SQL Server – T- SQL, 
		Microsoft Access, Oracle – PL/SQL, DB2, MySQL…) [DungNA29]
Có thể chia thành 4 nhóm lệnh SQL:
	+ Nhóm truy vấn dữ liệu (DQL): gồm các lệnh truy vấn lựa chọn
	(Select) để lấy thông tin nhưng không làm thay đổi dữ liệu trong các bảng
	+ Nhóm định nghĩa dữ liệu (DDL): Gồm các lệnh tạo, thay đổi các bảng dữ liệu(Create, Drop, Alter, …)
	+ Nhóm thao tác dữ liệu (DML): Gồm các lệnh làm thay đổi dữ liệu (Insert, Delete, Update,…) lưu trong các bảng
	+ Nhóm điều khiển dữ liệu (DCL): Gồm các lệnh quản lý quyền truy nhập vào dữ liệu và các bảng (Grant, Revoke, …)
SQL KHÔNG PHÂN BIỆT CHỮA HOA CHỮ THƯỜNG. [DungNA29]
NGUYÊN TẮC KHI ĐẶT TÊN
	+ Kí tự đầu tiên của một định danh phải là một kí tự chữ cái theo chuẩn Unicode 2.0, hoặc dấu (_),
	hoặc dấu @ (tên biến), hoặc # (bảng tạm).
    + Không trùng với các từ khoá và từ dành riêng của ngôn ngữ T-SQL
    + Không chứa các kí tự đặt biệt +, -, *, /, !, ~, | ....
    + Ví dụ tên hợp lệ: Nhan_vien, _PhongBan
    + Tên không hợp lệ: [%], SELECT
    [DungNA29]
	Ctrl + E = EExxcute câu lệnh khi bôi đen vùng lệnh.
	*/

-- Câu lệnh 1.1: COMMENT TRONG SQL --	
-- (2 dấu gạch liên tiếp): Comment trên một dòng và chỉ có tác dụng trên 1 dòng DungNA29
/*..Comment trên một khối.. */ 
        
/*
	CÂU LỆNH 1.2: CREATE DATABASE
	ĐỊNH NGHĨA: DÙNG ĐỂ TẠO 1 DATABASE TRONG CSDL
	CÔNG THỨC: 
	CREATE DATABASE database_name;
*/
USE Dungna_FPTShopV2;--Chỉ định database nào sẽ làm việc

CREATE DATABASE Dungna_FPTShopV2;


/*
	CÂU LỆNH 1.3: DROP DATABASE
	ĐỊNH NGHĨA: XÓA DATABASE TRONG CSDL
	CÔNG THỨC: 
	DROP DATABASE database_name;
*/
DROP DATABASE Dungna_FPTShopV2;
/*
	CÂU LỆNH 1.4: CREATE TABLE
	ĐỊNH NGHĨA: TẠO BẢNG TRONG CSDL
	CÔNG THỨC: 

	CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
	);
*/
-- Tạo khóa chính trong bảng cách 1
CREATE TABLE DongSanPham(
ID INT PRIMARY KEY IDENTITY, 
MaDSP VARCHAR(10) UNIQUE,
TenDSP NVARCHAR(50) DEFAULT NULL,
);

-- Tạo khóa chính trong bảng cách 2
CREATE TABLE DongSanPham(
ID INT NOT NULL, 
MaDSP VARCHAR(10) UNIQUE,
TenDSP NVARCHAR(50) DEFAULT NULL,
PRIMARY KEY (ID)
);
-- Tạo khóa chính trong bảng cách 3
CREATE TABLE DongSanPham(
ID INT NOT NULL PRIMARY KEY , 
MaDSP VARCHAR(10) UNIQUE,
TenDSP NVARCHAR(50) DEFAULT NULL,  
);
-- Tạo khóa chính trong bảng cách 4
CREATE TABLE DongSanPham(
ID INT, 
MaDSP VARCHAR(10) UNIQUE,
TenDSP NVARCHAR(50) DEFAULT NULL,  
CONSTRAINT PK_DongSP PRIMARY KEY (ID,MaDSP) -- CONSTRAINT, nó chỉ ra quy tắc mà dũ liệu của cột phải tuân theo.
);
-- Trong ví dụ trên chỉ có MỘT KHÓA CHÍNH (PK_Person). Tuy nhiên, GIÁ TRỊ của khóa chính được tạo thành từ HAI CỘT (ID + LastName).

/*
	CÂU LỆNH 1.5: DROP TABLE
	ĐỊNH NGHĨA: XÓA BẢNG TRONG CSDL
	CÔNG THỨC: 
	DROP TABLE table_name;
*/
DROP TABLE DongSanPham;

/*
	CÂU LỆNH 1.6: ALTER TABLE
	ĐỊNH NGHĨA:
		- Câu lệnh ALTER TABLE được sử dụng để thêm, xóa hoặc sửa đổi các cột trong bảng hiện có.
		- Câu lệnh ALTER TABLE cũng được sử dụng để thêm và bỏ các ràng buộc khác nhau trên một bảng hiện có.
	CÔNG THỨC: 
		- Thêm cột:
		ALTER TABLE table_name
		ADD column_name datatype;

		- Xóa cột:
		ALTER TABLE table_name
		DROP COLUMN column_name;

		- ALTER/MODIFY COLUMN: Để thay đổi kiểu dữ liệu của một cột trong bảng
		ALTER TABLE table_name
		ALTER COLUMN column_name datatype;
*/
ALTER TABLE DongSanPham
		ADD ColTest int;

ALTER TABLE DongSanPham
		DROP COLUMN ColTest;

ALTER TABLE DongSanPham
		ALTER COLUMN ColTest varchar(max);

/*
	CÂU LỆNH 1.8: CONSTRAINT
	Câu lệnh 8 Thêm ràng buộc Constraint (Ràng buộc là các qui tắc để hạn chế các giá trị được lưu trữ vào bảng. [DungNA29]
	Các ràng buộc được sử dụng để giới hạn loại dữ liệu có thể đi vào bảng. Điều này đảm bảo tính chính xác và độ tin cậy của dữ liệu trong bảng. Nếu có bất kỳ vi phạm nào giữa ràng buộc và hành động dữ liệu, hành động đó sẽ bị hủy bỏ)

	Ràng buộc NOT NULL trong SQL: Bảo đảm một cột không thể có giá trị NULL.
	Ràng buộc DEFAULT trong SQL: Cung cấp một giá trị mặc định cho cột khi không được xác định.
	Ràng buộc UNIQUE trong SQL: Bảo đảm tất cả giá trị trong một cột là khác nhau.
	Ràng buộc PRIMARY Key trong SQL: Mỗi hàng/bản ghi được nhận diện một cách duy nhất trong một bảng.
	Ràng buộc FOREIGN Key trong SQL: Mỗi hàng/bản ghi được nhận diện một cách duy nhất trong bất kỳ bảng nào.
	Ràng buộc CHECK trong SQL: Bảo đảm tất cả giá trị trong một cột thỏa mãn các điều kiện nào đó.
	Ràng buộc INDEX trong SQL: Sử dụng để tạo và lấy dữ liệu từ Database một cách nhanh chóng. 

	CREATE TABLE table_name (
		column1 datatype constraint, Ràng buộc xuất hiện sau kiểu dữ liệu
		column2 datatype constraint,
		column3 datatype constraint,
		....
	);
*/
CREATE TABLE DongSanPham(
ID INT, 
MaDSP VARCHAR(10) UNIQUE,
TenDSP NVARCHAR(50) DEFAULT NULL,  
CONSTRAINT PK_DongSP PRIMARY KEY (ID,MaDSP) -- CONSTRAINT, nó chỉ ra quy tắc mà dũ liệu của cột phải tuân theo.
);

/*
	CÂU LỆNH 1.9: FOREIGN KEY Constraint
	Tại quan hệ và chỉ định khóa ngoại cho bảng
	-- Cách 1
	 <Tên cột>  <kiểu dữ liệu> FOREIGN KEY REFERENCES <Tên bảng khóa chính>(<Tên khóa chính>)
	-- Cách 2
	CONSTRAINT <Tên khóa ngoại do mình đặt> FOREIGN KEY (<Tên FK trong bảng>)
*/