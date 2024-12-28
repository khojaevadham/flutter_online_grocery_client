

import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/accaunt_row.dart';
import '../../common_widget/add_number.dart';
import 'logut_dialog.dart';


class AccountView extends StatefulWidget {
const AccountView({super.key});

@override
State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
// final splashVM = Get.find<SplashViewModel>();

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

              InkWell(
                onTap: (){Navigator.pushNamed(context, 'my_profile');},
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                  ),
                  child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                         ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                            child: Image.asset(
                              "assets/img/logotips/men.png",
                               width: 60,
                               height: 60,
                             ),
                          ),
                      const SizedBox(
                      width: 15,
                      ),
                          Column(
                            children: [
                              Text(
                                  "Фаридун Алиев",
                                style: TextStyle(
                                  fontFamily: "Roboto-SemiBold",
                                  color: TColor.primaryText,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              Text(
                                "+992 888 777 788",
                                style: TextStyle(
                                    color: TColor.secondaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                ),
                              )
                            ],
                          ),

                      ],
                    ),
                  ),
                ),
              ),

            //   const Divider(
            // color: Colors.black26,
            // height: 1,
            // ),

            AccountRow(
            title: "История заказов",
            icon: "assets/img/icons/history_icon.png",
            onPressed: () {Navigator.pushNamed(context, "order_history");},
            ),

            AccountRow(
            title: "Доп. номер телефона",
            icon:"assets/img/icons/phone_icon.png",
            onPressed: () {phone_number();},
            ),

              AccountRow(
                title: "История чатов",
                icon: "assets/img/icons/history_icon.png",
                onPressed: () {Navigator.pushNamed(context, "chat_history");},
              ),

            AccountRow(
            title: "Адреса",
              icon:"assets/img/icons/location_icon.png",
            onPressed: () {Navigator.pushNamed(context, "location");},
            ),

            AccountRow(
            title: "Условия использования",
              icon:"assets/img/icons/listdoc_icon.png",
            onPressed: () {},
            ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: BColor.white_cont, width: 1 ),
                        borderRadius: BorderRadius.circular(19),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          DialogExit();
                        },
                        height: 60,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                        minWidth: double.maxFinite,
                        elevation: 0.1,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.exit_to_app_rounded,
                              size: 30,
                              color: TColor.blue_text,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Выход",
                              style: TextStyle(
                                color: TColor.blue_text,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        )),

    );
  }

  void  DialogExit() {
  showDialog(
    context: context,
    builder: (context) => const Exitdialog(),
  );
  }

  void  phone_number() {
  showDialog(
    context: context,
      builder: (context) =>   AddNumber(),
    );
  }

  }

