import 'package:hive/hive.dart';
import 'package:mycompta/Hive/employee.dart';

class EmployeeAdapter extends TypeAdapter<Employee> {
  @override
  int get typeId => 2;

  @override
  Employee read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Employee(
      empName: fields[0] as String,
      empSalary: fields[1] as String,
      empAge: fields[2] as String,
     
    );
  }

  @override
  void write(BinaryWriter writer, Employee obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.empName)
      ..writeByte(1)
      ..write(obj.empSalary)
      ..writeByte(2)
      ..write(obj.empAge);
      
  }
}
