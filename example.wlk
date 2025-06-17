class Paciente {
    var property edadPaciente
    var property fortalezaMoscular
    var property nivelDeDolor

    const rutinaAsignada= []

    method usarAparato(unAparato){
          unAparato.curarPaciente(self)
    }
    method disminuirDolor(porcentaje){
        nivelDeDolor = nivelDeDolor - (nivelDeDolor*porcentaje)
    }
    method ejercitarFortaleza(porcentaje){
        fortalezaMoscular = fortalezaMoscular + porcentaje
    }
    method rutina(unaRutina){
      rutinaAsignada.addAll(unaRutina)
    }
    method hacerRutina(){
        rutinaAsignada.forEach({a => a.curarPaciente(self)})
    }

}

object clinica{
    const maquinas = []
    method armarRutina(unPaciente,rutinaArmada){
        unPaciente.rutina(rutinaArmada)
    }
    method realizarRutina(unPaciente){
        unPaciente.hacerRutina()
    }
}

class Aparatos{
    method curarPaciente(unPaciente){
        if(self.puedeCurar(unPaciente)){
              self.curar(unPaciente)
        }
    }
    method puedeCurar(unPaciente){
        return self.requisitoEspecial(unPaciente)
    }
    method requisitoEspecial(unPaciente)
    method curar(unPaciente)
}
class Magneto inherits Aparatos{

    override method curar(unPaciente){
        unPaciente.disminuirDolor(0.1)
    }
    override method requisitoEspecial(unPaciente){return true}

}

class Bicicleta inherits Aparatos{
  override method curar(unPaciente){
      unPaciente.disminuirDolor(4)
      unPaciente.ejercitarFortaleza(3) 
  }
  override method requisitoEspecial(unPaciente){
      return unPaciente.edadPaciente() > 8
  }

}
class Minitramp inherits Aparatos{
    override method curar(unPaciente){
        unPaciente.ejercitarFortaleza(unPaciente.edadPaciente() * 0.1)
    }
    override method requisitoEspecial(unPaciente){
        return unPaciente.nivelDeDolor() < 20
    }
}
