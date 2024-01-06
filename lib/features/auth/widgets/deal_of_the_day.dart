import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/features/home/screens/services/home_services.dart';
import 'package:flutter_amazon_clone/models/product.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  HomeServices homeServices = HomeServices();
  @override
  void initState() {
    fetchDealOfDay(); //
    super.initState();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    print(product!.name+"123");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : product!.name.isEmpty
            ? const SizedBox()
            : Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, bottom: 10),
                    child: const Text(
                      "Deal of the Day",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Image.network(
                    product!.images[0],
                    height: 235,
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 15, right: 40, top: 5),
                    child: const Text(
                      '\$100',
                      style: TextStyle(fontSize: 18),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 15, right: 40, top: 5),
                    child: const Text(
                      'Rivan',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: product!.images
                            .map((e) => Image.network(
                                  e,
                                  fit: BoxFit.fitWidth,
                                  height: 100,
                                  width: 100,
                                ))
                            .toList()),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: const Text(
                      'See all deals',
                      style: TextStyle(color: Colors.cyan),
                    ),
                  ),
                ],
              );
  }
}
