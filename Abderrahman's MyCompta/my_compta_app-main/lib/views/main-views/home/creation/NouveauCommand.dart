import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_compta_app/constants/memory.dart';
import 'package:my_compta_app/models/product/Product.dart';
import 'package:my_compta_app/repositories/product/orders_repository.dart';

import '../../../../models/transaction/TransactionAdapter.dart';
import '../../../../models/media/ImageMedia.dart' as im;

class CreateNewOrder extends StatefulWidget {
  @override
  _CreateNewOrderState createState() => _CreateNewOrderState();
}

class _CreateNewOrderState extends State<CreateNewOrder> {
  final _formKey = GlobalKey<FormState>();
  final quantityController = TextEditingController(text: '1');
  final nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _nbController = TextEditingController();

  Product selectedProduct;
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: MediaQuery.of(context).size.width / 28.0,
      color: Colors.black87,
    );

    final textFieldLabelStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
    );

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.close,
            color: Colors.black87,
          ),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Title
              GestureDetector(
                onTap: () => getImage(),
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  width: MediaQuery.of(context).size.width - 128.0,
                  height: MediaQuery.of(context).size.width - 128.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 12,
                      )
                    ],
                  ),
                  child: _image == null
                      ? Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_outlined,
                              size: 64.0,
                              color: Colors.black45,
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              "Inserez une Image du produit",
                              style: TextStyle(
                                color: Color(0xAA000000),
                                fontWeight: FontWeight.w800,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        )
                      : Stack(
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.file(
                                  _image,
                                  fit: BoxFit.cover,
                                  width:
                                      MediaQuery.of(context).size.width - 128.0,
                                  height:
                                      MediaQuery.of(context).size.width - 128.0,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 4.0,
                              right: 4.0,
                              child: GestureDetector(
                                onTap: () => setState(() => _image = null),
                                child: Icon(
                                  Icons.delete_rounded,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              // Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Veuillez saisir le Nom du Produit.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Nom du Produit :',
                                labelStyle: textFieldLabelStyle,
                              ),
                              controller: nameController,
                              onFieldSubmitted: (t) {
                                if (t.isEmpty ||
                                    int.tryParse(quantityController.text) ==
                                        null ||
                                    int.tryParse(quantityController.text) <=
                                        0) {
                                  quantityController.text = '1';
                                }
                                setState(() {});
                              },
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Veuillez saisir le Prix du Produit.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Prix du Produit :',
                                labelStyle: textFieldLabelStyle,
                              ),
                              controller: _priceController,
                              onFieldSubmitted: (t) {
                                if (t.isEmpty ||
                                    int.tryParse(quantityController.text) ==
                                        null ||
                                    int.tryParse(quantityController.text) <=
                                        0) {
                                  quantityController.text = '1';
                                }
                                setState(() {});
                              },
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Veuillez saisir la quantité.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Quantité du produit:',
                                labelStyle: textFieldLabelStyle,
                              ),
                              controller: quantityController,
                              onFieldSubmitted: (t) {
                                if (t.isEmpty ||
                                    int.tryParse(quantityController.text) ==
                                        null ||
                                    int.tryParse(quantityController.text) <=
                                        0) {
                                  quantityController.text = '1';
                                }
                                setState(() {});
                              },
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                    selectedProduct != null &&
                            quantityController.text.isNumericOnly
                        ? Container(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              'Total: ' +
                                  (selectedProduct.price *
                                          int.parse(quantityController.text))
                                      .toStringAsFixed(2),
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          )
                        : Container(),
                    FlatButton(
                      onPressed: () {
                        CommandsubmitForm();
                      },
                      child: Text("Ajouter"),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(16.0),
                      minWidth: MediaQuery.of(context).size.width - 18,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  chooseProduct() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Vos produit:',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    Product product = products[index];
                    return ListTile(
                      onTap: () {
                        selectedProduct = product;
                        setState(() {});
                        Navigator.of(context).pop();
                      },
                      leading: product.image.pathOfImage.startsWith('http')
                          ? Image.network(
                              product.image.pathOfImage,
                            )
                          : Image.file(
                              File(product.image.pathOfImage),
                            ),
                      title: Text(product.title),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  submitForm() async {
    OrdersRepository.addOrder(
      Transaction(
        id: null,
        title: selectedProduct.title,
        createdAt: DateTime.now(),
        amount: (selectedProduct.price * int.parse(quantityController.text)),
        expense: true,
      ),
    );
    amoun();
    Navigator.of(context).pop();
  }

  CommandsubmitForm() async {
    if (!_formKey.currentState.validate()) return;
    if (_image == null) return;
    Product p = new Product(
        id: products.length,
        title: nameController.text,
        image: im.ImageMedia(
          id: DateTime.now().millisecond,
          createdAt: DateTime.now(),
          ext: _image.path.split('.').last,
          name: _image.path.split('/').last,
          pathOfImage: _image.path,
        ),
        createdAt: DateTime.now(),
        price: double.tryParse(_priceController.text),
        nbPieces: int.parse(quantityController.text),
      );
    CommandRepository.addProduct(
      p,
    );
    OrdersRepository.addOrder(
      Transaction(
        id: null,
        title: p.title,
        createdAt: DateTime.now(),
        amount: (p.price * p.nbPieces),
        expense: true,
      ),
    );
    amoun();
    Navigator.pop(context);
  }
}
