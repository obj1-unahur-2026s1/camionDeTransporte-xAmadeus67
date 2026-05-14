object camion {
    const cosasCargadas = []

    method cargarCosa(unaCosa) {
        cosasCargadas.add(unaCosa)
        cosa.consecuenciaDeLaCarga()
    }
    method descargarCosa(unaCosa) {
        cosasCargadas.remove(unaCosa)
    }
    method cargarCosas(unaLista) {
        unaLista.forEach({c => c.self.cargarCosa(c)})
    }

    method peso() = 1000 + cosasCargadas.sum({c => c.peso() })
    method todosLosPesosSonPares() = cosasCargadas.all({c => c.peso().even() })
    method hayAlgunaCargaQuePesa(unPeso) = cosasCargadas.any({c => c.peso() == unPeso})
    method primeraCargaConNivelDePeligrosidadIgualA(unaPeligrosidad) = cosasCargadas.findOrDefault({c => c.nivelDePeligrosidad() == unaPeligrosidad})
    method cosasQueSuperanNivelDePeligrosidad(unaPeligrosidad) = cosasCargadas.filter({c => c.nivelDePeligrosidad() > unaPeligrosidad})
    method cosasQueSuperanNivelDePeligrosidadDe(unaCosa) = self.cosasQueSuperanNivelDePeligrosidad(unaCosa.nivelDePeligrosidad())
    method estaExcedidoDePeso() = self.peso() > 2500
    method puedeCircularEnRuta(nivelMaximo) = !self.estaExcedidoDePeso() and self.cosasQueSuperanNivelDePeligrosidad(nivelMaximo).isEmpty()
    method algunaCargaPesaEntre(min, max) = cosasCargadas.any({c => c.peso().between(min, max)})
    method cantidadTotalDeBultos() = cosasCargadas.sum(c => c.bultos())




}