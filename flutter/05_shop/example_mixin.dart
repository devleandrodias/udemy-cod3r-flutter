class Carro {
  int _valocidade = 0;

  int acelerar() {
    _valocidade += 5;
    return _valocidade;
  }

  int frear() {
    _valocidade -= 5;
    return _valocidade;
  }
}

mixin Esportivo {
  // ignore: unused_field
  bool _turboLigado = false;

  ligarTurbo() {
    _turboLigado = true;
  }

  desligarTurbo() {
    _turboLigado = false;
  }
}

mixin Luxo {
  // ignore: unused_field
  bool _arCondicionadoLigado = false;

  ligarTurbo() {
    _arCondicionadoLigado = true;
  }

  desligarTurbo() {
    _arCondicionadoLigado = false;
  }
}

/// mixin é um ctrl C + ctrl V automatizado, e metodos de mixin pertencem a class
/// que os implementa, e pode implementar mais de um mixin (mistura)

class Ferrari extends Carro with Esportivo, Luxo {
  @override
  int acelerar() {
    if (_turboLigado) {
      super.acelerar();
    }

    return super.acelerar();
  }
}

class Gol extends Carro {}

void main() {
  Carro c1 = new Carro();

  c1.acelerar();
  c1.acelerar();
  c1.acelerar();
  c1.frear();

  Carro f1 = new Ferrari();

  f1.acelerar();

  return print(c1._valocidade);
}
