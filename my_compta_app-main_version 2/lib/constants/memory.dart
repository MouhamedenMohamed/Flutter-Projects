import 'package:my_compta_app/models/media/ImageMedia.dart';
import 'package:my_compta_app/models/product/Product.dart';
import 'package:my_compta_app/models/transaction/Transaction.dart';
import 'package:my_compta_app/repositories/product/orders_repository.dart';

double mon ;
double cach = 0;
double ent;
double total;
double  command =0;
double  dep =0;
double  stock =0;


  
List<Product> products = [
  Product(
    nbPieces: 2,
    id: 1,
    title: 'iPhone 12 128gb',
    createdAt: DateTime.now().subtract(Duration(days: 1, hours: 2, minutes: 3)),
    price: 18000,
    image: ImageMedia(
      id: 1,
      createdAt:
          DateTime.now().subtract(Duration(days: 1, hours: 2, minutes: 3)),
      
      name: 'ix',
      ext: 'jpg',
      pathOfImage:
          'https://www.bsetechnology.com/wp-content/uploads/2018/07/iPhoneX-silver-1.jpg',
    ),
  ),
  Product(
    id: 1,
    title: 'iPhone 12 512gb',
    createdAt: DateTime.now().subtract(Duration(days: 1, hours: 2, minutes: 3)),
    price: 18000,
    image: ImageMedia(
      id: 1,
      createdAt:
          DateTime.now().subtract(Duration(days: 1, hours: 2, minutes: 3)),
      
      name: 'ix',
      ext: 'jpg',
      pathOfImage:
          'https://www.bsetechnology.com/wp-content/uploads/2018/07/iPhoneX-silver-1.jpg',
    ), nbPieces: 2,
  ),
  Product(
    nbPieces: 2,
    id: 1,
    title: 'iPhone 12 1tb',
    createdAt: DateTime.now().subtract(Duration(days: 1, hours: 2, minutes: 3)),
    price: 18000,
    image: ImageMedia(
      id: 1,
      createdAt:
          DateTime.now().subtract(Duration(days: 1, hours: 2, minutes: 3)),
      
      name: 'ix',
      ext: 'jpg',
      pathOfImage:
          'https://www.bsetechnology.com/wp-content/uploads/2018/07/iPhoneX-silver-1.jpg',
    ),
  ),
];

void amoun (){
  
  total=0;
  cach=0;
 command =0;
  dep =0;
 stock =0;
 for(Transaction t in transactions){
  if(t.expense==false)
 { cach+=t.amount;
  
}
else{
  dep+=t.amount;
}

 }
  for(Product p in products){
     stock+=p.price*p.nbPieces;
  }
   total-=cach;
  for(Product pr in commands){
     command+=pr.price*pr.nbPieces;
  }
 dep+=command;
}