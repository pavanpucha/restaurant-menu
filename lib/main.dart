import 'package:flutter/material.dart';
import 'package:restaurant_menu/common/screen_util.dart';
import 'package:restaurant_menu/common/strings.dart';
import 'package:restaurant_menu/screens/menu_item_widget.dart';

import 'common/helpers.dart';
import 'models/FullMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Restaurant Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var allItems = generateMockData();

  var li = generateMockData().categories;
  var currentCat = "";

  void sortItems(String cat) {
    setState(() {
      currentCat = cat;
      li = allItems.categories?.where((element) => element.categoryName == currentCat).toList();
    });

  }

  void clearFilter() {
    setState(() {
      currentCat = "";
      li = allItems.categories
          ?.where((element) => element.categoryName != currentCat).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          new Stack(children: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {},
            )
          ])
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: ScreenUtil.blockSizeHorizontal * 20,
                width: ScreenUtil.blockSizeVertical * 100,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    itemCount: allItems.categories?.length,
                    itemBuilder: (context, idx) {
                      return GestureDetector(
                        onTap: () {
                          print(allItems.categories![idx].categoryName);
                          sortItems(allItems.categories![idx].categoryName!);//
                          //clearFilter();
                        },
                        child: Container(
                            height: ScreenUtil.safeBlockVertical * 20,
                            width: ScreenUtil.safeBlockHorizontal * 20,
                            child: Card(
                              child: Center(
                                  child: Text(
                                      allItems.categories![idx].categoryName!, style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14
                                  ),),),
                            )),
                      );
                    }),
              ),
              currentCat == "" ? Text("") : Card(
                elevation: 4,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () { clearFilter();},
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(text: 'Clear Filters'),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Icon(Icons.clear,color: Colors.black,size: 15),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              )
,
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: li?.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          li![index].categoryName!,
                          style: titleTextStyle(),
                        ),
                        ListView.builder(
                            itemCount: li![index].categoryItems!.length,
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int idx) {
                              return Card(
                                borderOnForeground: true,
                                child: MenuGridItem(
                                    menuItem: li![index]
                                        .categoryItems![idx]),
                              );
                            })
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
