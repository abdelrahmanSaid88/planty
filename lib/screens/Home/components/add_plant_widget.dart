import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planty/components/appbar_text_style.dart';
import 'package:planty/components/my_theme_colors.dart';
import 'package:planty/screens/Profile/profile_picture.dart';

class AddPlantWidget extends StatefulWidget {
  const AddPlantWidget({Key? key}) : super(key: key);

  @override
  State<AddPlantWidget> createState() => _AddPlantWidgetState();
}

class _AddPlantWidgetState extends State<AddPlantWidget> {
  var formKey = GlobalKey<FormState>();
  String title = '';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyThemeColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Add New Plant',
              textAlign: TextAlign.center,
              style: appBarStyle(MyThemeColors.mainDarkGreen)),
          const ProfilePicture(),
          Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    decoration:  InputDecoration(labelText: 'Enter Plant Name ',labelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              color: MyThemeColors.mainDarkGreen,
            ), ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter plant name";
                      }
                      return null;
                    },
                    onChanged: (newValue) {
                      title = newValue;
                    },
                  ),
                ),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Select Date',style: TextStyle(
              fontWeight: FontWeight.normal,
              color: MyThemeColors.mainDarkGreen,
            ),),
          ),
          InkWell(
            onTap: () {
              showCalendar();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: MyThemeColors.darkGreen,)
              ),
            ),
          ),
          ElevatedButton(onPressed: addPlant, child: Text('Add Plant'))
        ],
      ),
    );
  }
  void addPlant() {
    if (formKey.currentState!.validate() == true) {
      // add todo
      addTodoToFirebase(title, selectedDate).then((value) {
        Navigator.pop(context);
      }).onError((error, stackTrace) {
        print(error.toString());
      }).timeout(Duration(seconds: 30), onTimeout: () {
        print('timeout');
      });
    }
  }
  void showCalendar() async {
    var newSelectedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (newSelectedDate != null) {
      selectedDate = newSelectedDate;
      setState(() {});
    }
  }

  addTodoToFirebase(String title, DateTime selectedDate) {}
}

void Pressed() {}
