import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/list_provider.dart';

class second extends StatefulWidget {
  
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  
 
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder:(context , providervalue , child)=> Scaffold(
       
        appBar: AppBar(
          title:const Text("Learning Provider"),
          centerTitle: true,
        ),
        body: Container(
          padding:const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            Text(
              providervalue.list.last.toString(),
              style:const TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: providervalue.list.length,
                  itemBuilder: (context, index) {
                    return Text(
                      providervalue.list[index].toString(),
                      style:const TextStyle(fontSize: 20),
                    );
                  }),
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              providervalue.add();
            });
          },
          child:const Icon(Icons.add),
        ),
      ),
    );
  }
}