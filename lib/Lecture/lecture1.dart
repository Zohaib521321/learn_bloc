import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EquitablePackage extends StatefulWidget {
  const EquitablePackage({super.key});

  @override
  State<EquitablePackage> createState() => _EquitablePackageState();
}

class _EquitablePackageState extends State<EquitablePackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Equitable Package"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Person person1 = Person(name: "Zohaib", age: 19);
                Person person2 = Person(name: "Zohaib", age: 19);

                print(person1 == person2);
                print("Hash Codes");
                print(person1.hashCode);
                print(person2.hashCode);
              },
              child: Text("Equitable"))
        ],
      ),
    );
  }
}

class Person extends Equatable {
  final String name;
  final int age;
  const Person({required this.name, required this.age});

  @override
  // TODO: implement props
  List<Object?> get props => [name, age];

  // @override
  // bool operator ==(Object other) {
  //   return identical(this, other) ||
  //       other is Person &&
  //           runtimeType == other.runtimeType &&
  //           name == other.name &&
  //           age == other.age;
  // }
  //
  // @override
  // int get hashCode => name.hashCode ^ age.hashCode;
}
