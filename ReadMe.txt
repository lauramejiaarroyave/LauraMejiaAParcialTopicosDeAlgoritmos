
Creado por: Laura Mejia Arroyave. CC.1020423232. Universidad de Medellín.

Lenguaje: Objective-C

Descripción: El siguiente proyecto tiene como objetivo parsear archivos de tipo XML para generar ordenes de compra aleatorias entre otros puntos especificados tal como se pide en el parcial de Tópicos de Software para el cual se realizó.

Al proyecto se le realizó también la parte gráfica para para que el usuario tenga una experiencia mas comprensible de las Ordenes de compra generadas.

Primero se le pide al usuario ingresar la cantidad de ordenes deseadas, al generarlas obtiene el tiempo que tomaron las ordenes en crearse y puede ver la lista completa de las ordenes, así como acceder a sus detalles, también se puede hacer click tanto en el BuyerCustomerParty como en el SellerSupplierParty para la descripción de cada uno.
En la parte de abajo encuentra una lista de los ítems de la Orden de compra a los cuales por medio de click ve el detalle de cada ítem. 
En la lista de Ordenes generadas hay un botón en la esquina superior derecha para salir y crear nuevas ordenes.




XML parser utilizado: TouchXML es un parseador DOM XML para el iPhone al estilo de NSXML.


Como Utilizar la aplicación?

Fue desarrollado en XCode Version 6.2.

- Se debe descargar el .ZIP en un equipo MAC con XCode instalado.
- Extraer.
- Abrir la carpeta principal.

- Ahora se debe cambiar la siguiente linea para cuando se guarden las nuevas ordenes de compra queden en una ruta válida en su MAC.

- En la raíz del proyecto hacer click en la carpeta TopicosParcial.
- Abrir el archivo: GenerateViewController.m
- En la linea 32 verá lo siguiente:  
  NSString *CopiarAquiSuUsuarioDeMAC = @"lauramejiaarroyave";

- Por favor cambiar @"lauramejiaarroyave” por: @“suUsuarioMAC”;

- Guardar el archivo.

- Devolverse a la carpeta raiz.

- Hacer DoubleClick en topicosParcial.xcodeproj
- (Usar preferiblemente el simulador del iPhone 6 que viene incluido en el XCode)

LISTO!

NOTA:  Recuerde que los archivos .XML generados quedarán guardados con el UUID de la orden y extensión .xml en la ruta: /Users/su usuario.