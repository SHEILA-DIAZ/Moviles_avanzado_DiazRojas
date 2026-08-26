import Foundation

// 1. Lectura de datos básicos
print("Nombre Producto:")
let producto = readLine() ?? ""

print("Precio Unitario:")
let precioUnitario = Double(readLine() ?? "0") ?? 0.0

print("Cantidad:")
let cantidad = Int(readLine() ?? "0") ?? 0

print("Plan de Pago (6, 12, 24):")
let mesesPlan = Int(readLine() ?? "0") ?? 12

// Validar plan de pago
var porcentajeInteres = 0.0
if mesesPlan == 6 {
    porcentajeInteres = 0.20
} else if mesesPlan == 12 {
    porcentajeInteres = 0.40
} else if mesesPlan == 24 {
    porcentajeInteres = 0.60
} else {
    print("Plan no válido.")
}

// 2. Lectura de pago adelantado
print("¿En qué mes hará un pago Adelantado? (0 = ninguno):")
let mesAdelantado = Int(readLine() ?? "0") ?? 0

print("Monto Adicional a Pagar ese Mes (S/.):")
let montoAdicional = Double(readLine() ?? "0") ?? 0.0

// 3. Cálculos iniciales
let montoCompra = precioUnitario * Double(cantidad)
let interes = montoCompra * porcentajeInteres
let montoFinanciado = montoCompra + interes
let cuotaMensual = montoFinanciado / Double(mesesPlan)

print("\n===== PLAN DE PAGO =====")
print("Mes \t Fecha \t\t Monto Inicial \t Pago \t\t Resta por Pagar")

var saldo = montoFinanciado
var calendario = Calendar.current
var fechaActual = Date()
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd/MM/yyyy"

var mesesEfectivamentePagados = 0

// 4. Bucle para la tabla de pagos
for mes in 1...mesesPlan {
    if saldo <= 0 { break }
    
    mesesEfectivamentePagados += 1
    let fechaTexto = dateFormatter.string(from: fechaActual)
    
    // Determinar si hay pago adicional este mes (validando que mesAdelantado sea > 0)
    var pagoDelMes = cuotaMensual
    if mes == mesAdelantado && mesAdelantado > 0 {
        pagoDelMes += montoAdicional
    }
    
    // Si el pago supera el saldo pendiente, solo se paga lo que resta
    if pagoDelMes > saldo {
        pagoDelMes = saldo
    }
    
    let restaPorPagar = saldo - pagoDelMes
    
    print("\(mes) \t \(fechaTexto) \t \(String(format: "%.2f", saldo)) \t \(String(format: "%.2f", pagoDelMes)) \t \(String(format: "%.2f", restaPorPagar))")
    
    saldo = restaPorPagar
    
    // Avanzar 1 mes para el siguiente pago
    fechaActual = calendario.date(byAdding: .month, value: 1, to: fechaActual) ?? fechaActual
}

// Corrección de sintaxis en el print final
print("\nMeses Pagados \(mesesEfectivamentePagados) De \(mesesPlan)")
