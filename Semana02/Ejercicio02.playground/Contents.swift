import Foundation

// 1. Lectura de datos
print("Ingrese Nombre del Producto:")
let producto = readLine() ?? ""

print("Ingrese Precio Unitario:")
let precioUnitario = Double(readLine() ?? "0") ?? 0.0

print("Ingrese Cantidad:")
let cantidad = Int(readLine() ?? "0") ?? 0

print("Elige el Plan de Pago (6, 12, 24):")
let meses = Int(readLine() ?? "0") ?? 6

// 2. Determinación del porcentaje de interés
var porcentajeInteres: Double = 0.0

switch meses {
case 6:
    porcentajeInteres = 0.20
case 12:
    porcentajeInteres = 0.40
case 24:
    porcentajeInteres = 0.60
default:
    print("Plan no válido, se aplicará 6 meses por defecto.")
    porcentajeInteres = 0.20
}

// 3. Cálculos
let montoCompra = precioUnitario * Double(cantidad)
let interes = montoCompra * porcentajeInteres
let montoFinanciado = montoCompra + interes
let cuotaMensual = montoFinanciado / Double(meses)

// 4. Salida de resumen
print("\n--- PLAN DE PAGO ---")
print("PRODUCTO: \(producto)")
print("MONTO COMPRA: \(montoCompra)")
print("INTERES: \(interes)")
print("MONTO FINAN.: \(montoFinanciado)")
print("CUOTA M.: \(cuotaMensual)")

// 5. Generación de la tabla
print("\nMes \t Monto Inicial \t Cuota Mensual \t Resta x Pago")
var saldoActual = montoFinanciado

for mes in 1...meses {
    let restaXPago = saldoActual - cuotaMensual
    print("\(mes) \t \(String(format: "%.2f", saldoActual)) \t\t \(String(format: "%.2f", cuotaMensual)) \t\t \(String(format: "%.2f", restaXPago))")
    saldoActual = restaXPago
}
