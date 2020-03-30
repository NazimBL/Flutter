import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item_counter.dart';
import 'order_page.dart';

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ItemCounter>.value(
    value: ItemCounter(),
    child:MaterialApp(
        title: 'Pure Water',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: OrderPage(),
        debugShowCheckedModeBanner: false
    ),
    );
  }
}

void main() {
  runApp(MyApp());
}
