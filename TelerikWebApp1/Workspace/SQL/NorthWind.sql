SELECT	*
FROM	Customers

SELECT	ROW_NUMBER() over (ORDER BY o.OrderID, od.ProductID),
		o.OrderID,
		(SELECT		c.CompanyName
			FROM	Customers c
			WHERE	c.CustomerID = o.CustomerID) [CustomerName],
		(SELECT		e.FirstName+' '+e.LastName
			FROM	Employees e
			WHERE	e.EmployeeID = o.EmployeeID) [EmployeeName],
		o.OrderDate,
		(SELECT		s.CompanyName
			FROM	Shippers s
			WHERE	s.ShipperID = o.ShipVia) [Shipper],
		(SELECT		p.ProductName
			FROM	Products p 
			WHERE	p.ProductID = od.ProductID) [ProductName]
FROM	[Order Details] od
JOIN	Orders o
ON od.OrderID=o.OrderID
GO

SELECT *
FROM	Shippers s
Order by s.ShipperID
GO



ALTER PROC GetOrderWithShippers
AS
	SELECT		o.OrderID,
				ISNULL((SELECT		c.CompanyName
						FROM	Customers c
						WHERE	c.CustomerID = o.CustomerID), '-') [CustomerName],
				ISNULL((SELECT		e.FirstName+' '+e.LastName
						FROM	Employees e
						WHERE	e.EmployeeID = o.EmployeeID),'-') [EmployeeName],
				o.OrderDate,
				(SELECT		s.CompanyName
					FROM	Shippers s
					WHERE	s.ShipperID = o.ShipVia) [Shipper]
	FROM		Orders o
	
GO


CREATE PROC	GetCustomerInfo
AS
	SELECT	c.CustomerID,c.CompanyName [CustomerName]
	FROM	Customers c
GO


ALTER PROC	GetEmpInfo
AS
	SELECT	e.EmployeeID, e.FirstName+' '+e.LastName [EmployeeName]
	FROM	Employees e
GO


CREATE PROC GetShipperInfo
AS
	SELECT	s.ShipperID, s.CompanyName
	FROM	Shippers s
GO

ALTER PROC	UpdateOrders
(
	@OrderId		INT,
	@OrderDate		DATETIME,
	@Shipper		NVARCHAR(80)
)
AS
	UPDATE		[Orders]
	SET			OrderDate = @OrderDate,
				ShipVia = (		SELECT	s.ShipperID
								FROM	Shippers s
								WHERE	s.CompanyName = @Shipper)
	WHERE		OrderID = @OrderId	
GO


SELECT *
FROM    Orders