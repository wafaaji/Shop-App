import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/card_provider.dart';
import 'package:shop_app/screens/product_details_screen.dart';

class GridProductItem extends StatelessWidget {
  const GridProductItem({super.key,});

  @override
  Widget build(BuildContext context) {
    //final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return Consumer<Product>(
      builder: (context, product, child){
      return ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: GridTile(
          footer: GridTileBar(
            title: Text(product.title, textAlign: TextAlign.center,style: const TextStyle(fontSize: 10),),
            backgroundColor: Colors.black54,
            leading: IconButton(icon: product.isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
              onPressed: (){
                product.toggleIsFav();
              },
            ),
            trailing: IconButton(icon: const Icon(Icons.shopping_cart),
              onPressed: (){
              cart.addItem(productId: product.id, title: product.title, price: product.price);
              },
            ),
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(ProductDetailsScreen.id, arguments: product.id);
            },
            child: Image.asset(product.image),
          ),
        ),
      );}
    );
  }
}
