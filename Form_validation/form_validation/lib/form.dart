import 'package:flutter/material.dart';

class Item {
  String itemName;
  double itemPrice;

  Item({required this.itemName, required this.itemPrice});
}

class Validation extends StatefulWidget {
  @override
  State<Validation> createState() => _ValidationState();
}

class _ValidationState extends State<Validation> {
  List<Item> items = [];
  bool sort = true;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _itemController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _itemController;
    _priceController;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    //textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                        labelText: 'Enter the product name',
                        labelStyle: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.greenAccent),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.green),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    controller: _itemController,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Enter the product price',
                          labelStyle: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.greenAccent),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.green),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      controller: _priceController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        keyboardType:
                        TextInputType.numberWithOptions(
                          decimal: true,
                        );
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          items.add(Item(
                              itemName: _itemController.text,
                              itemPrice: double.parse(_priceController.text)));
                          setState(() {
                            _itemController.clear();
                            _priceController.clear();
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen,
                          elevation: 10,
                          shadowColor: Colors.lightBlueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90))),
                      child: Container(
                        height: 50,
                        width: 150,
                        alignment: Alignment.center,
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      )
                      // Icon(
                      //   Icons.subdirectory_arrow_left,
                      //   size: 30,
                      // ),
                      ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DataTable(
              sortColumnIndex: 1,
              sortAscending: sort,
              columns: [
                DataColumn(
                  label: Text(
                    'Item',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  numeric: true,
                  onSort: (int index, bool ascending) {
                    if (ascending) {
                      items.sort((a, b) => b.itemPrice.compareTo(a.itemPrice));
                    } else {
                      items.sort((a, b) => a.itemPrice.compareTo(b.itemPrice));
                    }
                    setState(() {
                      sort = ascending;
                    });
                  },
                  label: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              rows:
                  // TODO: Create a row for each item's name and item's price in the table

                  mapItemToDataRows(items).toList(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _priceController.dispose();
    _itemController.dispose();
  }

  Iterable<DataRow> mapItemToDataRows(List<Item> items) {
    Iterable<DataRow> dataRows = items.map((item) {
      return DataRow(cells: [
        DataCell(
          Text(
            item.itemName,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Segoe UI'),
          ),
        ),
        DataCell(
          Text(
            item.itemPrice.toString(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ]);
    });
    return dataRows;
  }
}
