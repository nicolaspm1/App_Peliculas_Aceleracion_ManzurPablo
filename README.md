# App_Peliculas_Aceleracion_ManzurPablo

Esta APP consiste en un app de películas 🎥 desarrollada para el challenge de Alkemy. Consta de 3 vistas creadas con Xibs y usando Autolayout.
Los datos de las películas se consumen por medio de una API a través de Alamofire y usando como gestor de paquetes Cocoapods.

## Características Desarrollo

- Lenguaje: Swift
-  Patrón de Arquitectura: MVVM
-  API: [The Movie Database (TMDb)](https://www.themoviedb.org)
-  IDE: XCode


## Vistas

### Vista 1

Vista que consta de un campo en el que se debe ingresar un mail para poder loguearse. Tanto en el caso de dejar el campo vacío como ingresar un formato inválido, 
la App mostrará un mensaje de Error.

<img width="337" alt="Captura de Pantalla 2022-06-05 a la(s) 15 04 58" src="https://user-images.githubusercontent.com/69824165/172064353-e9b62710-ab49-4434-a4a2-8f4176a29728.png">


### Vista 2

Vista en la que se muestran por medio del componente de UIKit, UITableView, los nombres de las películas.
Al seleccionar alguna nos llevará a la vista final donde obtendremos más información detallada de la película seleccionada.


<img width="272" alt="Captura de Pantalla 2022-06-05 a la(s) 15 07 44" src="https://user-images.githubusercontent.com/69824165/172064362-be8759a4-8795-4403-98b5-2bfd286605c5.png">


### Vista 3

Vista final donde se muestra información de la película tal como su nombre, género, idioma original, etc. Incluye además una imagen representativa
de la película. Todo esta información se mostrará por medio del componente de UIKit, UIScrollView, el cual nos permitirá poder desplazarnos hacia abajo
para visualizar el resto de la información.

<img width="331" alt="Captura de Pantalla 2022-06-05 a la(s) 15 07 19" src="https://user-images.githubusercontent.com/69824165/172064378-a6180aab-c6ad-4ab9-9db7-9b2d0ed6a505.png">


