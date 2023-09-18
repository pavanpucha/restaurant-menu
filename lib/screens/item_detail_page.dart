import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_menu/common/helpers.dart';
import 'package:restaurant_menu/models/FullMenu.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemDetailPage extends StatefulWidget {
  final ItemDetails itemDetail;

  ItemDetailPage({required this.itemDetail});

  @override
  State createState() {
    return ItemDetailPageState();
  }
}

enum SandwichAddon { GreenSalad, FreshFruit }

class ItemDetailPageState extends State<ItemDetailPage> {
  bool isUpgrade = false;
  SandwichAddon? sandwichAddon = SandwichAddon.FreshFruit;
  var _breadValue = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Image(
                    image: AssetImage(
                  widget.itemDetail.imageAsset!,
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.itemDetail!.name!,
                style: titleTextStyle(),
              ),
              widget.itemDetail!.isSandwich! == true
                  ? Column(
                      children: <Widget>[
                        Text(
                            '''Served with choice of house pasta salad, green salad, or fresh fruit. For an additional \$1.50, you can '''),
                        CheckboxListTile(
                          title: Text(
                              "“Upgrade” (by substituting) to ½ pasta salad of the day, "
                              "French onion soup or soup of "
                              "the day."),
                          value: isUpgrade,
                          secondary: Text(
                            '\$1.50',
                            style: TextStyle(fontSize: 20),
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              isUpgrade = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                        ListTile(
                          title: Text("Select Bread"),
                        ),
                        SizedBox(
                            height: 125,
                            child: ListView.builder(
                              itemCount: widget
                                  .itemDetail.sandwichDetails!.breadType.length,
                              controller: ScrollController(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Container(
                                child: RadioListTile(
                                  title: Text(widget.itemDetail.sandwichDetails!
                                      .breadType[index]),
                                  value: widget.itemDetail.sandwichDetails!
                                      .breadType[index],
                                  groupValue: _breadValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _breadValue = value.toString();
                                    });
                                  },
                                ),
                              ),
                            )),
                        ListTile(
                          title: Text("Choose an Add-on"),
                        ),
                        RadioListTile(
                          title: Text("Green Salad"),
                          value: SandwichAddon.GreenSalad,
                          groupValue: sandwichAddon,
                          onChanged: (newValue) {
                            setState(() {
                              sandwichAddon = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                        RadioListTile(
                          title: Text("Fresh Fruit"),
                          groupValue: sandwichAddon,
                          value: SandwichAddon.FreshFruit,
                          onChanged: (newValue) {
                            setState(() {
                              sandwichAddon = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        )
                      ],
                    )
                  : Text(""),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "\$${(isUpgrade ? (150 + widget.itemDetail.price!) / 100 : (widget.itemDetail.price!) / 100).toStringAsFixed(2)} Add to Cart",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ))
            ],
          ),
        ));
  }
}
