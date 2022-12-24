import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:my_compta_app/models/media/ImageMediaAdapter.dart';
import 'package:my_compta_app/models/order/OrderAdapter.dart';
import 'package:my_compta_app/models/product/ProductAdapter.dart';
import 'package:my_compta_app/models/transaction/TransactionAdapter.dart';

initHive() async {
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(ImageMediaAdapter().typeId))
    Hive.registerAdapter(ImageMediaAdapter());

  if (!Hive.isAdapterRegistered(ProductAdapter().typeId))
    Hive.registerAdapter(ProductAdapter());

  if (!Hive.isAdapterRegistered(TransactionAdapter().typeId))
    Hive.registerAdapter(TransactionAdapter());

  if (!Hive.isAdapterRegistered(OrderAdapter().typeId))
    Hive.registerAdapter(OrderAdapter());

  if (!Hive.isBoxOpen(imageMediasBoxname))
    await Hive.openBox<ImageMedia>(imageMediasBoxname);

  if (!Hive.isBoxOpen(productsBoxname))
    await Hive.openBox<Product>(productsBoxname);

  if (!Hive.isBoxOpen(transactionsBoxname))
    await Hive.openBox<Transaction>(transactionsBoxname);

  if (!Hive.isBoxOpen(ordersBoxname)) await Hive.openBox<Order>(ordersBoxname);
}
