# Prompts utilizados — Laboratorio 04

## Herramienta de IA utilizada
ChatGPT / Claude

## Caso 2B — Biblioteca
### Funcionalidades de la aplicación (Caso 2B)

El código implementa un sistema básico de gestión de biblioteca que modela libros y sus estados de préstamo utilizando **Tipos por Valor (`struct`)** y **Tipos por Referencia (`class`)**:

* **Gestión de Estados (`enum EstadoLibro`):** Define los estados posibles para cada libro mediante una enumeración (`disponible` y `prestado`).
* **Representación de Datos (`struct Libro`):** Define el objeto `Libro` con las propiedades `titulo`, `autor` y `estado` (cuyo valor por defecto es `.disponible`).
* **Administración de la Biblioteca (`class Biblioteca`):** Contiene un arreglo mutable de objetos `Libro` y expone los siguientes métodos:
  * **`agregar(libro:)`:** Añade una nueva instancia de `Libro` al arreglo `libros`.
  * **`prestar(titulo:)`:** Recorre el arreglo por índice (`for i in 0..<libros.count`). Si encuentra el título y su estado es `.disponible`, lo cambia a `.prestado` y aprueba la operación. Si ya está prestado o no existe, imprime el mensaje de error correspondiente.
  * **`devolver(titulo:)`:** Busca el libro por título. Si su estado es `.prestado`, lo actualiza a `.disponible` y registra la devolución. De lo contrario, notifica el error.
  * **`inventario()`:** Recorre la lista completa de libros y utiliza una sentencia `switch` para evaluar el enum `EstadoLibro`, imprimiendo el título, autor y estado actual de cada libro.

### Prompt 1:
"Soy estudiante de Swift, cuarta semana, trabajo en un Playground de Xcode. Necesito una biblioteca con enum EstadoLibro, struct Libro y class Biblioteca con prestar, devolver e inventario. Restricciones: Solo struct, class, herencia, enums, arrays, bucles y funciones. Sin optionals ni guard let, sin firstIndex(where:), sin didSet, sin propiedades calculadas, sin genéricos."

### Respuesta de la IA:
Generó la estructura con enum, struct y class utilizando un bucle `for i in 0..<libros.count` para buscar los libros y mutar directamente el arreglo.

### ¿Funcionó a la primera?
Sí, gracias a las restricciones especificadas en el prompt.

### ¿Usó algo que no hemos visto en clase?
No, se ajustó exactamente a bucles por índice y `switch`.

## Mi versión (Parte A) vs. la versión de la IA (Parte B)

### ¿Qué hizo distinto la IA respecto a mi solución?
Ambas soluciones coinciden en la lógica central. La IA organizó los comentarios línea por línea explicando detenidamente el uso de referencias vs valor.

### ¿Qué me pareció mejor de MI versión?
La simplicidad directa de haber resuelto la lógica sin depender de ayuda externa.

### ¿Qué me pareció mejor de la versión de la IA?
Los comentarios explicativos detallados en cada línea del código.
