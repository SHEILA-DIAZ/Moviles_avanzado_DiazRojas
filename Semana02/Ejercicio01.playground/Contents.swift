import Foundation

let igv = 0.18

func CalcularDescuento(cantidad: Int, subtotal: Double) -> Double {
    if cantidad > 10 {
        return subtotal * 0.15
    } else if cantidad > 5 {
        return subtotal * 0.10
    } else {
        return 0.0
    }
}

// 1. Lectura de datos
print("Ingrese el nombre del producto:")
let producto = readLine() ?? ""

print("Ingrese el precio del producto:")
let precio = Double(readLine() ?? "0") ?? 0.0

print("Ingrese la cantidad del producto:")
let cantidad = Int(readLine() ?? "0") ?? 0

// 2. Cálculos
let subtotal = Double(cantidad) * precio
let descuento = CalcularDescuento(cantidad: cantidad, subtotal: subtotal)

// Hallar el montobase : subtotal - descuento
let montobase = subtotal - descuento

// Hallar el igv : montobase * igv
let montoIgv = montobase * igv

// total : montobase + igv
let total = montobase + montoIgv

// commit:
// mostrar los datos
print("\n--- RESULTADOS DE LA COMPRA ---")
print("Producto: \(producto)")
print("Precio unitario: S/ \(precio)")
print("Cantidad: \(cantidad)")
print("Subtotal inicial: S/ \(subtotal)")
print("Descuento: S/ \(descuento)")
print("Monto Base: S/ \(montobase)")
print("IGV (18%): S/ \(montoIgv)")
print("Total a pagar: S/ \(total)")

