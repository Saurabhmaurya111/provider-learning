// import 'dart:js_interop';

import 'package:flutter/material.dart';

class NumbersListProvider extends ChangeNotifier{
   List<int> list = [1, 2, 3];

   void add(){
    list.add(list.last +1);

    notifyListeners();
   }
}