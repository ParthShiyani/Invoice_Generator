import 'package:flutter/material.dart';
import 'package:invoice_generator/globels.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  List<Row> allitemtextFilds = [];
  List<Row> allqtytextFilds = [];
  List<Row> allratetextFilds = [];
  List<TextEditingController> allitemcontrollers = <TextEditingController>[];
  List<TextEditingController> allqtycontrollers = <TextEditingController>[];
  List<TextEditingController> allratecontrollers = <TextEditingController>[];
  @override
  void initState() {
    super.initState();
    allitemcontrollers.add(TextEditingController());
    allqtycontrollers.add(TextEditingController());
    allratecontrollers.add(TextEditingController());

    allitemtextFilds.add(gettextfield(i: 0, row: Row()));
    allqtytextFilds.add(gettextfield(i: 0, row: Row()));
    allratetextFilds.add(gettextfield(i: 0, row: Row()));
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Items"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Globel.initalDropdownVal = null;
              Globel.allitems.clear();
              Globel.allqty.clear();
              Globel.allrate.clear();
              Globel.amount.clear();
              Globel.subtotal = 0;
              Globel.total = 0;
              Globel.gst = 0;
              setState(() {
                allitemtextFilds.clear();
                allqtytextFilds.clear();
                allratetextFilds.clear();

                allitemcontrollers.clear();
                allqtycontrollers.clear();
                allratecontrollers.clear();
              });
            },
            icon: const Icon(Icons.delete_forever),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child: DropdownButton(
                value: Globel.initalDropdownVal,
                hint: Text("Select Gst"),
                onChanged: (val) {
                  setState(() {
                    Globel.initalDropdownVal = val;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: 0,
                    child: Text("0%"),
                  ),
                  DropdownMenuItem(
                    value: 5,
                    child: Text("5%"),
                  ),
                  DropdownMenuItem(
                    value: 12,
                    child: Text("12%"),
                  ),
                  DropdownMenuItem(
                    value: 18,
                    child: Text("18%"),
                  ),
                  DropdownMenuItem(
                    value: 28,
                    child: Text("28%"),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: Container(
              height: _height,
              width: _width,
              color: Colors.grey.shade300,
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(15),
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "Enter Items",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          ...allitemtextFilds
                              .map((a) => gettextfield(
                                  i: allitemtextFilds.indexOf(a), row: a))
                              .toList(),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        width: _width,
                        child: OutlinedButton(
                          child: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              allitemcontrollers.add(TextEditingController());
                              allqtycontrollers.add(TextEditingController());
                              allratecontrollers.add(TextEditingController());

                              allitemtextFilds.add(gettextfield(
                                  i: allitemtextFilds.length, row: Row()));
                              allqtytextFilds.add(gettextfield(
                                  i: allqtytextFilds.length, row: Row()));
                              allratetextFilds.add(gettextfield(
                                  i: allratetextFilds.length, row: Row()));
                            });
                          },
                        ),
                      ),
                      Text("${Globel.allitems}"),
                      Text("${Globel.allqty}"),
                      Text("${Globel.allrate}"),
                      ElevatedButton(
                        child: const Text("SAVE"),
                        onPressed: () {
                          setState(() {
                            allitemcontrollers
                                .map((e) => Globel.allitems.add(e.text))
                                .toList();
                            allqtycontrollers
                                .map(
                                    (b) => Globel.allqty.add(int.parse(b.text)))
                                .toList();
                            allratecontrollers
                                .map((c) =>
                                    Globel.allrate.add(int.parse(c.text)))
                                .toList();
                            Globel.allqty.forEach((e) => Globel.amount.add(e *
                                Globel.allrate
                                    .elementAt(Globel.allqty.indexOf(e))));
                            for (int i = 0; i < Globel.amount.length; i++) {
                              Globel.subtotal += Globel.amount[i];
                            }
                            Globel.gst = Globel.subtotal *
                                Globel.initalDropdownVal /
                                100;
                            Globel.total = Globel.subtotal + Globel.gst;
                          });
                        },
                      ),
                      // Text("${Globel.amount}"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row gettextfield({required int i, required Row row}) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          height: 50,
          width: 150,
          child: TextField(
            controller: allitemcontrollers[i],
            decoration: InputDecoration(
              hintText: "Item name",
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
        ),
        Container(
          margin: const EdgeInsets.only(right: 5, top: 5, bottom: 5),
          height: 50,
          width: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: allqtycontrollers[i],
            decoration: InputDecoration(
              hintText: "Qty",
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
        ),
        SizedBox(
          height: 50,
          width: 79,
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: allratecontrollers[i],
            decoration: InputDecoration(
              hintText: "rate",
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
        )
      ],
    );
  }
}
