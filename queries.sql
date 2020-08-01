-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

    select ProductName, CategoryName 
    from Product join Category 
    on Product.categoryId = Category.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

    select Id, Shipper.CompanyName from [Order]
    join Shipper on [Order].ShipVia = Shipper.Id
    where OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

    select OrderId, Quantity, [Order].ShipName
    from OrderDetail join [Order]
    on OrderDetail.OrderId = [Order].Id
    where OrderDetail.OrderId = 10251
    order by [Order].ShipName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

    select Id as OrderID, Shipper.CompanyName as "Company Name", Employee.LastName as "Last Name"
    from [Order] join [Shipper] on [Order].ShipVia = Shipper.Id
    join Employee on [Order].EmployeeId = Employee.id