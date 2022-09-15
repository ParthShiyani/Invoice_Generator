import 'dart:math';

import 'package:flutter/material.dart';
import 'package:invoice_generator/globels.dart';

class Invoice_Detail extends StatefulWidget {
  const Invoice_Detail({Key? key}) : super(key: key);

  @override
  State<Invoice_Detail> createState() => _Invoice_DetailState();
}

class _Invoice_DetailState extends State<Invoice_Detail> {
  int? ans;
  Random r1 = Random();
  GlobalKey<FormState> invoicedetailkey = GlobalKey<FormState>();

  TextEditingController invoicedatecontroller = TextEditingController();
  TextEditingController invoiceduedatecontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    ans = r1.nextInt(999999);
    // Globel.invoicenumber =ans.toString();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Invoice Details"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(25),
        height: 430,
        width: _width,
        color: Colors.grey,
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Form(
            key: invoicedetailkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Invoice num================
                  const Text(
                    "Invoice no.",
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Text("\t\t${ans}"),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  //Invoice date==================
                  const SizedBox(
                    height: 9,
                  ),
                  const Text(
                    "Invoice Date",
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: invoicedatecontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter invoice Date...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        Globel.invoicedate = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintMaxLines: 4,
                      hintText: "DD/MM/YY",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  //Due Date=======================
                  const SizedBox(
                    height: 9,
                  ),
                  const Text(
                    "Due Date",
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: invoiceduedatecontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter due date...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        Globel.invoiceduedate = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintMaxLines: 4,
                      hintText: "DD/MM/YY",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (invoicedetailkey.currentState!.validate()) {
                              invoicedetailkey.currentState!.save();
                            }
                            setState(() {
                              Globel.invoicenumber = ans.toString();
                            });
                          },
                          child: const Text("SAVE")),
                      ElevatedButton(
                          onPressed: () {
                            invoicedetailkey.currentState!.reset();
                            invoicedatecontroller.clear();
                            invoiceduedatecontroller.clear();

                            setState(() {
                              Globel.invoicenumber = "";
                              Globel.invoicedate = "";
                              Globel.invoiceduedate = "";
                            });
                          },
                          child: const Text("CLEAR")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
