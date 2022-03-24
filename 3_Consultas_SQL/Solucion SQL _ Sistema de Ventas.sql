


---------------------------------------------------
-- Consultas SQL: Sistema de Ventas - Supermercado
---------------------------------------------------



-- 1. Mostrar la lista de productos vendidos(solo su ID) sin repeticiones
--    y con el total vendido.

SELECT VD_ProdId AS Producto,
		SUM(VD_Cantidad * VD_Precio) AS Total
FROM ventas_detalle
GROUP BY Producto




-- 2. Mostrar la fecha de factura, nro. de factura, ID de cliente, razon social del
--    cliente y monto total vendido.

SELECT Ventas_Fecha AS Fecha, Ventas_NroFactura AS Factura,
		Ventas_CliId AS Cliente, Cli_RazonSocial AS Nombre,
		Ventas_Total AS Total
FROM ventas
	JOIN clientes ON Ventas_CliId = Cli_Id



	
-- 3. Mostrar todos los articulos cuya descripcion comience con la palabra 'FICHA'.

SELECT Prod_Id, Prod_Descripcion
FROM productos
WHERE Prod_Descripcion LIKE 'FICHA%'




-- 4. Mostrar la cantidad de productos diferentes que se han vendido.

SELECT COUNT(DISTINCT(VD_ProdId)) AS 'Cantidad'
FROM productos
	JOIN ventas_detalle ON Prod_Id = VD_ProdId





-- 5. Mostrar la fecha de factura, nro. de factura, ID del producto, descripcion del producto,
--    ID del proveedor, nombre de proveedor, cantidad, precio unitario y parcial (cantidad * precio).

SELECT Ventas_Fecha AS Fecha, Ventas_NroFactura AS Factura,
			VD_ProdId AS Producto, Prod_Descripcion AS Descripcion,
			Prod_ProvId AS Proveedor, Prov_Nombre AS Nombre,
			VD_Cantidad AS Cantidad, VD_Precio AS 'Precio Unitario',
			(VD_Cantidad * VD_Precio) AS Parcial
FROM ventas
	JOIN ventas_detalle ON Ventas_Id = VD_VentasId
	JOIN productos ON VD_ProdId = Prod_Id
	JOIN proveedores ON Prod_ProvId = Prov_Id




-- 6. Mostrar todos los articulos que en su descripcion, color o nombre de proveedor tenga
--    el string 'SIERRA'.

SELECT Prod_Id AS 'ID Producto',
		Prod_Descripcion AS Descripcion,
		Prod_Color AS Color,
		Prod_ProvId AS 'ID Proveedor',
		Prov_Nombre AS Proveedor
FROM productos
	JOIN proveedores ON Prod_ProvId = Prov_Id
WHERE CONCAT(Prod_Descripcion, Prod_Color, Prov_Nombre) LIKE '%SIERRA%'




-- 7. Mostrar el total vendido de los productos que fueron vendidos entre el '01/02/2018'
--    y el '01/03/2018' y cuyo proveedor se encuentre entre el 101 y el 200.

SELECT SUM(VD_Cantidad * VD_Precio) AS 'Total Vendido'
FROM ventas_detalle
	JOIN productos ON VD_ProdId = Prod_Id
	JOIN ventas ON VD_VentasId = Ventas_Id
WHERE (Ventas_Fecha BETWEEN '2018-02-01' AND '2018-03-01') AND
		(Prod_ProvId BETWEEN 101 AND 200)

		


-- 8. Mostrar todos los productos que hayan sido vendidos entre el 10/02/2018 y el 
--    14/02/2018 (sin repetir) y calcular la cantidad de unidades vendidas.

SELECT VD_ProdId, Prod_Descripcion, SUM(VD_Cantidad) AS Parcial
FROM productos
	JOIN ventas_detalle ON VD_ProdId = Prod_Id
	JOIN ventas ON VD_VentasId = Ventas_Id
WHERE Ventas_Fecha BETWEEN '2018-02-10' AND '2018-02-14'
GROUP BY VD_ProdId
ORDER BY VD_ProdId





-- 9. Mostrar todos los articulos cuya descripcion tenga el String 'TEFLON' y que 
--    tengan ventas realizadas.

SELECT Prod_Id, Prod_Descripcion
FROM productos
WHERE Prod_Descripcion LIKE '%TEFLON%'
	AND Prod_Id IN (SELECT DISTINCT(VD_ProdId)
						FROM ventas_detalle)



						
-- 10. Mostrar la factura de valor maximo, que haya tenido en sus items vendidos, el producto 456.

-- primera forma:

SELECT Ventas_Id, Ventas_NroFactura, Max(Ventas_Total) AS 'Valor Maximo'
FROM ventas
WHERE Ventas_Id IN ( SELECT DISTINCT(Ventas_Id)
							FROM ventas_detalle
								JOIN ventas ON VD_VentasId = Ventas_Id
							WHERE VD_ProdId = 456)

							

							
-- segunda forma:

SELECT a.VD_VentasId, a.Ventas_NroFactura, MAX(a.Parcial) AS 'Valor Maximo'
FROM (
		SELECT VD_VentasId, Ventas_NroFactura, SUM(VD_Cantidad * VD_Precio) AS 'Parcial'
		FROM ventas_detalle
			JOIN ventas ON VD_VentasId = Ventas_Id
		WHERE VD_VentasId IN (SELECT DISTINCT(Ventas_Id)
									FROM ventas_detalle
										JOIN ventas ON VD_VentasId = Ventas_Id
									WHERE VD_ProdId = 456)
		GROUP BY VD_VentasId) AS a

		