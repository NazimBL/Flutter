import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purewaterapp/Product.dart';
import 'package:purewaterapp/product_scroll.dart';
import 'main_screen.dart';
import 'oder_card.dart';

class OrderCartScroll extends StatelessWidget{

  List<Product> _selectedProducts=List<Product>();
  OrderCartScroll(this._selectedProducts);

  int listLength=MainScreenState.orderCount;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      // Give the Animated list the global key
      key: _listKey,
      scrollDirection: Axis.vertical,
      initialItemCount: listLength,
      shrinkWrap: true,
      itemBuilder: (context, index, animation) {

        return _buildItem(animation,index);
      },
      );
  }

  Widget _buildItem(Animation animation,int indexClicked) {
    if (_selectedProducts[indexClicked] != null) {
      return SizeTransition(
        sizeFactor: animation,
        child: GestureDetector(
          onTap: () {},
          child: OrderCard(
           indexClicked,_selectedProducts[indexClicked]),
        ),
      );
    }else print("product is null");
  }
  void _removeSingleItem(int removeIndex) {

    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return _buildItem(animation,removeIndex);
    };
    _listKey.currentState.removeItem(removeIndex, builder);
    _selectedProducts.removeAt(removeIndex);
  }
}
