import 'package:flutter/material.dart';

class AppBarScaffold extends StatefulWidget {
  const AppBarScaffold({super.key});

  @override
  State<AppBarScaffold> createState() => _AppBarScaffoldState();
}

class _AppBarScaffoldState extends State<AppBarScaffold> {
  @override
  Widget build(BuildContext context) {
    /*
    In Flutter, a scaffold is a basic structure of an app's visual interface,
     and an app bar is a specific widget that
     typically provides a title, leading and trailing icons, and may include additional functionality.
     */
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Text(
              "This is bottom",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
            )),
        elevation: 9,
        actions: [Icon(Icons.ac_unit), Icon(Icons.alarm)],
        leading: Icon(
          Icons.arrow_back_outlined,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text(
          "App bar",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Center(
          child: Text(
        "Hello this is body",
        style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
      )),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          print("Tapped");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
