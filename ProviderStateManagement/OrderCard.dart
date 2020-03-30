import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purewaterapp/Product.dart';
import 'package:purewaterapp/item_counter.dart';
import 'main_screen.dart';

class OrderCard extends StatefulWidget{

  final int _indexClicked;
  Product product;
  OrderCard(this._indexClicked,this.product);

  @override
  OrderCardState createState()=> OrderCardState(_indexClicked,product);
}

class OrderCardState extends State<OrderCard>{

  Product product;
  OrderCardState(this._indexClicked,this.product);


  @override
  Widget build(BuildContext context) {
    final ItemCounter itemCounter=Provider.of<ItemCounter>(context);
    return Card(
      child:Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              width: 45.0,
              height: 75.0,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD3D3D3), width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
           child: Column(
              children: <Widget>[
                InkWell(
                onTap:()=>_incrementNotify(itemCounter),
                child:Icon(Icons.arrow_upward),
                ),
                Text(""+product.productCount.toString(), style: TextStyle(fontSize: 18.0, color: Colors.grey),),
                InkWell(
                  onTap:()=>_decrementNotify(itemCounter),
                  child:Icon(Icons.arrow_downward),
                ),
              ],
            ),
          ),
          SizedBox(width: 20.0,),// SizedBox
          Container(
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(product.pImgPath),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5.0, offset: Offset(0.0, 2.0)),
                ]),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Product: "+product.productName,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold)),
              SizedBox(height: 5.0),
              Text("Price: "+product.price.toString()+" DA",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.orangeAccent)),
              SizedBox(height: 5.0),
              Text("Store",style: TextStyle(fontSize: 11.0,fontWeight: FontWeight.bold,color: Colors.grey)),
            ],
          ),
          Spacer(),
        ],
      ),
    ),
    );
  }

  void _incrementNotify(ItemCounter itemCounter){
   
    itemCounter.itemcount=product.productCount;
    itemCounter.increment();
    product.setCount(itemCounter.itemcount);
  }

  void _decrementNotify(ItemCounter itemCounter){
  
    itemCounter.itemcount=product.productCount;
    itemCounter.decrement();
    product.setCount(itemCounter.itemcount);
  }

}
