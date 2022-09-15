import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        'id': 1,
        'icon': const Icon(Icons.add_photo_alternate_outlined),
        'title': "Company logo",
        'subtitle': "add logo",
        'trailing1': const Icon(Icons.arrow_forward_ios),
        'trailing2': const Icon(Icons.check_circle),
        'route': "company_logo",
      },
      {
        'id': 2,
        'icon': const Icon(Icons.details_outlined),
        'title': "Invoice details",
        'subtitle': "add details",
        'trailing1': const Icon(Icons.arrow_forward_ios),
        'trailing2': const Icon(Icons.check_circle),
        'route': "invoice_detail",
      },
      {
        'id': 3,
        'icon': const Icon(Icons.business),
        'title': "Your details",
        'subtitle': "add your business details",
        'trailing1': const Icon(Icons.arrow_forward_ios),
        'trailing2': const Icon(Icons.check_circle),
        'route': "your_detail",
      },
      {
        'id': 4,
        'icon': const Icon(Icons.person_add),
        'title': "Client Detail",
        "subtitle": "add payer",
        "trailing1": const Icon(Icons.arrow_forward_ios),
        "trailing2": const Icon(Icons.check_circle),
        'route': "client",
      },
      {
        'id': 5,
        'icon': const Icon(Icons.shopping_bag_rounded),
        'title': "Items",
        'subtitle': "add your items",
        "trailing1": const Icon(Icons.arrow_forward_ios),
        "trailing2": const Icon(Icons.check_circle),
        'route': "items"
      },
    ];
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
            context: context,
            builder: (Context) {
              return AlertDialog(
                title: Text("Confirm exit"),
                content: Text("Are you sure you want to exit..?"),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text("Yes"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text("No"),
                  ),
                ],
              );
            });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Invoice Generator"),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                color: Colors.grey,
                child: Column(
                  children: data
                      .map(
                        (e) => Card(
                          elevation: 3,
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed(e['route']);
                            },
                            leading: e['icon'],
                            title: Text("${e['title']}"),
                            subtitle: Text("${e['subtitle']}"),
                            trailing: e['trailing1'],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                height: 30,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('pdf');
                  },
                  child: Text(
                    "Preview OR Download",
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
