# Prompts utilizados — Laboratorio 04

## Herramienta de IA utilizada
ChatGPT / Claude

## Caso 2B — Biblioteca

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
