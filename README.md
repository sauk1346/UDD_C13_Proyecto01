
 [UDD] Desarrollo Web Fullstack C13

# Proyecto 01: Algoritmo de Sistema de Costos 


# 1. Resumen
El programa consiste en la selección de un catálogos de productos, el cual se divide en 2 etapas principales:

- Ingreso de datos.
- Detalles de compra.  

## 1.1 Ingreso de datos

- Mostrar al cliente un catálogo de productos disponibles.
- Solicitar al cliente un producto del catálogo.
- Solicitar al cliente un cupón de descuento en caso de tener uno.
- Solicitar al cliente la cantidad del producto seleccionado.
- Solicitar al cliente el destino de envío.

## 1.2 Detalles de compra
- Mostrar al cliente los detalles de la compra
    - Nombre del producto.
    - Precio original.
    - Cupón de descuento (en caso de que el cliente haya aceptado).
    - IVA (12%).
    - Cantidad de unidades del producto.
    - Peso unitario.
    - Dirección de envío

- Mostrar al cliente el precio final desglosado
    - Precio Original.
    - Descuento cupón.
    - Costo IVA.
    - Descuento por cantidad (si compra es mayor a 1).
    - Costo envío.
    - Precio Final

# 2. Estructura del Algoritmo

El archivo "Proyecto01.psc" está compuesto por las siguientes estructuras:

- Función mostrarCatalogo().
- Función validarItem().
- Función detalleProducto().
- Función costoFinal().
- Algotirmo Principal.

## 2.1 Función mostrarCatalogo()

- Función sin retorno.
- Variables de entrada:
    - catalogo (arreglo unidimensional tipo Caracter).
- Muestra en pantalla la selección de productos disponibles.

```PseInt
Funcion mostrarCatalogo(catalogo)
	Escribir " ";
	Escribir "1: " + catalogo[0];
	Escribir "2: " + catalogo[1];
	Escribir "3: " + catalogo[2];
	Escribir "4: " + catalogo[3];
	Escribir "5: " + catalogo[4];
	Escribir " ";
FinFuncion
```
## 2.2 Función validarItem()

- Función con retorno: 1 o 0.
- Variables de entrada:
    - item (Entero).
- Verifica que el número ingresado corresponde al catálogo de productos (1 a 5).
- Si el número ingresado corresponde al rango del catálogo, la función retorna 1.
- Si el número ingresado no corresponde al rango del catálogo, la función retorna 0.

```PseInt
Funcion validar <- validarItem(item)
	Si item >= 1 & item <= 5
		validar <- 1;
	SiNo
		validar <- 0;
	FinSi
FinFuncion
```

## 2.3 Función detalleProducto()

- Función sin retorno.
- Variables de entrada: 
    - catalogo (arreglo unidimensional tipo Caracter).
    - item (Entero).
    - precio (arreglo unidimensional tipo Real).
    - cupon (Caracter).
    - descuentoCantidad (Entero).
    - iva (Real).
    - cantidad (Entero).
    - peso (arreglo unidimensional tipo Real).
    - costoFijo (Real).
    - costoKilo (Real).
    - costoEnvio (Real).
    - destino (Caracter).
- Muestra el nombre del producto.
- Muestra el precio original.
- Muestra cupón de descuento si el cliente lo seleccionó.
- Muestra valor IVA.
- Muestra la cantidad de unidades.
- Muestra el peso unitario.
- Muestra el destino de envío.

```PseInt
Funcion detalleProducto(catalogo,item,precio,cupon,descuentoCantidad,iva,cantidad,peso,costoFijo,costoKilo,costoEnvio,destino)
	Escribir "Detalles de la compra";
	Escribir "---------------------";
	
	//Mostrar Nombre Producto
	Escribir catalogo[item-1];
	//Mostrar Precio Original
	Escribir "Precio Original: $" + ConvertirATexto(precio[item-1]);
	//Mostrar Cupon Descuento
	Si cupon =="s" | cupon =="S" 
		Escribir "Cupon Descuento: " + ConvertirATexto(descuentoCantidad) + "%";
	FinSi
	//Mostrar IVA
	Escribir "IVA: " + ConvertirATexto(iva) + "%";
	//Mostrar Cantidad Unidades
	Escribir "Cantidad: " ConvertirATexto(cantidad) " unidad(es)";
	//Mostrar Peso Unitario
	Escribir "Peso unitario: " + ConvertirATexto(peso[item-1]) + "kg";
	//Mostrar Destino
	Escribir "Destino: " + destino;
FinFuncion
```

## 2.4 costoFinal()

- Función sin retorno.
- Variables de entrada: 
    - item (Entero).
    - precio (arreglo unidimensional tipo Real).
    - cupon (Caracter).
    - descuentoCantidad (Entero).
    - iva (Real).
    - cantidad (Entero).
    - peso (arreglo unidimensional tipo Real).
    - costoFijo (Real).
    - costoKilo (Real).
    - costoEnvio (Real).
    - destino (Caracter).
- Muestra el precio original.
- Calcula y muestra Descuento Cupón (si cliente lo seleccionó).
- Calcula y muestra Costo IVA.
- Calcula y muestra Descuento por Cantidad (si cantidad > 1).
- Calcula y muestra Costo de Envío.
- Calcula y muestra Precio Final.

El desglose de cálculo se muestra en pantalla mediante:
- Casteo de variables a tipo Caracter.
- Concatenación de variables tipo Caracter.

```
Funcion costoFinal(item,precio,cupon,descuentoCantidad,iva,cantidad,peso,costoFijo,costoKilo,costoEnvio,destino)
	definir aux Como Real; // variable auxiliar (temporal). Se utiliza para ir guardando el precio antes de un descuento o cargo
	Escribir " ";
	Escribir "Precio Final";
	Escribir "------------";
	
	//Precio Original
	aux = precio[item-1];
	precioFinal = cantidad * precio[item-1];
	Escribir "Precio Original: " ConvertirATexto(cantidad)+ "[unid] * $" + ConvertirATexto(aux) " = $" + ConvertirATexto(precioFinal);
	
	//Descuento Cupon
	Si cupon =="s" | cupon =="S" 
		aux = precioFinal;
		precioFinal = precioFinal * (100 - descuentoCantidad)/100;
		Escribir "Cupon Descuento(" + ConvertirATexto(descuentoCantidad) + "%): $" + ConvertirATexto(aux) + " * " + ConvertirATexto((100 - descuentoCantidad)/100) " = $" ConvertirATexto(precioFinal);
	FinSi
	
	//Costo IVA
	aux = precioFinal;
	precioFinal = precioFinal * (1 + iva/100);
	Escribir "IVA(" + ConvertirATexto(iva) + "%): $" + ConvertirATexto(aux) + " * " + ConvertirATexto(1 + iva/100) " = $" ConvertirATexto(precioFinal);
	
	//Descuento por cantidad
	Si cantidad > 1
		aux = precioFinal;
		precioFinal = precioFinal * (100 - descuentoCantidad)/100;
		Escribir "Descuento por cantidad (" + ConvertirATexto(descuentoCantidad) +"%): $" + ConvertirATexto(aux) + " * " + ConvertirATexto((100 - descuentoCantidad)/100) + " = " + ConvertirATexto(precioFinal);
	FinSi
	
	//Costo Envio
	costoEnvio = costoFijo + cantidad * (costoKilo * peso[item-1]);
	Escribir "Costo envio: $" + ConvertirATexto(costoFijo) + "(costo fijo) + " + ConvertirATexto(cantidad) +"[unid] * ( " + ConvertirATexto(costoKilo) + "[$/kg] * " + ConvertirATexto(peso[item-1]) + "[kg] ) = $" + ConvertirATexto(costoEnvio);
	
	//Precio Final
	aux = precioFinal;
	precioFinal = precioFinal + costoEnvio;
	Escribir "Precio Final: $" + ConvertirATexto(aux) +" + $" +ConvertirATexto(costoEnvio) + " = " + ConvertirATexto(precioFinal);
FinFuncion
```

## 2.5 Algoritmo Principal

- Muestra catálogo de productos --> mostrarCatalogo().
- Inicia Bucle. 
    - Solicita ingresar un producto.
    - Verifica si el producto ingresado es correcto --> validarItem().
    - Solicita cupón de descuento en caso de tener.
    - Solicita la cantidad del mismo producto.
    - Solicita el destino de envío.
    - Muestra el detalle del producto --> detalleProducto().
    - Muestra el costo final desglosado --> costoFinal().
    - Solicita continuar o no comprando (seguir o salir del bucle).
- Fin Bucle. 
- Fin Programa.

```PSeInt
Proceso Proyecto01
	Definir item Como Entero;
	Definir validar Como Entero;
	Definir cupon Como Caracter;
	Definir iva Como Real;
	Definir costoFijo Como Real;
	Definir costoKilo Como Real;
	Definir costoEnvio Como Real;
	Definir cantidad Como Entero;
	Definir descuentoCantidad Como Entero;
	Definir destino Como Caracter;
	definir precioFinal Como Real;
	Definir continuar Como Caracter;
	
	Definir catalogo Como Caracter;
	Definir precio Como Real;
	Definir peso Como Real;
	Definir descuento Como Real;

	Dimension catalogo[5];
	Dimension precio[5];
	Dimension peso[5];
	Dimension descuento[5];
	
	iva = 12; // valor iva: 12%
	costoEnvio = 0; // inicializar variable, para poder ingresarla en una funcion
	costoFijo = 10; // usd
	costoKilo = 2; // cada kg tiene un coste de $2 usd
	descuentoCantidad = 5; //si cliente compra mas de un mismo producto, se descuenta un 5%
	
	catalogo[0] <- "Teclado Spektra KB-500";
	catalogo[1] <- "Monitor Samsung 24 pulgadas Full HD";
	catalogo[2] <- "Impresora tinta Canon G510";
	catalogo[3] <- "Tarjeta grafica Nvidia GTX3600";
	catalogo[4] <- "Disco duro WD SSD 4tb";
	
	precio[0] <- 10;  //usd
	precio[1] <- 300; //usd
	precio[2] <- 20;  //usd
	precio[3] <- 500; //usd
	precio[4] <- 250; //usd
	
	peso[0] <- 2;  //kg
	peso[1] <- 10; //kg
	peso[2] <- 8;  //kg
	peso[3] <- 3;  //kg
	peso[4] <- 5;  //kg

	Escribir "-----Bienvenido a la tienda virtual de Computacion-----";
	mostrarCatalogo(catalogo);
	
	Repetir
		Escribir Sin Saltar "Seleccione el item del producto deseado: ";
		Leer item;
		validar <- validarItem(item);
		
		Si validar == 1
			Escribir sin saltar "¿Posee cupon de descuento? (s/n): ";
			Leer cupon;
			
			Escribir sin saltar "Ingrese la cantidad que desea comprar: ";
			Leer cantidad;
			
			Escribir sin saltar "Ingrese el destino a enviar: ";
			Leer destino;
			
			Escribir " ";
			detalleProducto(catalogo,item,precio,cupon,descuentoCantidad,iva,cantidad,peso,costoFijo,costoKilo,costoEnvio,destino);
			costoFinal(item,precio,cupon,descuentoCantidad,iva,cantidad,peso,costoFijo,costoKilo,costoEnvio,destino);
		SiNo
			Escribir "El item ingresado es incorrecto";
		FinSi
		
		Escribir " ";
		Escribir Sin Saltar "¿Desea seleccionar otro producto? (s/n)";
		Leer continuar;
	Hasta Que (continuar = "n") | (continuar = "N")
	
FinProceso
```