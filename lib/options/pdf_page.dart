import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:invoice_generator/globels.dart';

class Pdf_Page extends StatefulWidget {
  const Pdf_Page({Key? key}) : super(key: key);

  @override
  State<Pdf_Page> createState() => _Pdf_PageState();
}

class _Pdf_PageState extends State<Pdf_Page> {
  final invoicepdf = pw.Document();
  final imageo = pw.MemoryImage(
    File(Globel.image!.path).readAsBytesSync(),
  );
  TextStyle title = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );
  TextStyle subtitle = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Colors.blueGrey,
  );
  TextStyle mystyle2 = const TextStyle(fontSize: 13, color: Colors.black87);
  Divider mydivider = const Divider(
    thickness: 1,
    color: Colors.black,
  );

  @override
  void initState() {
    super.initState();
    invoicepdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            var title = pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
                decoration: pw.TextDecoration.underline,
                decorationThickness: 2);
            var subtitle = pw.TextStyle(
              fontSize: 16,
            );
            var invoice = const pw.TextStyle(
              fontSize: 32,
            );
            var mystyle2 = const pw.TextStyle(
              fontSize: 15,
            );
            return pw.Container(
              height: double.infinity,
              width: double.infinity,
              margin: pw.EdgeInsets.all(20),
              alignment: pw.Alignment.topLeft,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Container(
                            height: 80,
                            width: 100,
                            child: pw.Image(imageo),
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Text(
                            "${Globel.companyname}",
                            style: mystyle2,
                          ),
                          pw.Text(
                            "${Globel.address1}",
                            style: mystyle2,
                          ),
                          pw.Text(
                            "${Globel.pincode}",
                            style: mystyle2,
                          ),
                          pw.Text(
                            "${Globel.city}",
                            style: mystyle2,
                          ),
                          pw.Text(
                            "${Globel.phone}",
                            style: mystyle2,
                          ),
                        ],
                      ),
                      //invoice details ==============
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                          pw.Text(
                            "Invoice",
                            style: invoice,
                          ),
                          pw.SizedBox(
                            height: 15,
                          ),
                          pw.Text(
                            "INVOICE NO.",
                            style: subtitle,
                          ),
                          pw.Text(
                            " ${Globel.invoicenumber}",
                            style: mystyle2,
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Text(
                            "INVOICE DATE.",
                            style: subtitle,
                          ),
                          pw.Text(
                            " ${Globel.invoicedate}",
                            style: mystyle2,
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Text(
                            "DUE DATE.",
                            style: subtitle,
                          ),
                          pw.Text(
                            " ${Globel.invoiceduedate}",
                            style: mystyle2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  //================================================
                  pw.Divider(
                    thickness: 1,
                  ),
                  //client details================
                  pw.Text(
                    "RECIPIENT",
                    style: title,
                  ),
                  pw.SizedBox(
                    height: 15,
                  ),
                  pw.Text(
                    " ${Globel.clientname}",
                    style: mystyle2,
                  ),
                  pw.Text(
                    " ${Globel.clientaddress1}",
                    style: mystyle2,
                  ),
                  pw.Text(
                    "${Globel.clientpincode}",
                    style: mystyle2,
                  ),
                  pw.Text(
                    "${Globel.clientcity}",
                    style: mystyle2,
                  ),
                  pw.Text(
                    "${Globel.clientphone}",
                    style: mystyle2,
                  ),
                  // ==========================================
                  pw.Divider(
                    thickness: 1,
                  ),
                  //Description================
                  pw.Row(
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "DESCRIPTION",
                            style: subtitle,
                          ),
                          pw.SizedBox(
                            width: 170,
                            child: pw.Divider(
                              thickness: 1,
                            ),
                          ),
                          ...Globel.allitems.map((e) => pw.Text(e)).toList(),
                          pw.SizedBox(
                            width: 170,
                            child: pw.Divider(
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "QUNTITY",
                            style: subtitle,
                          ),
                          pw.SizedBox(
                            width: 100,
                            child: pw.Divider(
                              thickness: 1,
                            ),
                          ),
                          ...Globel.allqty.map((e) => pw.Text("${e}")).toList(),
                          pw.SizedBox(
                            width: 100,
                            child: pw.Divider(
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "RATE",
                            style: subtitle,
                          ),
                          pw.SizedBox(
                            width: 80,
                            child: pw.Divider(
                              thickness: 1,
                            ),
                          ),
                          ...Globel.allrate
                              .map((e) => pw.Text("${e}"))
                              .toList(),
                          pw.SizedBox(
                            width: 80,
                            child: pw.Divider(
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "AMOUNT",
                            style: subtitle,
                          ),
                          pw.SizedBox(
                            width: 92,
                            child: pw.Divider(
                              thickness: 1,
                            ),
                          ),
                          ...Globel.amount.map((e) => pw.Text("${e}")).toList(),
                          pw.SizedBox(
                            width: 92,
                            child: pw.Divider(
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.Transform.translate(
                    offset: PdfPoint(170, 0),
                    child: pw.Column(
                      children: [
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.Text(
                              "SUBTOTAL: ",
                              style: subtitle,
                            ),
                            pw.SizedBox(
                              width: 85,
                            ),
                            pw.Text("Rs.${Globel.subtotal}"),
                          ],
                        ),
                        pw.Divider(
                          thickness: 1,
                          endIndent: 170,
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.Text(
                              "GST: ",
                              style: subtitle,
                            ),
                            pw.SizedBox(
                              width: 135,
                            ),
                            pw.Text(
                                "${Globel.initalDropdownVal}% (Rs.${Globel.gst.toInt()})"),
                          ],
                        ),
                        pw.Divider(
                          thickness: 1,
                          endIndent: 170,
                          // color: Colors.black,
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.Text(
                              "TOTAL: ",
                              style: subtitle,
                            ),
                            pw.SizedBox(
                              width: 119,
                            ),
                            pw.Text("Rs.${Globel.total.toInt()}"),
                          ],
                        ),
                        pw.Divider(
                          thickness: 1,
                          endIndent: 170,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                Directory? tempDir = await getApplicationDocumentsDirectory();

                File file = File(
                    '${tempDir.path}/invoice_No.${Globel.invoicenumber!}.pdf');

                print(file);

                await file.writeAsBytes(await invoicepdf.save());
              },
              icon: const Icon(Icons.save_alt)),
          IconButton(
              onPressed: () async {
                // Uint8List bytes = await invoicepdf.save();

                await Printing.layoutPdf(
                    onLayout: (format) async => invoicepdf.save());
              },
              icon: const Icon(Icons.print)),
        ],
      ),
      body: Container(
        height: hight,
        width: width,
        margin: const EdgeInsets.all(20),
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //logo & Company details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: (Globel.image != null)
                          ? FileImage(Globel.image!)
                          : null,
                      backgroundColor: Colors.grey,
                      radius: 40,
                      child: Text(
                        (Globel.image != null) ? "" : "No image to show",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${Globel.companyname}",
                      style: mystyle2,
                    ),
                    Text(
                      "${Globel.address1}",
                      style: mystyle2,
                    ),
                    Text(
                      "${Globel.pincode}",
                      style: mystyle2,
                    ),
                    Text(
                      "${Globel.city}",
                      style: mystyle2,
                    ),
                    Text(
                      "Mo:- ${Globel.phone}",
                      style: mystyle2,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 80,
                ),
                //Invoice details==============
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Invoice",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "INVOICE NO.",
                          style: subtitle,
                        ),
                        Text(
                          " ${Globel.invoicenumber}",
                          style: mystyle2,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "INVOICE DATE",
                          style: subtitle,
                        ),
                        Text(
                          "${Globel.invoicedate}",
                          style: mystyle2,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "DUE DATE",
                          style: subtitle,
                        ),
                        Text(
                          "${Globel.invoiceduedate}",
                          style: mystyle2,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "RECIPIENT",
                  style: title,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${Globel.clientname}",
                  style: mystyle2,
                ),
                Text(
                  "${Globel.clientaddress1}",
                  style: mystyle2,
                ),
                Text(
                  "${Globel.clientpincode}",
                  style: mystyle2,
                ),
                Text(
                  "${Globel.clientcity}",
                  style: mystyle2,
                ),
                Text(
                  "Mo:- ${Globel.clientphone}",
                  style: mystyle2,
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "DESCRIPTION",
                      style: subtitle,
                    ),
                    SizedBox(
                      width: 120,
                      child: mydivider,
                    ),
                    ...Globel.allitems.map((e) => Text(e)).toList(),
                    SizedBox(
                      width: 120,
                      child: mydivider,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "QUNTITY",
                      style: subtitle,
                    ),
                    SizedBox(
                      width: 70,
                      child: mydivider,
                    ),
                    ...Globel.allqty.map((e) => Text("${e}")).toList(),
                    SizedBox(
                      width: 70,
                      child: mydivider,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "RATE",
                      style: subtitle,
                    ),
                    SizedBox(
                      width: 50,
                      child: mydivider,
                    ),
                    ...Globel.allrate.map((e) => Text("${e}")).toList(),
                    SizedBox(
                      width: 50,
                      child: mydivider,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "AMOUNT",
                      style: subtitle,
                    ),
                    SizedBox(
                      width: 80,
                      child: mydivider,
                    ),
                    ...Globel.amount.map((e) => Text("${e}")).toList(),
                    SizedBox(
                      width: 80,
                      child: mydivider,
                    ),
                  ],
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(120, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "SUBTOTAL: ",
                        style: subtitle,
                      ),
                      const SizedBox(
                        width: 55,
                      ),
                      Text("₹ ${Globel.subtotal}"),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    endIndent: 120,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "GST: ",
                        style: subtitle,
                      ),
                      const SizedBox(
                        width: 89,
                      ),
                      Text(
                          "${Globel.initalDropdownVal}% (₹ ${Globel.gst.toInt()})"),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    endIndent: 120,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "TOTAL: ",
                        style: subtitle,
                      ),
                      const SizedBox(
                        width: 76,
                      ),
                      Text("₹ ${Globel.total}"),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    endIndent: 120,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
