import 'package:flutter/material.dart';
import 'package:invoice_generator/globels.dart';

class Client_Page extends StatefulWidget {
  const Client_Page({Key? key}) : super(key: key);

  @override
  State<Client_Page> createState() => _Client_PageState();
}

class _Client_PageState extends State<Client_Page> {
  GlobalKey<FormState> clientdetailskey = GlobalKey<FormState>();

  TextEditingController clientnamecontroller = TextEditingController();
  TextEditingController clientaddresscontroller = TextEditingController();
  TextEditingController clientpincodecontroller = TextEditingController();
  TextEditingController clientcitycontroller = TextEditingController();
  TextEditingController clientphonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _hight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Client Details"),
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
            key: clientdetailskey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Company name================
                  const Text(
                    "Client Name",
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  TextFormField(
                    controller: clientnamecontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Client Name...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        Globel.clientname = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Client Name",
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
                    controller: clientaddresscontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Address First...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        Globel.clientaddress1 = val;
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
                    controller: clientpincodecontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Pincode...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        Globel.clientpincode = val;
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
                    controller: clientcitycontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter City...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        Globel.clientcity = val;
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
                    controller: clientphonecontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter PhoneNumber...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        Globel.clientphone = val;
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
                            if (clientdetailskey.currentState!.validate()) {
                              clientdetailskey.currentState!.save();
                            }
                          },
                          child: const Text("SAVE")),
                      ElevatedButton(
                          onPressed: () {
                            clientdetailskey.currentState!.reset();

                            clientnamecontroller.clear();
                            clientaddresscontroller.clear();
                            clientpincodecontroller.clear();
                            clientcitycontroller.clear();
                            clientphonecontroller.clear();

                            setState(() {
                              Globel.clientname = "";
                              Globel.clientaddress1 = "";
                              Globel.clientpincode = "";
                              Globel.clientcity = "";
                              Globel.clientphone = "";
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
