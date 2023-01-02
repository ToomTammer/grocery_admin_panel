import 'package:admin_p/const/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/MenuController.dart';
import '../inner_screens/add_prod.dart';
import '../responsive.dart';
import '../services/utils.dart';
import '../widget/buttons.dart';
import '../widget/grid_products.dart';
import '../widget/header.dart';
import '../widget/orders_list.dart';
import '../widget/text_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    Color color = Utils(context).color;
    final menuProvider = Provider.of<MenuController>(context);
    return SafeArea(
      child: SingleChildScrollView(
        controller: ScrollController(),
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              fct: () {
                menuProvider.controlDashboarkMenu();
              },
              title: 'Dashboard',
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: 'Latest Products',
              color: color,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ButtonsWidget(
                      onPressed: () {},
                      text: 'View All',
                      icon: Icons.store,
                      backgroundColor: Colors.blue),
                  const Spacer(),
                  ButtonsWidget(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UploadProductForm(),
                          ),
                        );
                      },
                      text: 'Add product',
                      icon: Icons.add,
                      backgroundColor: Colors.blue),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  // flex: 5,
                  child: Column(
                    children: [
                      Responsive(
                        mobile: ProductGridWidget(
                          crossAxisCount: size.width < 650 ? 2 : 4,
                          childAspectRatio:
                              size.width < 650 && size.width > 350 ? 1.1 : 0.8,
                        ),
                        desktop: ProductGridWidget(
                          childAspectRatio: size.width < 1400 ? 0.8 : 1.05,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                        text: 'Latest Orders',
                        color: color,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      OrdersList(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
