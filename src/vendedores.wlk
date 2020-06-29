import centrosDeDistribucion.*

class Vendedores {
	
	var property certificaciones = []
	
	method puedeTrabajar(ciudad) 
	
	method tieneCertificacionesConProductos() { 
		
		return certificaciones.filter({c=>c.tieneProductos()}).size() > 0
	}
	
	method cantidadCertificacionConProductos() {
		
		return certificaciones.filter({c=>c.tieneProductos()})
	}
	
	method tieneCertificacionesSinProductos() {
		
		return certificaciones.filter({c=>c.tieneProductos().negate()}).size() > 0
		
	}
	
	method condicionParaSerVersatil() {
		
		return self.tieneCertificacionesConProductos() and
		       self.tieneCertificacionesSinProductos()
	}
	
	
	method esVersatil() {
		
		return self.certificaciones().size() >=3  and self.condicionParaSerVersatil()
	}	
	
	method puntajeDeLasCertificaciones() {
		
		return certificaciones.sum({c=>c.cantidadPuntos()})
	}
	
	method esFirme() {
		
		return self.puntajeDeLasCertificaciones() >= 30
		
		
	}
	
	method esInfluyente() { return false}
	
	method agregar(certificacion) {
		
		self.certificaciones().add(certificacion)
		
	}
	
	
	
	method tieneAfinidad(centro) { 
		
		return self.puedeTrabajar(centro.ciudadEstablecida()) 
		
	}
	
	
	method esCandidato(centro) {
		
		return self.esVersatil() and self.tieneAfinidad(centro)
	}
	
	method esPersonaFisica() { return true }
	
}


class Fijo inherits Vendedores {
	
	var property ciudadAlojamiento
	
	override method puedeTrabajar(ciudad) {
		
		return ciudadAlojamiento == ciudad 
		
	}
	
}

class Viajante inherits Vendedores {
	
	var property provinciasHabilitadas = []
	
	override method puedeTrabajar(ciudad) {
		
		return provinciasHabilitadas.contains(ciudad.provincia())
	}
	
	method totalHabitantesProvinciasHab() {
		
		return provinciasHabilitadas.sum({p=>p.poblacion()})
	}
	
	override method esInfluyente() {
		
		return self.totalHabitantesProvinciasHab() >= 10000000
	}
	
	
	
}


class ComerciosCorresponsales inherits Vendedores {
	
	var property ciudadesConSucursales = []
	
	override method puedeTrabajar(ciudad) {
		
		return ciudadesConSucursales.contains(ciudad)
		
	}
	
	method ciudadesNecesarias() {
		
		return ciudadesConSucursales.size() >= 5
	}
	
	method cantidadProv() {
		
		return ciudadesConSucursales.map({c=>c.provincia()}).asSet()
	}
	
	method provNecesarias () {
		
		return self.cantidadProv().size() >= 3
	}
	
    override method esInfluyente () {
    	
    	return self.ciudadesNecesarias() or self.provNecesarias()
    	
    }
    
   
    method lePudeCubrirCiudad(centro) {
    	
    	return ciudadesConSucursales.filter({c=>not centro.puedeCubrir(c)}).size() > 0
    }	
    
    override method tieneAfinidad(centro) {
    	
    	return super(centro) and 
    	       
    	       self.lePudeCubrirCiudad(centro) 
    }
    
    
    override method esPersonaFisica() { return false}
} 










class Ciudad {
	
	
	var property provincia
  
	
}

class Provincia {
	
	var property poblacion
	
}

class Certificacion {
	
	var property tieneProductos
	var property cantidadPuntos
}

