import vendedores.*

class Cliente {
	
	var property tipoCliente
	
	method puedeSerAtendido(vendedor) {
		
		return tipoCliente.puedeAtenderlo(vendedor)
	}
	
}

	
object inseguro {
	
	
	method puedeAtenderlo(vendedor) {
		
		return vendedor.esVersatil() and vendedor.esFirme()
		
	}
}

object detallista {
	
	method puedeAtenderlo(vendedor) {
		
		return vendedor.cantidadCertificacionConProductos().size() >= 3
	}
}

object humanista {
	
	method puedeAtenderlo(vendedor) {
		
		return vendedor.esPersonaFisica()
		
	}
	
	
}	

	

