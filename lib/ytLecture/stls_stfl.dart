//TODO :/Stateless Widget
//A StatelessWidget is immutable,//No changing
// meaning its properties (also called parameters) cannot be changed once it's created.
//TODO:/Stateful Widget
/*
A StatefulWidget is mutable,//can change0 1 0  1 2 3 2
 meaning it can change its properties during runtime.
It's used for parts of the user interface that can change dynamically,
 such as user interactions or data fetching.
 */

//What is Stateless and Stateful widget
import 'package:flutter/material.dart';

class MyStateless extends StatefulWidget {
  const MyStateless({super.key});

  @override
  State<MyStateless> createState() => _MyStatelessState();
}

class _MyStatelessState extends State<MyStateless> {
  @override
  void initState() {
    //call
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    //dispose
    // TODO: implement dispose
    super.dispose();
  }

  int count = 0;
  void increment() {
    setState(() {
      //for widget rebuilding
      count++;
    });
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyStateless"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count.toString(),
              style: const TextStyle(fontSize: 19),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(onPressed: increment, child: const Text("Increment"))
          ],
        ),
      ),
    );
  }
}
