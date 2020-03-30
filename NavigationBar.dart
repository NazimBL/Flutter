import 'package:flutter/material.dart';
import 'package:purewaterapp/order_page.dart';
import 'package:purewaterapp/profile_page.dart';
import 'Product.dart';
import 'home_page.dart';


class MainScreen extends StatefulWidget{
 
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;
  Widget currentPage;

  MainScreenState(this._countController,this._selectedProducts);

  MyHomePage homePage;
  OrderPage orderPage;
  ProfilePage profilePage;
  List<Widget> pages;

  @override
  void initState() {
    super.initState();
    homePage = MyHomePage();
    orderPage = OrderPage();
    profilePage = ProfilePage();
    pages = [homePage, orderPage, profilePage];
    currentPage = homePage;
  }

  @override
  Widget build(BuildContext context) {

    List<BottomNavigationBarItem> _items = [
    
      BottomNavigationBarItem(icon: Icon(Icons.home,), title: Text("Home"),),  
      BottomNavigationBarItem(icon: Icon(Icons.cart,), title: Text("Cart"),),
      BottomNavigationBarItem(icon: Icon(Icons.person,), title: Text("Profile"),),];

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {

            setState(() {
              currentTabIndex = index;
              currentPage = pages[index];
            });
          },
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          items: _items
      ),
      body: currentPage,
    );
  }
}
