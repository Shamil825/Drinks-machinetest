import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_authetication/controller/homescreen_controller.dart';
import 'package:user_authetication/model/model.dart';
import 'package:user_authetication/view/detailscreen.dart';

class HomeScreen extends StatelessWidget {
  final searchcontroller = TextEditingController();
  final homescreencontroller = Get.put(HomeScreenController());
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.brown,
            automaticallyImplyLeading: false,
            title: SizedBox(
              height: 40,
              width: 400,
              child: TextFormField(
                onChanged: (onchanged) async{
                  
                  if (onchanged == "") {
                   await homescreencontroller.get();
                   FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                decoration: InputDecoration(
                    suffixIcon: Container(
                      color: Colors.red,
                      height: 20,
                      width: 30,
                      child: IconButton(
                          onPressed: () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (searchcontroller.text == "") {
                              Get.snackbar(
                                "Oops",
                                "Please enter the name",
                                snackPosition: SnackPosition.BOTTOM,
                                isDismissible: true,
                                duration: Duration(
                                  seconds: 4,
                                ),
                                backgroundColor: Colors.red,
                                forwardAnimationCurve: Curves.easeOutBack,
                              );
                            } else {
                              await homescreencontroller.seach(
                                  searchKeyword: searchcontroller.text);
                            }
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "search here by name"),
                controller: searchcontroller,
              ),
            )),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GetX<HomeScreenController>(builder: (controller) {
                  return controller.isempty == true
                      ? Center(
                          child: const Text(
                          "No Drink Found",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                      : ListView.builder(
                          itemCount: controller.listDrinks.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(

                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                          drinks:
                                              controller.listDrinks[index]!)),
                                );
                              },
                              child: Card(
                                elevation: 10,
                                margin: const EdgeInsets.all(12),
                                child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height: 80,
                                            width: 80,
                                            child: Hero(
                                                tag: controller
                                                    .listDrinks[index]!
                                                    .idDrink!,
                                                child: Image.network(
                                                  controller.listDrinks[index]!
                                                      .strDrinkThumb!,
                                                  fit: BoxFit.cover,
                                                ))),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.listDrinks[index]!
                                                    .strCategory!,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(controller.listDrinks[index]!
                                                  .strDrink!),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(controller.listDrinks[index]!
                                                  .strAlcoholic!),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(controller
                                                  .listDrinks[index]!.strGlass!)
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            );
                          }),
                        );
                }),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }
}
