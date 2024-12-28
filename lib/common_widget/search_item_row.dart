import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/color_extension.dart';

    class SearchItemRow extends StatelessWidget {

      final Map sObj;

      const SearchItemRow({
        super.key,
        required this.sObj,
      });

      @override
      Widget build(BuildContext context) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5,),
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 7),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: BColor.list_button_border , width: 1),
            borderRadius: BorderRadius.circular(19),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    sObj['icon'],
                    width: 50,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                                sObj['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: TColor.primaryText,
                                  fontSize: 14,
                                ),
                              ),

                            Padding(
                                padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                 sObj["icon2"] ?? "",
                                // "assets/img/icons/galochka.svg",
                                width: 20,
                                height: 20,

                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text(
                          sObj['description'],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: TColor.secondaryText,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  const Spacer(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${sObj['price']}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: TColor.blue_text,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        sObj['bonus'] ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: BColor.ball_cont,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 5,),
                ],
              ),
            ],
          ),
        );
      }
    }
