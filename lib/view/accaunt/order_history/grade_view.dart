import 'package:flutter/material.dart';

import '../../../common/color_extension.dart';

class GradeView extends StatefulWidget {
  @override
  _GradeViewState createState() => _GradeViewState();
}

class _GradeViewState extends State<GradeView> {
  int _selectedStars = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           const Text(
              'Оцените нас',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Оцените наш сервис, чтобы мы стали лучше',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: TColor.secondaryText,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  padding: const EdgeInsets.all(5),
                  icon: Icon(
                    index < _selectedStars
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.orange,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedStars = index + 1;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: BColor.buttoncolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Padding(
                padding:  EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 30.0),
                child: Text(
                  'Оценить',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

