import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class OrderHistoryRow extends StatelessWidget {

  final String icon;
  final String title;
  final String status;
  final String price;
  final VoidCallback onPressed;

  const OrderHistoryRow({
    super.key, 
    required this.onPressed,
    required this.icon,
    required this.title,
    required this.status,
    required this.price
  });

  Color _getStatusColor(String status) {
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
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            margin: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            height: 80,
            decoration:  BoxDecoration(
              color: Colors.white,
              border: Border.all(color: BColor.white_cont, width: 1 ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset(icon,
                    width: 60,
                    height: 60 ,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style:  TextStyle(
                            color: TColor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        status,
                        style:  TextStyle(
                            color: _getStatusColor(status) ,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    price,
                    style: TextStyle(
                        color: TColor.blue_text,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
