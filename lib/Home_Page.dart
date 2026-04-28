import 'package:flutter/material.dart';
import 'package:shop_app_flutter/cartPage.dart';
import 'package:shop_app_flutter/product_list.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage = 0;
  List<Widget> Pages = const [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: Pages,
      ),
      /// cart button
      bottomNavigationBar: BottomNavigationBar(
        iconSize:35,
        selectedFontSize: 2,
        unselectedFontSize: 2,
        onTap: (value){
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label:'Home',
          ),

            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),

              label:'Cart',
            ),
              ],
            ),

    );

  }
}