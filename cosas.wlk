
object knightRider {
    method peso() = 0
    method nivelDePeligrosidad() = 10
    method consecuenciaDeLaCarga() {}
}

object bumblebee {
    var formaActual = auto

    method peso() = 800
    method cambiarForma(nuevaForma) { formaActual = nuevaForma }
    method nivelDePeligrosidad() = formaActual.nivel()
    method bultos() = 2
    method consecuenciaDeLaCarga() {
        formaActual = robot
    }

}

object auto {
    method nivel() = 15
}
object robot {
    method nivel() = 30
}

object paqueteDeLadrillos {
    var cantidad = 10
    
    method peso() = 2 * cantidad
    method nivelDePeligrosidad() = 2
    method cambiarCantidad(unaCantidad) {
        cantidad = unaCantidad
    }
    method bultos() {
        if (cantidad <= 100) {
            return 1
        } else if (cantidad.between(101, 300)) {
            return 2
        } else {return 3}
    }
    method consecuenciaDeLaCarga() { cantidad += 12}
}

object arena {
    var property peso = 10

    method nivelDePeligrosidad() = 1
    method bultos() = 1
    method consecuenciaDeLaCarga() { peso = (peso-10).max(0)}
}

object bateria {
    var estaConMisiles = false

    method peso() = if (estaConMisiles) 300 else 200
    method bultos() = if (estaConMisiles) 2 else 1
    method nivelDePeligrosidad() = if (estaConMisiles) 100 else 0
    method cargarYDescargarMisiles() { estaConMisiles = !estaConMisiles }
    method consecuenciaDeLaCarga() {estaConMisiles = true}
}

object contenedor {
    var cosasDentro = []

    method peso() = 100 + self.pesoCosasDentro()
    method bultos() = 1 + self.bultoCosasDentro()
    method bultoCosasDentro() = cosasDentro.sum({c => c.bultos()})
    method pesoCosasDentro() = cosasDentro.sum({c => c.peso()})
    method nivelDePeligrosidad() = 
        if (!cosasDentro.isEmpty())
        self.cosasDentroMasPeligrosa().nivelDePeligrosidad()
    method cosasDentroMasPeligrosa() = cosasDentro.max({c => c.nivelDePeligrosidad()})
    method meterElementos(unLista) {
        cosasDentro.addAll(unaLista)
    }
    method consecuenciaDeLaCarga() {
        cosasDentro.forEach({c => c.consecuenciaDeLaCarga()})
    }
}

object residuos {
    var property peso = 10
    method nivelDePeligrosidad() = 200
    method bultos() = 1
    method consecuenciaDeLaCarga() {peso += 15}
}

object embalaje {
    var cosaQueEnvuelve = residuos
    method peso() = cosaQueEnvuelve.peso()
    method nivelDePeligrosidad() = cosaQueEnvuelve.nivelDePeligrosidad() * 0.5
    method cambiarLoQueEnvuelve(nuevaCosa) { cosasQueEnvuelve = nuevaCosa}
    method consecuenciaDeLaCarga() {}
}