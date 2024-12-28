import 'package:dcgrocer/same_widgets/appbar_title_text_style.dart';
import 'package:flutter/material.dart';

import '../../../common/color_extension.dart';
import '../../../common_widget/order_iteams_row.dart';
import '../../../same_widgets/round_button.dart';
import 'grade_view.dart';

class OrderDetalis extends StatefulWidget {
  final  Map eObj;
  const OrderDetalis({super.key, required this.eObj});

  @override
  State<OrderDetalis> createState() => _OrderDetalisState();
}

  Color _getStatusColor(status) {
  switch (status) {
    case 'В пути':
      return Colors.orange;
    case 'Доставлен':
      return Colors.green;
    case 'Отменен':
      return Colors.red;
    default:
      return Colors.grey;
  }
}


class _OrderDetalisState extends State<OrderDetalis> {

  List porduct_list = [
    {
      "name" : "Сок Добрый 1л",
      "icon" : "assets/img/products/dbry_1.png",
      "count" : "1 штука",
      "price" : "19 сомони",
      "subt" : "апельсин"
    },
    {
      "name" : "Сок Добрый 2л",
      "icon" : "assets/img/products/dobr_2.png",
      "count" : "1 штука",
      "price" : "35 сомони",
      "subt" : "мандарин"
    },
    {
      "name" : "Pepsi 1л",
      "icon" : "assets/img/products/pep_1.png",
      "count" : "1 штука",
      "price" : "8 сомони",
      "subt" : "без сахар"
    },
    {
      "name" : "Coca Cola 1л",
      "icon" : "assets/img/products/pep_0.5.png",
      "count" : "1 штука",
      "price" : "5 сомони",
      "subt" : "апельсин"
    },
    {
      "name" : "Сок Добрый 2л",
      "icon" : "assets/img/products/dobr_2.png",
      "count" : "1 штука",
      "price" : "35 сомони",
      "subt" : "апельсин"
    },
    {
      "name" : "Pepsi 1л",
      "icon" : "assets/img/products/pep_1.png",
      "count" : "1 штука",
      "price" : "8 сомони",
      "subt" : "апельсин"
    },
    {
      "name" : "Сок Добрый 1л",
      "icon" : "assets/img/products/dbry_1.png",
      "count" : "1 штука",
      "price" : "19 сомони",
      "subt" : "апельсин"
    },
    {
      "name" : "Pepsi 1л",
      "icon" : "assets/img/products/pep_1.png",
      "count" : "1 штука",
      "price" : "8 сомони",
      "subt" : "апельсин"
    },
    {
      "name" : "Сок Добрый 2л",
      "icon" : "assets/img/products/dobr_2.png",
      "count" : "1 штука",
      "price" : "35 сомони",
      "subt" : "апельсин"
    },
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.eObj['status'].toString() == "В пути") {
        _showChekno();
      } else {
        _showChek();
      }
    });
  }

  void _showChekno() async {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isDismissible: true,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),

              Text(
                'Заказ №00000062',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: TColor.primaryText,
                ),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Дата заказа',
                    style: TextStyle(
                      fontSize: 16,
                      color: TColor.secondaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.eObj['datetime'].toString(),
                    style: TextStyle( fontSize: 16, color: TColor.primaryText, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Товаров',
                    style: TextStyle(
                      fontSize: 16,
                      color: TColor.secondaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '8',
                    style: TextStyle( fontSize: 16,
                        color: TColor.primaryText, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Адрес',
                    style: TextStyle(
                      fontSize: 16,
                      color: TColor.secondaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'г. Душанбе, ул. Рудаки 25',
                    style: TextStyle(
                        fontSize: 16,
                        color: TColor.primaryText,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Итоговая сумма',
                    style: TextStyle(
                      fontSize: 16,
                      color: TColor.secondaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                     widget.eObj['price'],
                    style: TextStyle(
                      fontSize: 16,
                      color: TColor.blue_text,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              RoundButton(title: "Подтвердить получение", onPressed: (){showRatingDialog(context);}),
              // const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  void _showChek() async {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isDismissible: true,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),

              Text(
                'Заказ №00000062',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: TColor.primaryText,
                ),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Дата заказа',
                    style: TextStyle(
                      fontSize: 16,
                      color: TColor.secondaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.eObj['datetime'].toString(),
                    style: TextStyle( fontSize: 16, color: TColor.primaryText, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Товаров',
                    style: TextStyle(
                      fontSize: 16,
                      color: TColor.secondaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '8',
                    style: TextStyle( fontSize: 16, color: TColor.primaryText, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Адрес',
                    style: TextStyle(
                      fontSize: 16,
                      color: TColor.secondaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'г. Душанбе, ул. Рудаки 25',
                    style: TextStyle(
                        fontSize: 16, color: TColor.primaryText, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Итоговая сумма',
                    style: TextStyle(
                        fontSize: 16,
                        color: TColor.secondaryText,
                        fontWeight: FontWeight.w500,
                      ),
                  ),
                  Text(
                    widget.eObj['price'],
                    style: TextStyle(
                      fontSize: 16,
                      color: TColor.blue_text,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              RoundButton(title: "Повторить заказ", onPressed: (){}),
              // const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  void showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GradeView();
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/background_images/back_dc.png"),
                  fit: BoxFit.cover
              )
          ),

          child: Column(
            children: [

              Container(
                height: 100,
                decoration:  const BoxDecoration(
                  color:  Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 5),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Image.asset(
                              "assets/img/back_andr.png",
                              height: 20,
                              width: 20,
                            ),
                          ),
                         const Expanded(
                            child: Center(
                              child:  AppbarTitleText(
                                  text: "Список покупок"
                              )
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/img/icons/detalis.png",
                              height: 30,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Text(
                            widget.eObj['datetime'].toString(),
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            widget.eObj['status'].toString(),
                            style: TextStyle(
                              color: _getStatusColor(widget.eObj['status'].toString()),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: porduct_list.length,
                          itemBuilder: (context, index) {
                            Map pObj = porduct_list[index] as Map? ?? {};
                            return OrderIteamsRow(
                              pObj: pObj,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
