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
DROP TABLE SanPham;
-- Cách 1:
CREATE TABLE SanPham(
ID INT PRIMARY KEY IDENTITY,
MaSP VARCHAR(50) UNIQUE DEFAULT NULL,
TenSP VARCHAR(100) DEFAULT NULL,
ManHinh VARCHAR(100) DEFAULT NULL,
MotaSP NVARCHAR(255) DEFAULT NULL,
TrongLuongSP DECIMAL DEFAULT 0,
GiaNhap DECIMAL DEFAULT 0,
SoLuong INT DEFAULT 0,
IDDongSP INT FOREIGN KEY REFERENCES DongSanPham(ID),
TrangThai INT DEFAULT 0
);
-- Cách 2:
CREATE TABLE SanPham(
ID INT PRIMARY KEY IDENTITY,
MaSP VARCHAR(50) UNIQUE DEFAULT NULL,
TenSP VARCHAR(100) DEFAULT NULL,
ManHinh VARCHAR(100) DEFAULT NULL,
MotaSP NVARCHAR(255) DEFAULT NULL,
TrongLuongSP DECIMAL DEFAULT 0,
GiaNhap DECIMAL DEFAULT 0,
SoLuong INT DEFAULT 0,
IDDongSP INT,
TrangThai INT DEFAULT 0
CONSTRAINT FK_DongSanPham FOREIGN KEY (IDDongSP)
REFERENCES DongSanPham(ID)
);
-- Cách 3: Sử dụng câu lệnh ALTER để tạo khóa phụ cho bảng
CREATE TABLE SanPham(
ID INT PRIMARY KEY IDENTITY,
MaSP VARCHAR(50) UNIQUE DEFAULT NULL,
TenSP VARCHAR(100) DEFAULT NULL,
ManHinh VARCHAR(100) DEFAULT NULL,
MotaSP NVARCHAR(255) DEFAULT NULL,
TrongLuongSP DECIMAL DEFAULT 0,
GiaNhap DECIMAL DEFAULT 0,
SoLuong INT DEFAULT 0,
IDDongSP INT DEFAULT 0,
TrangThai INT DEFAULT 0
);

ALTER TABLE SanPham
ADD FOREIGN KEY (IDDongSP) REFERENCES DongSanPham(ID);

ALTER TABLE SanPham
ADD CONSTRAINT FK_DongSanPham
FOREIGN KEY (IDDongSP) REFERENCES DongSanPham(ID);

/*
	CÂU LỆNH 2.0: INSERT INTO 
	Thêm dữ liệu vào bảng và có thể viết theo 2 cách

	-- Cách 1: Chỉ định cột và giá trị sẽ được chèn
	 INSERT INTO table_name (column1, column2, column3, ...)
	 VALUES (value1, value2, value3, ...);

	-- Cách 2: đảm bảo thứ tự của các giá trị theo cùng thứ tự với các cột trong bảng
	INSERT INTO table_name
	VALUES (value1, value2, value3, ...);
*/
INSERT INTO DongSanPham(MaDSP,TenDSP)
VALUES ('DSP01',N'Siêu mỏng'),
	('DSP02',N'Siêu mỏng 2');

INSERT INTO DongSanPham
VALUES ('DSP03',N'Siêu mỏng'),
	('DSP04',N'Siêu mỏng 2');

/*
	CÂU LỆNH 2.1: SELECT   
	Câu lệnh SELECT được sử dụng để chọn dữ liệu từ cơ sở dữ liệu.
	Dữ liệu trả về được lưu trữ trong một bảng kết quả, được gọi là tập kết quả.

	-- Cú pháp: Ở đây, column1, column2, ... là tên trường của bảng mà bạn muốn chọn dữ liệu
	SELECT column1, column2, ...
	FROM table_name;

	SELECT * FROM table_name;

*/
SELECT MaDSP,TenDSP FROM DongSanPham;
SELECT * FROM DongSanPham;

/*
	CÂU LỆNH 2.2: Aliases   
	Bí danh SQL được sử dụng để đặt tên tạm thời cho một bảng hoặc một cột trong bảng.
	Bí danh thường được sử dụng để làm cho tên cột dễ đọc hơn.
	Bí danh chỉ tồn tại trong thời gian truy vấn.

	-- Cú pháp cột bí danh:
	SELECT column_name AS alias_name
	FROM table_name;

	-- Cú pháp bảng bí danh:
	SELECT column_name(s)
	FROM table_name AS alias_name;
*/
SELECT MaDSP AS N'Mã Dòng Sản Phẩm',
	   TenDSP AS TenDSPDungna 
FROM DongSanPham; 

SELECT dsp.MaDSP,dsp.ID
FROM DongSanPham AS dsp;

/*
	CÂU LỆNH 2.2: SELECT DISTINCT   
	Câu lệnh SELECT DISTINCT chỉ được sử dụng để trả về các giá trị riêng biệt (khác nhau).
	tên trong một bảng, một cột thường chứa nhiều giá trị trùng lặp; và đôi khi bạn chỉ muốn liệt kê các giá trị khác nhau (riêng biệt).
	
	-- Cú pháp cột bí danh:
	SELECT DISTINCT column1, column2, ...
	FROM table_name;
	
*/
SELECT DISTINCT TenDSP
FROM DongSanPham;

/*
	CÂU LỆNH 2.3: SELECT TOP Clause  
	Mệnh đề SELECT TOP được sử dụng để chỉ định số lượng bản ghi trả về.
	Mệnh đề SELECT TOP hữu ích trên các bảng lớn với hàng nghìn bản ghi. Trả lại một số lượng lớn bản ghi có thể ảnh hưởng đến hiệu suất.
	
	-- Cú pháp: 
	SELECT TOP number|percent column_name(s)
	FROM table_name
	WHERE condition;

*/
SELECT TOP 2 * FROM DongSanPham;
SELECT TOP 50 PERCENT * FROM DongSanPham;

/* 
	CÂU LỆNH 2.4:WHERE 
	- Được sử dụng để lọc các bản ghi. 
	- Mệnh đề WHERE được sử dụng để chỉ trích xuất những bản ghi đáp ứng một điều kiện cụ thể. [DungNA29]

	-- Cú pháp:
	SELECT column1, column2, ...
	FROM table_name
	WHERE condition;

	=	Equal - So sánh	
	>	Greater than - Lớn hơn	
	<	Less than - Nhỏ hơn 	
	>=	Greater than or equal - Lớn hơn hoặc bằng	
	<=	Less than or equal - Nhỏ hơn hoặc bằng	
	<>	Not equal. Note: In some versions of SQL this operator may be written as !=	 -  Khác
	BETWEEN	Between a certain range	 - Trong Khoảng  - Sẽ Giải thích trong phần riêng
	LIKE	Search for a pattern	-  Tìm kiếm theo mẫu - Sẽ Giải thích trong phần riêng
	IN	To specify multiple possible values for a column - Sẽ Giải thích trong phần riêng [DungNA29]
	Lưu ý: Mệnh đề WHERE không chỉ được sử dụng trong câu lệnh 
	SELECT, nó còn được sử dụng trong CẬP NHẬT, câu lệnh XÓA, v.v.! [DungNA29]
*/
SELECT * FROM DongSanPham WHERE ID = 1;
SELECT TOP 100 PERCENT * FROM DongSanPham WHERE TenDSP = N'Siêu mỏng';

/*
	CÂU LỆNH 2.5: DELETE  
	Câu lệnh DELETE được sử dụng để xóa các bản ghi hiện có trong bảng.

	-- Cú pháp: 
	DELETE FROM table_name WHERE condition;

	-- Lưu ý: Hãy cẩn thận khi xóa các bản ghi trong bảng! Lưu ý mệnh đề WHERE trong câu lệnh DELETE. 
	Mệnh đề WHERE chỉ định (các) bản ghi nào nên được xóa. Nếu bạn bỏ qua mệnh đề WHERE, 
	tất cả các bản ghi trong bảng sẽ bị xóa!
*/
DELETE FROM DongSanPham WHERE ID = 1;
DELETE FROM DongSanPham;-- Nếu không sử dụng điều kiện thì sẽ xóa hết các bản ghi trong bảng

/*
	CÂU LỆNH 2.5: UPDATE   
	Câu lệnh UPDATE được sử dụng để sửa đổi các bản ghi hiện có trong bảng.

	-- Cú pháp: 
	UPDATE table_name
	SET column1 = value1, column2 = value2, ...
	WHERE condition;

	-- Lưu ý: Hãy cẩn thận khi cập nhật các bản ghi trong bảng! Lưu ý mệnh đề WHERE trong câu lệnh UPDATE. 
	Mệnh đề WHERE chỉ định (các) bản ghi sẽ được cập nhật. Nếu bạn bỏ qua mệnh đề WHERE, 
	tất cả các bản ghi trong bảng sẽ được cập nhật!
*/
UPDATE DongSanPham
SET TenDSP = 'Dungna', MaDSP= 'Dungna29'
WHERE ID = 2;

/*
	CÂU LỆNH 2.6: TOÁN TỬ LIKE   
	Toán tử LIKE được sử dụng trong mệnh đề WHERE để tìm kiếm một mẫu cụ thể trong một cột.

	Có hai ký tự đại diện thường được sử dụng cùng với toán tử LIKE:

	% - Dấu phần trăm đại diện cho không, một hoặc nhiều ký tự
	_ - Dấu gạch dưới thể hiện một ký tự

		LIKE Operator					Description
	WHERE CustomerName LIKE 'a%'	Finds any values that start with "a" - Tìm bất kỳ giá trị nào bắt đầu bằng "a"
	WHERE CustomerName LIKE '%a'	Finds any values that end with "a" - Tìm bất kỳ giá trị nào kết thúc bằng "a"
	WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position - Tìm bất kỳ giá trị nào có "or" ở bất kỳ vị trí nào
	WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position - Tìm bất kỳ giá trị nào có "r" ở vị trí thứ hai
	WHERE CustomerName LIKE 'a_%'	Finds any values that start with "a" and are at least 2 characters in length - Tìm bất kỳ giá trị nào bắt đầu bằng "a" và có ít nhất 2 ký tự
	WHERE CustomerName LIKE 'a__%'	Finds any values that start with "a" and are at least 3 characters in length - Tìm bất kỳ giá trị nào bắt đầu bằng "a" và có ít nhất 3 ký tự
	WHERE ContactName LIKE 'a%o'	Finds any values that start with "a" and ends with "o" - Tìm bất kỳ giá trị nào bắt đầu bằng "a" và kết thúc bằng "o"


	-- Cú pháp: 
	SELECT column1, column2, ...
	FROM table_name
	WHERE columnN LIKE pattern;	
*/