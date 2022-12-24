import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_compta_app/repositories/product/orders_repository.dart';

import '../../../../constants/memory.dart';
import '../../../../models/product/Product.dart';
import '../../../../models/media/ImageMedia.dart' as im;

class CreateProduct extends StatefulWidget {
  @override
  _CreateProductState createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _nbController = TextEditingController();

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
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 10.0,
                ),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "Saisisser les donner de votre produit",
                        style: titleStyle,
                      ),
                    ),
                  ],
                ),
              ),
              // Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
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
                                            MediaQuery.of(context).size.width -
                                                128.0,
                                        height:
                                            MediaQuery.of(context).size.width -
                                                128.0,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 4.0,
                                    right: 4.0,
                                    child: GestureDetector(
                                      onTap: () =>
                                          setState(() => _image = null),
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
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Le nom du produit est obligatoire';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Nom du produit:',
                          labelStyle: textFieldLabelStyle,
                        ),
                        controller: _titleController,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
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
                                  return 'Le prix du produit est obligatoire';
                                }
                                if (double.tryParse(value) == null)
                                  return 'Le prix n\'est pas valide';
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Prix du produit:',
                                labelStyle: textFieldLabelStyle,
                              ),
                              controller: _priceController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        
                         
                            Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Le nombre des pieces produit est obligatoire';
                                }
                                if (double.tryParse(value) == null)
                                  return 'Le nombre des pieces n\'est pas valide';
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'nombre des pieces :',
                                labelStyle: textFieldLabelStyle,
                              ),
                              controller: _nbController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () => submitForm(),
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



  submitForm() async {
    if (!_formKey.currentState.validate()) return;
    if (_image == null) return;
   
        ProductRepository.addProduct(
          Product(
            id: products.length,
            title: _titleController.text,
            image: im.ImageMedia(
              id: DateTime.now().millisecond,
              createdAt: DateTime.now(),
              ext: _image.path.split('.').last,
              name: _image.path.split('/').last,
              pathOfImage: _image.path,
             
            ),
            createdAt: DateTime.now(),
          
            price: double.tryParse(_priceController.text),
            nbPieces: int.parse(_nbController.text),
      ),
    );
    amoun ();
    Navigator.pop(context);
  }
}
