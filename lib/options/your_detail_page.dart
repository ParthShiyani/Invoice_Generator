import 'package:flutter/material.dart';
import 'package:invoice_generator/globels.dart';

class your_Detail extends StatefulWidget {
  const your_Detail({Key? key}) : super(key: key);

  @override
  State<your_Detail> createState() => _your_DetailState();
}

class _your_DetailState extends State<your_Detail> {
  GlobalKey<FormState> yourdetailskey = GlobalKey<FormState>();

  TextEditingController companynamecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController pincodecontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Your Details"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(25),
        height: 620,
        width: _width,
        color: Colors.grey,
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Form(
            key: yourdetailskey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Company name================
                  const Text(
                    "Company Name",
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  TextFormField(
                    controller: companynamecontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Company Name...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        Globel.companyname = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Company Name",
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
                  //Address==================
                  const SizedBox(
                    height: 9,
                  ),
                  const Text(
                    "Address",
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  TextFormField(
                    controller: addresscontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Address First...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        Globel.address1 = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintMaxLines: 4,
                      hintText: "Street/village/Building",
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
                  //Pincode=======================
                  const SizedBox(
                    height: 9,
                  ),
                  const Text(
                    "Pincode",
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
                    controller: pincodecontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Pincode...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        Globel.pincode = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintMaxLines: 4,
                      hintText: "395010",
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
                  //City=======================
                  const SizedBox(
                    height: 9,
                  ),
                  const Text(
                    "City",
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  TextFormField(
                    controller: citycontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter City...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        Globel.city = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintMaxLines: 4,
                      hintText: "Surat",
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
                  //Phone=======================
                  const SizedBox(
                    height: 9,
                  ),
                  const Text(
                    "Phone Number",
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
                    controller: phonecontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter PhoneNumber...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        Globel.phone = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintMaxLines: 4,
                      hintText: "Mobile number",
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
                            if (yourdetailskey.currentState!.validate()) {
                              yourdetailskey.currentState!.save();
                            }
                          },
                          child: const Text("SAVE")),
                      ElevatedButton(
                          onPressed: () {
                            yourdetailskey.currentState!.reset();

                            companynamecontroller.clear();
                            addresscontroller.clear();
                            pincodecontroller.clear();
                            citycontroller.clear();
                            phonecontroller.clear();

                            setState(() {
                              Globel.companyname = "";
                              Globel.address1 = "";
                              Globel.pincode = "";
                              Globel.city = "";
                              Globel.phone = "";
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
