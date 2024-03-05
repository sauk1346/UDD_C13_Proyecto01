//PROYECTO 01
//Leer el precio original del producto.
//Aplicar un descuento al producto si es aplicable (por ejemplo, si el cliente tiene un cupón de descuento).
//Aplicar impuestos al producto (por ejemplo, el IVA u otros impuestos).
//Si el cliente compra más de un artículo, aplicar un descuento por cantidad.
//Calcular el costo de envío basado en el destino y el peso del paquete.
//Calcular el costo final del producto sumando el precio con descuento, impuestos, descuento por cantidad y costo de envío.
//Mostrar el costo final del producto, desglosando los diferentes componentes (descuentos, impuestos, descuento por cantidad y costo de envío).

Funcion mostrarCatalogo(catalogo)
	Escribir " ";
	Escribir "1: " + catalogo[0];
	Escribir "2: " + catalogo[1];
	Escribir "3: " + catalogo[2];
	Escribir "4: " + catalogo[3];
	Escribir "5: " + catalogo[4];
	Escribir " ";
FinFuncion

Funcion validar <- validarItem(producto,item)
	Si item >= 1 & item <= 5
		validar <- 1;
	SiNo
		validar <- 0;
	FinSi
FinFuncion

Funcion detalleProducto(catalogo,item,precio,cupon,descuentoCantidad,iva,cantidad,peso,costoFijo,costoKilo,costoEnvio,destino)
	Escribir "Detalles de la compra";
	Escribir "---------------------";
	Escribir catalogo[item-1];
	
	//Precio Inicial
	precioFinal = precio[item-1];
	Escribir "Precio Original: $" + ConvertirATexto(precioFinal);
	
	//Cupon Descuento
	Si cupon =="s" | cupon =="S" 
		Escribir "Cupon Descuento: " + ConvertirATexto(descuentoCantidad) + "%";
		precioFinal = precioFinal * (100 - descuentoCantidad)/100;
	FinSi
	
	//IVA
	Escribir "IVA: " + ConvertirATexto(iva) + "%";
	precioFinal = precioFinal * (1 + iva/100);
	
	//Cantidad Unidades
	Escribir "Cantidad: " ConvertirATexto(cantidad) " unidad(es)";
	
	//Peso Producto
	Escribir "Peso unitario: " + ConvertirATexto(peso[item-1]) + "kg";
	
	//Destino
	Escribir "Destino: " + destino;
FinFuncion

Funcion costoFinal(catalogo,item,precio,cupon,descuentoCantidad,iva,cantidad,peso,costoFijo,costoKilo,costoEnvio,destino)
	definir aux Como Real; // variable auxiliar (temporal). Se utiliza para ir guardando el precio antes de un descuento o cargo
	Escribir " ";
	Escribir "Precio Final";
	Escribir "------------";
	
	//Precio Inicial
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
		validar <- validarItem(catalogo,item);
		
		Si validar == 1
			Escribir sin saltar "¿Posee cupon de descuento? (s/n): ";
			Leer cupon;
			
			Escribir sin saltar "Ingrese la cantidad que desea comprar: ";
			Leer cantidad;
			
			Escribir sin saltar "Ingrese el destino a enviar: ";
			Leer destino;
			
			Escribir " ";
			detalleProducto(catalogo,item,precio,cupon,descuentoCantidad,iva,cantidad,peso,costoFijo,costoKilo,costoEnvio,destino);
			costoFinal(catalogo,item,precio,cupon,descuentoCantidad,iva,cantidad,peso,costoFijo,costoKilo,costoEnvio,destino);

		SiNo
			Escribir "El item ingresado es incorrecto";
			
		FinSi
		
		Escribir " ";
		Escribir Sin Saltar "¿Desea seleccionar otro producto? (s/n)";
		Leer continuar;
	Hasta Que (continuar = "n") | (continuar = "N")
	
FinProceso