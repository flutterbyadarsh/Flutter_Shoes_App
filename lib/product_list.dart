import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_Data.dart';
import 'package:shop_app_flutter/product_Cart.dart';
import 'package:shop_app_flutter/product_Detail_page.dart';

class ProductList extends StatefulWidget{
  const ProductList ({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const['All', 'Adidas', 'Nike', 'Campus', 'Puma',];
  // String selectedFilter = 'All';
  late String selectedFilter ;

  @override
  void initState(){
    super.initState();
    selectedFilter = filters[0]; // its means 'All'
  }
  @override
  Widget build(BuildContext context){
    //media ko replace karega layout builder
    //best hai
   // final size = MediaQuery.of(context).size;
    final border= OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(0, 0, 0, 1),
      ),
      borderRadius: BorderRadius.horizontal(left:Radius.circular(50),
      ),
    );


    return SafeArea(
    child: Column(
    children : [
    Row(
    children: [
    Padding(
    padding: const EdgeInsets.all(20.0),
    child: Text(
    'Shoes\nCollection',
    style:Theme.of(context).textTheme.titleLarge,
    ),
    ),

    // GridDelegate used at rotate mode how much app product shown in rotation image


    Expanded(
    child: TextField(
    decoration: InputDecoration(
    hintText: 'Search',
    prefixIcon: const Icon(Icons.search),
    border: border,
    enabledBorder: border,
    focusedBorder: border,
    //enabledBorder: border,


    ),
    )
    ),


    ],
    ),
    /// chip and Filter Chip
    SizedBox(
    height: 120,
    child: ListView.builder(
    itemCount: filters.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
    final filter = filters[index]; // ek ke baadh ek elemnts ko check karke print karega
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    // ON Tap function
    child: GestureDetector(
    onTap: () {
    setState(() {
    selectedFilter = filter;
    });
    },
    // chip
    child: Chip(
    backgroundColor: selectedFilter == filter ? Theme.of(context).colorScheme.primary :
    const Color.fromRGBO(245, 247, 249, 1),

    side: BorderSide(
    color: const Color.fromRGBO(245, 247, 249, 1),
    ),
    label:Text(filter),
    labelStyle: const TextStyle(
    fontSize: 18,

    ),
    padding: const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 11,),
    shape: StadiumBorder(
    ),

    // elevation: 3,
    //shadowColor: Colors.white30,
    //shape: RoundedRectangleBorder(
    //  borderRadius: BorderRadius.circular(40)


    ),
    ),
    );
    }, // data we passed they show
    ),
    ),
    /// chips item are here
      /// gridview used here

    Expanded(
    child: ListView.builder(
    itemCount: products.length,
    itemBuilder: (context, index) {
    final product = products[index];
    return GestureDetector(
    onTap: () {
    //context find accestor state  again and behind , nearest navigator
    Navigator.of(context).push(MaterialPageRoute(
    builder: (context){
    return  ProductDetailPage(product: product);
    }
    ),
    );
    },
    child: ProductCart(
    title: product['title']as String,
    price: product['price'] as double,
    image: product['imageUrl']as String,
    backgroundColor: index.isEven ? const Color.fromRGBO(216, 240, 253, 1) : const Color.fromRGBO(245, 247, 249 , 1),

    ),
    );
    },


    ),
    ),

    ],
    ),

    );
  }
}