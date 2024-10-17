import 'dart:io';

import 'cuenta_ahorro.dart';

class Banco {
  List<CuentaAhorro> cuentas = [];
  int contadorCodigo = 1;

  void crearCuenta() {
    print("Ingrese la identificación del cliente:");
    String identificacion = stdin.readLineSync()!;
    print("Ingrese el nombre completo del cliente:");
    String nombre = stdin.readLineSync()!;
    print("Ingrese el correo electrónico del cliente:");
    String correo = stdin.readLineSync()!;
    DateTime fechaCreacion = DateTime.now();
    String codigo = "${fechaCreacion.year}-${contadorCodigo++}";

    cuentas.add(CuentaAhorro(
        codigo, identificacion, nombre, correo, fechaCreacion, 0.0));
    print("Cuenta creada exitosamente con el código: $codigo");
  }

  void consignarCuenta(String codigo, double monto) {
    CuentaAhorro? cuenta = buscarCuentaPorCodigo(codigo);
    if (cuenta != null) {
      cuenta.consignar(monto);
    } else {
      print("Cuenta no encontrada.");
    }
  }

  void retirarCuenta(String codigo, double monto) {
    CuentaAhorro? cuenta = buscarCuentaPorCodigo(codigo);
    if (cuenta != null) {
      cuenta.retirar(monto);
    } else {
      print("Cuenta no encontrada.");
    }
  }

  void consultarCuenta(String codigo) {
    CuentaAhorro? cuenta = buscarCuentaPorCodigo(codigo);
    if (cuenta != null) {
      cuenta.mostrarInformacion();
    } else {
      print("Cuenta no encontrada.");
    }
  }

  void listarCuentas() {
    if (cuentas.isNotEmpty) {
      print("Listado de cuentas:");
      cuentas.forEach((cuenta) => cuenta.mostrarInformacion());
    } else {
      print("No hay cuentas registradas.");
    }
  }

  CuentaAhorro? buscarCuentaPorCodigo(String codigo) {
    return cuentas.isNotEmpty
        ? cuentas.firstWhere((cuenta) => cuenta.codigo == codigo,
            orElse: () => CuentaAhorro('', '', '', '', DateTime.now(), 0.0))
        : null;
  }
}
