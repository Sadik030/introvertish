import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:introvertish/screens/manage_profileScreen/CustomWidgets/titleTextfield_container.dart';
import 'package:introvertish/styles.dart';

class AddSupervisionAccount extends StatefulWidget {
  AddSupervisionAccount({super.key});

  @override
  State<AddSupervisionAccount> createState() => _AddSupervisionAccountState();
}

class _AddSupervisionAccountState extends State<AddSupervisionAccount> {
  String? selectedValue;

  List<String> dropdownItems = ['Dougther', 'Son'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //Icon(Icons.arrow_back),
        title: Text(
          "Add Account",
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add Account Under my Supervision"),
            SizedBox(
              height: 10,
            ),
            Text("Relation to you"),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              hint: const Text(
                'Select',
                style: TextStyle(fontSize: 14),
              ),
              items: dropdownItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Select';
                }
                return null;
              },
              onChanged: (value) {
                //Do something when selected item is changed.
              },
              onSaved: (value) {
                selectedValue = value.toString();
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.only(right: 8),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 24,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TitleTextfildContainer(
              title: 'Mobile',
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    "Save",
                    style: TextStyles.title1,
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
