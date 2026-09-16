// ===== CASO 1.5: HERENCIA Y POLIMORFISMO — LA CADENA DE SUCURSALES =====
// Docente: Juan León
// Estudiante: Sheila Diaz Rojas

enum CategoriaElectro {
    case lineaBlanca, tecnologia, pequenos
}

struct Electrodomestico {
    let nombre: String
    let marca: String
    let precioLista: Double
    let categoria: CategoriaElectro
}

class Sucursal {
    let nombre: String
    let ciudad: String
    
    init(nombre: String, ciudad: String) {
        self.nombre = nombre
        self.ciudad = ciudad
    }
    
    func descuento() -> Double {
        return 0.05
    }
    
    func costoEnvio(monto: Double) -> Double {
        return 30.0
    }
    
    // REGLA 2: este metodo NO se sobreescribe en las subclases
    func cotizar(item: Electrodomestico) {
        let precioConDescuento = item.precioLista * (1 - descuento())
        let envio = costoEnvio(monto: precioConDescuento)
        let total = precioConDescuento + envio
        print("\(nombre): \(item.nombre) -> S/ \(precioConDescuento) + envio S/ \(envio) = S/ \(total)")
    }
}

// --- TODO 14: SucursalLima ---
class SucursalLima: Sucursal {
    override func descuento() -> Double {
        return 0.10
    }
    
    override func costoEnvio(monto: Double) -> Double {
        if monto >= 1500.0 {
            return 0.0
        } else {
            return 30.0
        }
    }
}

// --- TODO 15: SucursalProvincia ---
class SucursalProvincia: Sucursal {
    // Hereda descuento() de la base (5%)
    
    override func costoEnvio(monto: Double) -> Double {
        let envioCalculado = monto * 0.08
        if envioCalculado < 50.0 {
            return 50.0
        } else {
            return envioCalculado
        }
    }
}

// --- TODO 16: SucursalOutlet ---
class SucursalOutlet: Sucursal {
    override func descuento() -> Double {
        return 0.25
    }
    
    override func costoEnvio(monto: Double) -> Double {
        return 0.0 // solo recojo en tienda
    }
}

// --- TODO 17: El recorrido polimorfico (REGLA 4) ---
let refrigeradora = Electrodomestico(nombre: "Refrigeradora", marca: "Frost", precioLista: 2000.0, categoria: .lineaBlanca)
let licuadora = Electrodomestico(nombre: "Licuadora", marca: "Mix", precioLista: 250.0, categoria: .pequenos)

let sucursales: [Sucursal] = [
    SucursalLima(nombre: "Lima Centro", ciudad: "Lima"),
    SucursalProvincia(nombre: "Provincia Cusco", ciudad: "Cusco"),
    SucursalOutlet(nombre: "Outlet Ate", ciudad: "Lima")
]

print("===== Refrigeradora (S/ 2000.0) =====")
for sucursal in sucursales {
    sucursal.cotizar(item: refrigeradora)
}

print("===== Licuadora (S/ 250.0) =====")
for sucursal in sucursales {
    sucursal.cotizar(item: licuadora)
}

// --- TODO 18: La prueba del polimorfismo (REGLA 6) ---
class SucursalOnline: Sucursal {
    override func costoEnvio(monto: Double) -> Double {
        return 15.0
    }
}

// Respuesta Rule 6:
// ¿Cuántas líneas nuevas se necesitaron para agregar SucursalOnline e integrarla?
// Se necesitaron 5 líneas (4 líneas de la clase SucursalOnline + 1 línea para agregarla al array de sucursales).

// ===== FIX: Corrección de los 2 errores =====

// FIX 7: Falta la palabra clave 'override'. Swift la exige para asegurar que el desarrollador está conscientemente redefiniendo un método de la clase padre y evitar sobreescrituras accidentalmente.
class SucursalMall: Sucursal {
    override func descuento() -> Double {
        return 0.12
    }
}

// FIX 8: Falta la llamada 'super.init(nombre: nombre, ciudad: ciudad)'. Swift exige inicializar todas las propiedades propias primero y luego llamar al inicializador de la superclase para garantizar que la jerarquía quede correctamente construida.
class SucursalExpress: Sucursal {
    let radioKm: Int
    
    init(nombre: String, ciudad: String, radioKm: Int) {
        self.radioKm = radioKm
        super.init(nombre: nombre, ciudad: ciudad)
    }
}

// ===== PREDICT =====
let misteriosa: Sucursal = SucursalLima(nombre: "Lima Centro", ciudad: "Lima")
print(misteriosa.descuento()) 
// PREDICT 6: Imprime 0.1 (o 10%). 
// Justificación: Aunque la variable sea declarada de tipo 'Sucursal', la instancia real en memoria es de tipo 'SucursalLima'. En Swift el despacho de métodos es dinámico, por lo que se ejecuta la versión sobreescrita de la subclase.

let monto = 2000.0 * (1 - misteriosa.descuento())
print(misteriosa.costoEnvio(monto: monto))
// PREDICT 7: Imprime 0.0.
// Justificación: El monto resulta 2000 * (1 - 0.1) = 1800.0. Como 1800.0 >= 1500.0, la regla de costoEnvio en SucursalLima retorna 0.0.
