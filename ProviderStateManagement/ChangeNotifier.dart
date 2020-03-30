import 'package:flutter/cupertino.dart';
import 'package:purewaterapp/Product.dart';

class ItemCounter extends ChangeNotifier{

  int _itemcount=1;
  int get itemcount=>_itemcount;

  set itemcount(int val){
    _itemcount=val;
    notifyListeners();
  }

  increment(){
    itemcount=_itemcount+1;
  }
  decrement(){
    itemcount=_itemcount-1;
    if(_itemcount<0)itemcount=0;
  }

}
