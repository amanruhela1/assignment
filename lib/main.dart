import 'package:assignment/checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // Initialized the controllers
  final ShoppingController itemController = Get.put(ShoppingController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopping List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shopping List'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(

                  // Getting the length of items added by user using the textfield & subission using button
                  // Items are stored in data.dart file
                  // Items include the text and a boolean
                  itemCount: itemController.items.length,
                  itemBuilder: (context, index) {
                    var item = itemController.items[index];

                    // Returning a Card widget with a child of Listtile to show the items
                    return Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Card(
                        elevation: 2.0,
                        margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                        child: ListTile(
                          // Created a checkbox class separetly inorder to maintain the state of checkbox
                          leading: ItemCheckbox(
                            value: item.completed,
                            onChanged: (value) {
                              itemController.toggleItem(index);
                            },
                          ),
                          title: Text(
                            item.text,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Roboto',
                              decoration: item.completed
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Function to remove the item from data class
                              itemController.removeItem(index);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Created a row of textfield and Iconbutton to add the items in the list
            Padding(
              padding: EdgeInsets.only(left: 10, right: 8, bottom: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: itemController.textController,
                      decoration: InputDecoration(
                        labelText: 'Add item',
                        labelStyle: TextStyle(color: Color.fromARGB(255, 89, 36, 142)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 89, 36, 142)),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 89, 36, 142)),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onSubmitted: (_) {
                        itemController.addItem();
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, size: 28, color: Color.fromARGB(255, 89, 36, 142),),
                    onPressed: () {
                      // Function to add the item in data class
                      itemController.addItem();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
