CREATE DATABASE coffeeshop

USE coffeeshop
SHOW TABLES

/* --- Punto 4 ejercicio 1 --- */
/* ---------- 1. Selecciona todos los clientes que han realizado pedidos. ---------- */
SELECT * FROM cliente;
SELECT * FROM pedido;

SELECT * FROM cliente c
INNER JOIN pedido p ON p.id_cliente = c.id_cliente GROUP BY c.id_cliente;

/* --- Punto 4 ejercicio 2 --- */
/* ---------- 2. Selecciona todos los pedidos que han sido realizados entre dos fechas (dejar el espacio para escribir la fecha según conveniencia). ---------- */
SELECT * FROM pedido;

SELECT * FROM pedido p 
WHERE p.fecha_registro BETWEEN '2024/02/06' AND '2024/03/07'

/* --- Punto 4 ejercicio 3 --- */
/* ---------- 3. Selecciona a todos los clientes y ordénalos según su fecha de nacimiento de forma descendente. ---------- */
SELECT * FROM cliente;

SELECT * FROM cliente c 
ORDER BY c.nacimiento_cliente DESC

/* --- Punto 4 ejercicio 4 --- */
/* ---------- 4. Selecciona los productos que se encuentran dentro de un pedido. ---------- */
SELECT * FROM producto;
SELECT * FROM pedido;
SELECT * FROM detalle_pedido;

SELECT p.id_producto, p.nombre_producto, pe.id_pedido FROM pedido pe
INNER JOIN detalle_pedido dp ON dp.id_pedido = pe.id_pedido
INNER JOIN producto p ON p.id_producto = dp.id_producto
WHERE pe.id_pedido = 1

/* --- Punto 4 ejercicio 5 --- */
/* ---------- 5. Selecciona el producto con el mayor precio. ---------- */
SELECT * FROM producto;

SELECT *, MAX(precio_producto) FROM producto

/* --- Punto 4 ejercicio 6 --- */
/* ---------- 6. Selecciona el promedio de precios de los productos ingresados. ---------- */
SELECT * FROM producto;

SELECT AVG(precio_producto) FROM producto

/* --- Punto 4 ejercicio 7 --- */
/* ---------- 7. Haz una consulta que te permita ver la información de cuantos pedidos se encuentran en estado: Pendiente, Finalizado, Entregado, Anulado. ---------- */
SELECT * FROM pedido;

SELECT estado_pedido, COUNT(estado_pedido) FROM pedido GROUP BY estado_pedido


/* --- Punto 4 ejercicio 8 --- */
/* ---------- 8. Seleccionaa todos los clientes que su nombre empiece por la letra D. ---------- */
SELECT * FROM cliente

SELECT * FROM cliente WHERE nombre_cliente LIKE 'd%'

/* --- Punto 4 ejercicio 9 --- */
/* ---------- 9. Plantear una consulta donde se calculen la cantidad de órdenes agrupadas por cliente, filtradas por fecha y se ordenen los registros de mayor a menor ---------- */
SELECT * FROM cliente;
SELECT * FROM pedido;

SELECT c.nombre_cliente, p.fecha_registro, COUNT(p.id_pedido) AS Ordenes_Realizadas FROM pedido p
INNER JOIN cliente c ON c.id_cliente = p.id_cliente
WHERE p.fecha_registro BETWEEN '2024/02/07' AND '2024/09/12' GROUP BY p.id_cliente ORDER BY p.fecha_registro DESC 

/* --- Punto 4 ejercicio 10 --- */
/* ---------- 10. Haz una consulta que muestre los 3 productos más vendidos. ---------- */
SELECT * FROM producto;
SELECT * FROM pedido;
SELECT * FROM detalle_pedido;

SELECT SUM(cantidad_producto) AS Cantidad_producto_vendido, id_producto FROM detalle_pedido 
GROUP BY id_producto ORDER BY Cantidad_producto_vendido DESC LIMIT 3 

/* --- Punto 4 ejercicio 11 --- */
/* ---------- 11. Haz una consulta que muestre al cliente que más pedidos ha realizado y cuantos pedidos ha realizado. ---------- */
SELECT * FROM cliente;
SELECT * FROM pedido;

SELECT COUNT(p.id_pedido) AS Pedidos_echos, c.nombre_cliente, c.dui_cliente, c.id_cliente FROM pedido p 
INNER JOIN cliente c ON c.id_cliente = p.id_cliente
GROUP BY p.id_cliente ORDER BY Pedidos_echos DESC LIMIT 1 

/* --- Punto 4 ejercicio 12 --- */
/* ---------- 12. Haz una consulta que muestre la información de la tabla, cliente, pedido, detalle pedido, producto. Utiliza la sentencia inner join. ---------- */
SELECT * FROM cliente;
SELECT * FROM pedido;
SELECT * FROM detalle_pedido;
SELECT * FROM producto;

SELECT dp.id_pedido, p.id_cliente, CONCAT(c.nombre_cliente, ' ', c.apellido_cliente) AS nombre_cliente,
p.direccion_pedido, p.estado_pedido, p.fecha_registro AS fecha_pedido, dp.id_detalle, prod.nombre_producto, 
dp.cantidad_producto, dp.precio_producto FROM detalle_pedido dp
INNER JOIN  pedido p ON p.id_pedido = dp.id_pedido
INNER JOIN cliente c ON c.id_cliente = p.id_cliente
INNER JOIN producto prod ON prod.id_producto = dp.id_producto

