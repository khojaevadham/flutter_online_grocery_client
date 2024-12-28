import 'dart:io';

import 'package:dcgrocer/common/color_extension.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../../../same_widgets/round_button.dart';
import '../../../database/database.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  
  
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

   Future<void> _pickImage() async {    
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = image;
      });   
  }

    final TextEditingController _name= TextEditingController();
    final TextEditingController _surname = TextEditingController();
    final TextEditingController _phonenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
      
    var  media = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black26,
        surfaceTintColor: Colors.white,
        // leading:  IconButton(onPressed: (){Navigator.pop(context);}, icon:  Image.asset("assets/img/back.png", height: 20,width: 20,)),
        leading:  IconButton(
            onPressed: (){Navigator.pop(context);},
            icon:  Image.asset("assets/img/back_andr.png",
              height: 20,width: 20,)
         ),
        title: Text(
          "Мои данные",
          style: TextStyle(
              color: TColor.text,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: "Roboto-Regular",
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/img/background_images/back_dc.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Stack(
                     clipBehavior: Clip.none,
                       children: [
                         Container(
                           margin: EdgeInsets.only(top: 10, left: 20),
                           width: 90,
                           height: 90,
                            child: ClipOval(
                               child: _imageFile != null
                                ? Image.file(
                             File(_imageFile!.path),
                                 width: 90,
                                 height: 90,
                                 fit: BoxFit.cover,
                              )
                               : Container(
                                  width: 90,
                                  height: 90,
                                 color: const Color.fromRGBO(4, 107, 213, 0.2),
                                  child: Center(
                                   child: Text(
                                      "ББ",
                                    style: TextStyle(
                                      color: BColor.buttoncolor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                  ),
                ),
                      Positioned(
                        left: 85,
                        top: 60,
                        child: CircleAvatar(
                          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                          radius: 19,
                            child: IconButton(
                                icon: const Icon(
                              Icons.add_a_photo_outlined,
                              color: const Color.fromARGB(255, 5, 5, 5),
                            ),
                            onPressed: () {
                              _pickImage();
                            },
                    ),
                  ),
                ),
              ],
              )
             ],
            ),

            const SizedBox(height: 10),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                   child: Column(
                    children: [
                      TextField(
                    controller: _name,
                    decoration: InputDecoration(
                      labelText: "Имя",
                      labelStyle: TextStyle(color: BColor.textfiled),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: BColor.textfiled),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: BColor.textfiled),
                      ),
                    ),
                  ),
                     const SizedBox(height: 20),
                      TextField(
                    controller: _surname,
                    decoration: InputDecoration(
                      labelText: "Фамилия",
                      labelStyle: TextStyle(color: BColor.textfiled),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: BColor.textfiled),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: BColor.textfiled),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                    controller: _phonenumber,
                    decoration: InputDecoration(
                      labelText: "Номер телефона",
                      labelStyle: TextStyle(color: BColor.textfiled),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: BColor.textfiled),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: BColor.textfiled),
                      ),
                    ),
                        style: TextStyle(
                          // color: BColor.textfiled,
                          // fontWeight: FontWeight.w400,
                          // fontFamily: "Roboto",
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),

            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15),
               child: RoundButton(
              title: "Сохранить",
              onPressed: () async {
      // // Получите данные из текстовых полей
      // String name = _name.text;
      // String surname = _surname.text;
      // String phone = _phonenumber.text;

      // // Получите путь к изображению (если он есть)
      // String? imagePath;
      // if (_imageFile != null) {
      //   imagePath = _imageFile!.path;
      // }

      // // Сохраните данные в базе данных
      // final dbHelper = DatabaseHelper();
      // await dbHelper.insertUser(name, surname, phone, imagePath);

      // // Выполните дополнительные действия после сохранения, например, показать уведомление
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Данные сохранены!')),
      // );
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ],
      ),

    );
  }
}
