import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trade_volume/widget/double_input_container.dart';
import 'package:trade_volume/widget/parana_dialog.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  MyWidgetState createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  TextEditingController doubleEntryController = TextEditingController();
  TextEditingController doubleStoplostController = TextEditingController();
  TextEditingController doubleUSDLostController = TextEditingController();

  ParanaDialog paranaDialog = ParanaDialog();

  String nameInputEntry = "Nhập giá Entry";
  String nameInputStoplost = "Nhập giá StopLost";
  String nameInputUSDLost = "Nhập USD lỗ nếu thua";
  double khoiLuongViThe = 0.0;
  double giaEntry = 1.0;
  double giaSL = 1.0;
  double usdLo = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Trade Volume Crypto',
              style: GoogleFonts.montserrat(),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DoubleInputContainer(
              controller: doubleEntryController,
              nameInput: nameInputEntry,
            ),
            DoubleInputContainer(
              controller: doubleStoplostController,
              nameInput: nameInputStoplost,
            ),
            DoubleInputContainer(
              controller: doubleUSDLostController,
              nameInput: nameInputUSDLost,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              onPressed: () {
                giaEntry = double.parse(doubleEntryController.text);

                giaSL = double.parse(doubleStoplostController.text);

                usdLo = double.parse(doubleUSDLostController.text);

                if (giaEntry >= giaSL) {
                  khoiLuongViThe = usdLo / (giaSL * (1 / giaSL - 1 / giaEntry));
                } else {
                  khoiLuongViThe =
                      usdLo / (giaSL * (1 / giaSL - 1 / giaEntry)) * (-1);
                }

                paranaDialog.show(
                    context, "Hãy thật cẩn thận khi giao dịch", khoiLuongViThe);
              },
              child: Text(
                'Caculation',
                style:
                    GoogleFonts.montserrat(fontSize: 25, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
