/*
import 'package:app_payku_base_v_0_1/features/backoffice/products/presentation/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'product_card.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen({super.key});

  @override
  ProductsScreenState createState() => ProductsScreenState();
}

class ProductsScreenState extends ConsumerState<ProductsScreen> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 400) >=
          scrollController.position.maxScrollExtent) {
        ref.read(productsProvider2.notifier).loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsState = ref.watch(productsProvider2);

    return Column(
      children: [
        SizedBox(height: 100, child: Container()),
        Center(child: Text('SCREEEN DE productosSS nuevo')),
        Expanded(
          child: ListView.builder(
            controller: ScrollController(),
            itemCount: productsState.products.length,
            itemBuilder: (context, index) {
              final item = productsState.products[index];
              print(item);
              return GestureDetector(
                  onTap: (){
                    context.push('/product/${item.id}');
                  },
                  child: ProductCard(product: item));
              return ListTile(key: ValueKey(item.id), title: Text(item.title));
            },
          ),
        ),
      ],
    );
  }
}

 */