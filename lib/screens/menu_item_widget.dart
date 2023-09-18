import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_menu/models/FullMenu.dart';
import 'package:restaurant_menu/screens/item_detail_page.dart';


class MenuGridItem extends StatelessWidget {
  final ItemDetails menuItem;

  MenuGridItem({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.restaurant),
    onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetailPage(itemDetail: menuItem,)));
    },
     title: Text(this.menuItem.name!),
      subtitle: Text('\$' + (this.menuItem.price!/100).toStringAsFixed(2)),
      // trailing: Icon(Icons.add_shopping_cart),
    );
  }
}
