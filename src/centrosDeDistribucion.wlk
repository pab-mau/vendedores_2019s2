class CentroDeDistribucion {
	
	var property ciudadEstablecida
	var property vendedores = []
	
	
	
	
	method agregarVendedor(vendedor) {
		
		if(vendedores.contains(vendedor)) { self.error("ya esta registrado")}
		
		else { vendedores.add(vendedor)}
		
	}
	
	method vendedorEstrella() {
		
		return vendedores.max({v=>v.puntajeDeLasCertificaciones()})
	}
	
	method puedeCubrir(ciudad) {
		
		return vendedores.any({v=>v.puedeTrabajar(ciudad)})
		
	}
	
	
	
	method vendedoresGenericos () {
		
		return vendedores.filter({v=>v.tieneCertificacionesSinProductos()})
	}
	
	method esRobusto() {
		
		return vendedores.count({v=>v.esFirme()}) >= 3
	}
    
    method repartir(certificacion) {
    	
    	vendedores.forEach({v=>v.agregar(certificacion)})
    	
    }
    
   

}
