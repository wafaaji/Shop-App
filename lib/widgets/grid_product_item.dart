import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_details_screen.dart';

class GridProductItem extends StatelessWidget {
  final String id,title,image;
  const GridProductItem({super.key, required this.id, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: GridTile(
        footer: GridTileBar(
          title: Text(title, textAlign: TextAlign.center,style: const TextStyle(fontSize: 10),),
          backgroundColor: Colors.black54,
          leading: IconButton(icon: const Icon(Icons.favorite),
            onPressed: (){
            Navigator.of(context).pushNamed(ProductDetailsScreen.id, arguments: id);
            },
          ),
          trailing: IconButton(icon: const Icon(Icons.shopping_cart),
            onPressed: (){},
          ),
        ),
        child: GestureDetector(
          onTap: (){

          },
          child: Image.asset(image),
        ),
      ),
    );
  }
}
