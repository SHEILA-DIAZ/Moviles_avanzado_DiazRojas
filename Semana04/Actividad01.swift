// ===== ACTIVIDAD PROPUESTA 01 =====
// Institución Tecsup - Descuento de Cursos Libres
// Estudiante: Sheila Diaz Rojas

struct Curso {
    let nombre: String
    let precioUnitario: Double
    let cantidad: Int
    
    var subtotal: Double {
        return precioUnitario * Double(cantidad)
    }
}

class Estudiante {
    let nombre: String
    let dni: String
    let esAlumnoTecsup: Bool
    var cursos: [Curso] = []
    
    init(nombre: String, dni: String, esAlumnoTecsup: Bool) {
        self.nombre = nombre
        self.dni = dni
        self.esAlumnoTecsup = esAlumnoTecsup
    }
    
    func agregarCurso(_ curso: Curso) {
        cursos.append(curso)
    }
    
    func generarFactura() {
        print("🎓 FACTURA DE CURSOS")
        print("Estudiante: \(nombre)")
        print("DNI: \(dni)")
        print("Alumno de Tecsup: \(esAlumnoTecsup ? "Sí ✅" : "No ❌")")
        print("-----------------------------------")
        
        var subtotalGeneral: Double = 0.0
        var totalCursosComprados: Int = 0
        
        for curso in cursos {
            let costoCurso = curso.subtotal
            subtotalGeneral += costoCurso
            totalCursosComprados += curso.cantidad
            print("\(curso.nombre) x\(curso.cantidad) - S/ \(costoCurso)")
        }
        
        let igv = subtotalGeneral * 0.18
        let totalConIGV = subtotalGeneral + igv
        
        print("-----------------------------------")
        print("Subtotal: S/ \(subtotalGeneral)")
        print("IGV (18%): S/ \(igv)")
        print("Total con IGV: S/ \(totalConIGV)")
        
        var descuentoCantidad: Double = 0.0
        var descuentoTecsup: Double = 0.0
        
        if totalCursosComprados >= 3 {
            descuentoCantidad = totalConIGV * 0.10
            print("Descuento 10% por cantidad: -S/ \(descuentoCantidad) ✅")
            
            if esAlumnoTecsup {
                descuentoTecsup = 400.0
                print("Descuento especial Tecsup: -S/ \(descuentoTecsup) ✅")
            }
        }
        
        let totalFinal = totalConIGV - descuentoCantidad - descuentoTecsup
        print("-----------------------------------")
        print("💰 TOTAL FINAL A PAGAR: S/ \(totalFinal)")
    }
}

// --- Prueba ---
let estudiante = Estudiante(nombre: "Juan León", dni: "78965412", esAlumnoTecsup: true)
estudiante.agregarCurso(Curso(nombre: "Swift Avanzado", precioUnitario: 450.0, cantidad: 1))
estudiante.agregarCurso(Curso(nombre: "IA con Python", precioUnitario: 650.0, cantidad: 2))
estudiante.agregarCurso(Curso(nombre: "Diseño UX/UI", precioUnitario: 500.0, cantidad: 1))

estudiante.generarFactura()
