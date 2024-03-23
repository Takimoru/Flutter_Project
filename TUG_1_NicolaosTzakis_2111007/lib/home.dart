import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  TextEditingController _itemNameController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

  // Order to save
  late Order _order;

  @override
  void initState() {
    super.initState();
    _order = Order('', 0); // Initialize the order object
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
        backgroundColor: Colors.blue[300], // Set background color for AppBar
      ), // Set background color for body
      body: Center( // Center the form
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            color: Colors.white, // Background color for the form container
            child: Form(
              key: _formStateKey,
              autovalidateMode: AutovalidateMode.always, // Set autovalidate to true
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _itemNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter item description',
                      labelText: 'Item Description',
                    ),
                    validator: (value) => _validateItemRequired(value),
                    onSaved: (value) {
                      _order.itemName = value!;
                    },
                  ),
                  TextFormField(
                    controller: _quantityController,
                    decoration: InputDecoration(
                      hintText: 'Enter quantity',
                      labelText: 'Quantity',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) => _validateItemCount(value),
                    onSaved: (value) {
                      _order.quantity = int.tryParse(value ?? '') ?? 0;
                    },
                  ),
                  Divider(height: 32.0,), // Add Divider
                  SizedBox(height: 16), // Add SizedBox for spacing
                  ElevatedButton( // Change RaisedButton to ElevatedButton
                    child: Text('Save'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                    ),
                    onPressed: _submitOrder,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _validateItemRequired(String? value) {
    return value == null || value.isEmpty ? 'Item Required' : null;
  }

  String? _validateItemCount(String? value) {
    int _valueAsInteger = value == null ? 0 : int.tryParse(value) ?? 0;
    return _valueAsInteger == 0 ? 'At least one item required' : null;
  }

  void _submitOrder() {
    if (_formStateKey.currentState != null && _formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save(); // Save form fields to order object
      // Process data or submit order
      print('Ordered Item: ${_order.itemName}, Quantity: ${_order.quantity}');
    }
  }

  @override
  void dispose() {
    _itemNameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }
}

class Order {
  String itemName;
  int quantity;

  Order(this.itemName, this.quantity);
}
