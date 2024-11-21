// 1758512


// PRIMERA PARTE 

class Persona {
    var plata
    var property formasDePago
    var trabajo
    var pagoPreferido

    method modificarPlata(monto){
        plata += monto
    }

    method plata() = plata
    
    method pagoPreferido() = pagoPreferido
    
    method puedocomprarAlgo(objeto) =
        pagoPreferido.verificarSialcanza(objeto,self)
    method realizarCompra(objeto){
        if(self.puedocomprarAlgo(objeto))
                pagoPreferido.realizarCompra(objeto)

    }
    //compradores compulsivos

    method compraralgo(objeto){
        if(not self.puedocomprarAlgo(objeto)){
 
            formasDePago.forEach({pago => pago.verificarSialcanza(objeto, self)})
        }
    }

    method cambioDepagoPreferido(nuevoPagoPreferido){
        pagoPreferido = nuevoPagoPreferido
    }

    method sueldo(dineroAdepositar){
        formasDePago.filter({pago => pago == credito}).forEach({pago1 =>pago1.sumardinero(dineroAdepositar)})
    }
}

class FormadePago {


    method verificarSialcanza(objeto,persona)

    method realizarCompra(objeto,persona){
        if (self.verificarSialcanza(objeto,persona))
            persona.pagoPreferido().descontarDinero(self.precioObjeto(objeto),persona)
            objeto.Acomprar(persona)
    }

    method precioObjeto(objeto) = objeto.monto()

    method verificarMonto(objeto,monto) = monto >= self.precioObjeto(objeto)

    method descontarDinero(monto,persona){}

    method sumardinero(dinero)
}
class Debito inherits FormadePago{
    var dinero

    override method verificarSialcanza(objeto,persona) = self.verificarMonto(objeto, dinero)
    
    override method descontarDinero(monto,persona) {
        dinero-=monto
    } 

    override method sumardinero(nuevodinero){
        dinero += nuevodinero
    }
}

class Efectivo inherits FormadePago{

    override method verificarSialcanza(objeto,persona) = self.verificarMonto(objeto, persona.plata())

    override method descontarDinero(monto,persona) {
        persona.modificarPlata(-monto)
    }

    
}

class Credito inherits FormadePago{
    const limiteDeDinero
    const cantCuotasMax
    var interes
    var fecha = new Date()

    override method verificarSialcanza(objeto,persona) = self.verificarMonto(objeto, limiteDeDinero)

    override method realizarCompra(objeto,persona){
        if(self.verificarSialcanza(objeto, persona))
            self.cuotas(persona,objeto.monto())
            persona.pagoPreferido().descontarDinero(objeto.monto(), persona)

    }  
    method cuotas(persona,monto){
        fecha.plusMonths(fecha.month())
        persona.sueldo(-(monto/cantCuotasMax + interes))  
    }
    method cobrarSiguienteMes() {
      
    }
    

}

class Objeto{
    var monto

    method monto() = monto

    method Acomprar(persona) {
        persona.realizarCompra(monto, persona)
        monto = 0
    }

}

const celular = new Objeto(monto = 16000)
const auto = new Objeto(monto = 70000)

class Trabajo {
    var dineroAdepositar
    var fecha = new Date()

    method dineroAdepositar() = dineroAdepositar

    method sueldo(persona){
        if (fecha == fecha.plusMonths(fecha.month()))
            persona.sueldo(dineroAdepositar)
            fecha = new Date()
    }

  
}
