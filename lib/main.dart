import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/list_provider.dart';

import 'package:provider_test/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NumbersListProvider())
      ],
      child:const  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:  MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder:(context , numberProviderModel , child) =>Scaffold(
        appBar: AppBar(
          title:const Text("Learning Provider"),
          centerTitle: true,
        ),
        body: Container(
          padding:const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            Text(
              numberProviderModel.list.last.toString(),
              style:const TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount:  numberProviderModel.list.length,
                  itemBuilder: (context, index) {
                    return Text(
                       numberProviderModel.list[index].toString(),
                      style:const TextStyle(fontSize: 20),
                    );
                  }),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const second()));
              },
              child: const Text('Second'),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            numberProviderModel.add();
          },
          child: const Icon(Icons.add),
        ),
      )
    );
  }
}
