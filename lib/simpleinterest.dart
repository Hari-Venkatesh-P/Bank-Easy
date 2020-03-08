import 'package:flutter/material.dart';

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIForm();
  }
}

class _SIForm extends State<SIForm> {
  var _formKey = GlobalKey<FormState>();
  var types = ['Dollars', 'Rupees', 'Pounds'];
  double minvalue = 5;
  TextEditingController pcontroller = TextEditingController();
  TextEditingController icontroller = TextEditingController();
  TextEditingController tcontroller = TextEditingController();
  double si = 0.0;
  String display = "";
  String result = "";
  String curDropDownListItem = "Rupees";

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Simple Interest Calculator"),
        ),
        body: Form(
            key: _formKey,
            child: Padding(
                //margin: EdgeInsets.all(minvalue * 8),
                padding: EdgeInsets.all(minvalue * 2),
                child: ListView(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          top: minvalue * 2, bottom: minvalue * 2),
                      child: ImageAsset()),
                  Padding(
                      padding: EdgeInsets.only(
                          top: minvalue * 2, bottom: minvalue * 2),
                      child: TextFormField(
                        style: textStyle,
                        controller: pcontroller,
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please enter Principal amount";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Principal",
                            labelText: "Enter Principal Amount",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: minvalue * 2, bottom: minvalue * 2),
                      child: TextFormField(
                        style: textStyle,
                        controller: icontroller,
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please enter interest rate";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Rate Of Interest",
                            labelText: "Enter Interest",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: minvalue * 2, bottom: minvalue * 2),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: textStyle,
                            controller: tcontroller,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please enter terms";
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Terms",
                                labelText: "Enter Term",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                          )),
                          Container(width: minvalue * 4),
                          Expanded(
                              child: DropdownButton<String>(
                            items: types.map((String dropDownListItem) {
                              return DropdownMenuItem(
                                  value: dropDownListItem,
                                  child: Text(dropDownListItem));
                            }).toList(),
                            onChanged: (String userDropDownListItem) {
                              setState(() {
                                curDropDownListItem = userDropDownListItem;
                              });
                            },
                            value: curDropDownListItem,
                          ))
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        top: minvalue * 2, bottom: minvalue * 2),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: RaisedButton(
                          color: Colors.deepPurpleAccent,
                          child: Text("Calculate"),
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState.validate()) {
                                this.display = doCalculation();
                              }
                            });
                          },
                        )),
                        Container(width: minvalue * 4),
                        Expanded(
                            child: RaisedButton(
                          color: Colors.black12,
                          child: Text("Reset"),
                          onPressed: () {
                            setState(() {
                              doClear();
                            });
                          },
                        )),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: minvalue * 2, bottom: minvalue * 2),
                      child: Text(this.display, style: textStyle))
                ]))));
  }

  String doCalculation() {
    double p = double.parse(pcontroller.text);
    double i = double.parse(icontroller.text);
    double t = double.parse(tcontroller.text);
    this.si = p + (p * i * t / 100);
    result = "After $t years, your investment will be $si $curDropDownListItem";
    return result;
  }

  void doClear() {
    this.pcontroller.text = "";
    this.icontroller.text = "";
    this.tcontroller.text = "";
    this.curDropDownListItem = "Rupees";
    this.display = "";
  }
}

class ImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('./images/bank.png');
    Image image = Image(image: assetImage, width: 300, height: 150);
    return Container(
      child: image,
      alignment: Alignment.center,
    );
  }
}
