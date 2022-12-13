
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_chart/home_view_model.dart';
import 'package:syncfusion_chart/model/data_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

HomeViewModel? homeViewModel;
class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();
    homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(scrollDirection: Axis.vertical,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:  const <Widget>[
            SizedBox(
              height: 300,
                child: MyCustomForm()),

            SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 520,
                child: DoughnutChartUI())

          ],
        ),
      ),

    );
  }
}


class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cityNameEditTextController = TextEditingController();
  final TextEditingController _valueEditTextController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Card(
          shadowColor: Colors.grey,
          elevation: 5,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _cityNameEditTextController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your city name',
                      labelText: 'City Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _valueEditTextController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter a value',
                      labelText: 'GDP Value',
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_cityNameEditTextController.text.isEmpty ||
                          _valueEditTextController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Name and value is required",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        homeViewModel!.initMainList(_cityNameEditTextController.text,
                            _valueEditTextController.text, 0, null);
                        _cityNameEditTextController.text = "";
                        _valueEditTextController.text = "";
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class DoughnutChartUI extends StatefulWidget {
  const DoughnutChartUI({super.key});

  @override
  State<DoughnutChartUI> createState() => _DoughnutChartUIState();
}

class _DoughnutChartUIState extends State<DoughnutChartUI> {
//  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
 //   _chartData = getChartData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Consumer<HomeViewModel>(builder: (_, value, child) {
              if (value.mainList.isNotEmpty) {
                return Padding(
                  padding: EdgeInsets.all(5),
                  child: Card(
                    elevation: 5,
                    child: SfCircularChart(

                      centerX: '50%',
                      centerY: '35%',
                      title: ChartTitle(
                          text: 'Continent  wise GDP - 2021 \n (in billions of USD)'),
                      legend: Legend(
                          isVisible: true,
                          overflowMode: LegendItemOverflowMode.wrap,
                          position: LegendPosition.right),
                     tooltipBehavior: _tooltipBehavior = TooltipBehavior(enable: true, color: Colors.black),
                      series: <CircularSeries>[
                        DoughnutSeries<MainList, String>(
                            dataSource: value.mainList,
                            xValueMapper: (MainList data, _) => data.continent,
                            yValueMapper: (MainList data, _) => int.parse(data.valueGDP),
                            dataLabelSettings: const DataLabelSettings(
                              showCumulativeValues: true,
                                isVisible: true),
                            enableTooltip: true,


                        )
                      ],


                    ),
                  ),
                );
              }
              return const Center();
            }
            )));
  }
}

// List<GDPData> getChartData(){
//   final List<GDPData> charData = [
//     GDPData('India', 10600),
//     GDPData('America', 20490),
//     GDPData('China', 17900),
//     GDPData('Bangladesh',24880),
//     GDPData('Japan', 23050),
//     GDPData('Indonesia',24880),
//
//   ];
//   return charData;
// }
//
//
//
// class GDPData{
//   GDPData(this.continent, this.gdp);
//   final String continent;
//   final int gdp;
// }
