import 'package:my_compta_app/constants/memory.dart';
import 'package:my_compta_app/models/product/Product.dart';

import '../../models/transaction/Transaction.dart';

class OrdersRepository {
  static Future<void> addOrder(Transaction transaction) async {
    transactions.insert(
      0,
      transaction.copyWith(
        id: transactions.length,
      ),
    );
  }
}

class ProductRepository {
  static Future<void> addProduct(Product produit) async {
    products.insert(
      0,
      produit.copyWith(
        id: products.length,
      ),
    );
  }
}
List<Product> commands =[];

class CommandRepository {
  static Future<void> addProduct(Product command) async {
    commands.insert(
      0,
      command.copyWith(
        id: commands.length,
      ),
    );
  }
}


List<Transaction> transactions = [
  Transaction(
    id: 0,
    title: 'iPhone X 256gb',
    createdAt: DateTime.now().subtract(
      Duration(hours: 1),
    ),
    amount: 21000.00,
    expense: false,
  ),
  Transaction(
    id: 1,
    title: 'Samsung Galaxy S11 64gb',
    createdAt: DateTime.now().subtract(
      Duration(days: 1, hours: 1),
    ),
    amount: 21000.00,
    expense: false,
  ),
  Transaction(
    id: 2,
    title: 'Cable USB (iPhone XS)',
    createdAt: DateTime.now().subtract(
      Duration(days: 2, hours: 1),
    ),
    amount: 300.00,
    expense: false,
  ),
  Transaction(
    id: 3,
    title: 'Bouteille de viens',
    createdAt: DateTime.now().subtract(
      Duration(days: 2, hours: 1),
    ),
    amount: 10.00,
    expense: true,
  ),
  Transaction(
    id: 4,
    title: 'Facture SOMELEC',
    createdAt: DateTime.now().subtract(
      Duration(days: 3),
    ),
    amount: 3400.00,
    expense: true,
  ),
  Transaction(
    id: 5,
    title: 'Le loyer du boutique #2',
    createdAt: DateTime.now().subtract(
      Duration(days: 3),
    ),
    amount: 4500.00,
    expense: true,
  ),
  Transaction(
    id: 6,
    title: 'Le loyer du boutique #1',
    createdAt: DateTime.now().subtract(
      Duration(days: 3),
    ),
    amount: 4000.00,
    expense: true,
  ),
];
