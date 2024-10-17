class CuentaAhorro {
  String codigo;
  String identificacionCliente;
  String nombreCliente;
  String correoElectronico;
  DateTime fechaCreacion;
  double saldo;

  CuentaAhorro(
    this.codigo,
    this.identificacionCliente,
    this.nombreCliente,
    this.correoElectronico,
    this.fechaCreacion,
    this.saldo,
  );

  void consignar(double monto) {
    saldo += monto;
    print("Consignación exitosa. Nuevo saldo: \$${saldo.toStringAsFixed(2)}");
  }

  void retirar(double monto) {
    if (monto <= saldo) {
      saldo -= monto;
      print("Retiro exitoso. Nuevo saldo: \$${saldo.toStringAsFixed(2)}");
    } else {
      print("Fondos insuficientes.");
    }
  }

  void mostrarInformacion() {
    print("Código: $codigo");
    print("Identificación: $identificacionCliente");
    print("Nombre: $nombreCliente");
    print("Correo: $correoElectronico");
    print("Fecha de creación: $fechaCreacion");
    print("Saldo: \$${saldo.toStringAsFixed(2)}");
    print("--------------------------------");
  }
}
