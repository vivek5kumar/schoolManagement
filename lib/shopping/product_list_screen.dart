import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/shopping/card_model.dart';
import 'package:schoolmanagement/shopping/cart_controller.dart';
import 'package:schoolmanagement/shopping/db_helper.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  DBHelper? dbHelper = DBHelper();
  var st = [];
  var st1 = [];
  bool isLoading = false;

  setLoading(val) {
    isLoading = val;
  }

  void printFun() {
    for (int i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        st.add(i);
      } else {
        st1.add(i);
      }
    }
    print("first line:${st}");
    print(st1);
  }

  List<String> productName = [
    'Mango',
    'Orange',
    'Grapes',
    'Banana',
    'Chery',
    'Peach',
  ];
  List<String> productUnit = [
    'KG',
    'Dozen',
    'KG',
    'Dozen',
    'KG',
    'KG',
  ];
  List<int> productPrice = [
    30,
    50,
    89,
    56,
    41,
    70,
  ];
  List<String> productImage = [
    'https://media.istockphoto.com/id/168370138/photo/mango.jpg?s=612x612&w=0&k=20&c=ENq2BrUV8dNH2rth_ZYBBtS9RWDwCbI25SfulxirmnQ=',
    'https://media.gettyimages.com/id/127743622/photo/oranges.jpg?s=612x612&w=0&k=20&c=BCEFIuHA95UOVwxTp79JsLaHUekSDVToF-D-MIoEMmM=',
    'https://images.unsplash.com/photo-1525286102393-8bf945cd0649?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z3JhcGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmFuYW5hfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://t3.ftcdn.net/jpg/01/51/01/68/240_F_151016880_jBCeI7vYIrlZOPt4h0buJ0hXHmWEnKWN.jpg',
    'https://t4.ftcdn.net/jpg/04/57/86/93/240_F_457869303_c6rC0C8jXn1Wqa1ObEj6e8flO91ZA9g2.jpg',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    printFun();
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
        centerTitle: true,
        actions: [
          Center(
            child: Badge(
              badgeContent: Text(
                cartController.getCounter().toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: Icon(Icons.shopping_bag),
            ),
          ),
          const SizedBox(
            width: 20.0,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: productName.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image(
                                      alignment: Alignment.center,
                                      height: 100,
                                      width: 100,
                                      image: NetworkImage(
                                        productImage[index].toString(),
                                      )),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          productName[index],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // ignore: prefer_interpolation_to_compose_strings
                                        Text(productUnit[index].toString() +
                                            " " +
                                            r"$" +
                                            productPrice[index].toString()),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: MaterialButton(
                                              color: Colors.red,
                                              onPressed: () {
                                                setState(() {
                                                  dbHelper!
                                                      .insert(Cart(
                                                          id: index,
                                                          productId:
                                                              index.toString(),
                                                          productName:
                                                              productName[index]
                                                                  .toString(),
                                                          initialPrice:
                                                              productPrice[
                                                                  index],
                                                          productPrice:
                                                              productPrice[
                                                                  index],
                                                          quantity: 1,
                                                          unitTag:
                                                              productUnit[index]
                                                                  .toString(),
                                                          image: productImage[
                                                                  index]
                                                              .toString()))
                                                      .then((value) {
                                                    print(
                                                        "Product is added to cart");
                                                    cartController
                                                        .addTotalPrice(double
                                                            .parse(productPrice[
                                                                    index]
                                                                .toString()));
                                                    cartController.addCounter();
                                                  }).onError(
                                                          (error, stackTrace) {
                                                    print(error.toString());
                                                  });
                                                });
                                              },
                                              child: const Text(
                                                "Add to Cart",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
