
import 'dart:io';
import 'banco.dart';

void main() {
  Banco banco = Banco();
  while (true) {
    print("\nMENÚ BANCO ADSO 2874057");
    print("1. Crear Cuenta");
    print("2. Consignar Cuenta");
    print("3. Retirar Cuenta");
    print("4. Consultar Cuenta Por Código");
    print("5. Listar Cuentas");
    print("6. Salir");
    print("Ingrese Opción (1-6):");

    int opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        banco.crearCuenta();
        break;
      case 2:
        print("Ingrese el código de la cuenta:");
        String codigo = stdin.readLineSync()!;
        print("Ingrese el monto a consignar:");
        double monto = double.parse(stdin.readLineSync()!);
        banco.consignarCuenta(codigo, monto);
        break;
      case 3:
        print("Ingrese el código de la cuenta:");
        String codigo = stdin.readLineSync()!;
        print("Ingrese el monto a retirar:");
        double monto = double.parse(stdin.readLineSync()!);
        banco.retirarCuenta(codigo, monto);
        break;
      case 4:
        print("Ingrese el código de la cuenta:");
        String codigo = stdin.readLineSync()!;
        banco.consultarCuenta(codigo);
        break;
      case 5:
        banco.listarCuentas();
        break;
      case 6:
        print("Saliendo del sistema...");
        return;
      default:
        print("Opción no válida. Intente de nuevo.");
    }
  }
}
