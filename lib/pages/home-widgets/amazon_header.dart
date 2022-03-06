import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/theme.dart';





class AmazonHeader extends StatelessWidget {
  const AmazonHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Amazonn".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make()
      ],
    );
  }
}