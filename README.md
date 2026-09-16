# Semana 02 - Simulador de Plan de Pagos en Swift

Este proyecto contiene un programa desarrollado en **Swift** ejecutusable desde la consola/terminal, diseñado para simular el financiamiento de compras de productos con cálculo de intereses y generación de cronograma de pagos.

---

## 🛠️ Funcionalidades Principales

* **Entrada interactiva de datos:** Solicita al usuario el nombre del producto, el precio unitario, la cantidad de unidades y el plazo de financiamiento deseado.
* **Manejo seguro de valores nulos (Optionals):** Utiliza el operador *nil-coalescing* (`??`) para evitar errores si el usuario ingresa datos vacíos o no válidos.
* **Cálculo dinámico de intereses:** Aplica automáticamente la tasa de interés correspondiente al plan de pago elegido mediante una estructura `switch`:
  * **6 meses:** 20% de interés ($0.20$)
  * **12 meses:** 40% de interés ($0.40$)
  * **24 meses:** 60% de interés ($0.60$)
  * **Plan por defecto:** Asigna 20% si se ingresa una opción no válida.
* **Cálculos financieros automáticos:**
  * Monto total de la compra (base).
  * Monto total del interés generado.
  * Monto total financiado (deuda final).
  * Cuota fija mensual a pagar.
* **Generación de Tabla de Amortización:** Imprime un cronograma detallado mes a mes que muestra:
  * Número de cuota/mes.
  * Monto inicial del mes.
  * Cuota mensual fija.
  * Saldo restante tras el pago.
* **Formato de salida:** Formatea las cifras numéricas a 2 decimales (`%.2f`) para representar correctamente los montos monetarios.

---

## 💻 Pasos para ejecutar en la Terminal

1. **Clonar el repositorio:**
   ```bash
   git clone [https://github.com/SHEILA-DIAZ/Moviles_avanzado_DiazRojas.git](https://github.com/SHEILA-DIAZ/Moviles_avanzado_DiazRojas.git)
   cd Moviles_avanzado_DiazRojas/Semana02
