🛠️ Stack Tecnológico

* Java: 17

* Framework: Karate DSL 1.4.1 (UI Module)

* Build Tool: Maven 3.8.x

* Navegador: ChromeDriver (Chrome)

🎯 Mejoras y Cobertura (Re-entrega)

En respuesta a las observaciones de la evaluación anterior, se han implementado las siguientes mejoras críticas:

1. Flujo de Compra Integral: Se automatizó el ciclo completo que incluye:


* Inicio de sesión (Login).

* Selección dinámica de productos.

* Gestión del carrito de compras.

* Formulario de checkout (información de envío).

* Resumen de compra y finalización (Confirmación "Thank you for your order").


2. Data-Driven Testing (Scenario Outline): Se implementó el uso de tablas de Examples para ejecutar el mismo flujo de compra con diferentes productos, demostrando la escalabilidad del script. 

3. Localización Avanzada: Uso de selectores robustos (XPath con ejes como ancestor y selectores de CSS) para garantizar la estabilidad de la prueba ante cambios menores en el DOM.

4. Gestión de Datos Externa: Los datos sensibles de acceso se manejan a través de un archivo datos_login.json para facilitar el mantenimiento.

🏃 Ejecución de Pruebas

Para ejecutar la suite E2E, asegúrate de tener instalado el ChromeDriver y utiliza el siguiente comando:

Bash
mvn clean test "-Dkarate.options=--tags @e2e"

📊 Reportes y Evidencias

Al finalizar la ejecución, Karate genera automáticamente reportes detallados que incluyen capturas de pantalla de los pasos realizados:

* Ruta del reporte: target/karate-reports/karate-summary.html

* Instrucciones: Abrir el archivo en cualquier navegador para visualizar el detalle de la ejecución, evidencias visuales y tiempos de carga.