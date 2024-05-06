import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_SalesData> data = [
    _SalesData('Sun', 35),
    _SalesData('Mon', 28),
    _SalesData('Tue', 34),
    _SalesData('Wed', 32),
    _SalesData('Thu', 40),
    _SalesData('Fri', 38),
    _SalesData('Sat', 42),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter chart'),
      ),
      body: Column(
        children: [
          //Initialize the chart widget
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'Half yearly sales analysis'),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries<_SalesData, String>>[
              LineSeries<_SalesData, String>(
                dataSource: data,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                name: 'Sales',
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Container for displaying days of the week
          // Container(
          //   height: 50,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: data.length,
          //     itemBuilder: (context, index) {
          //       final salesData = data[index];
          //       return Container(
          //         alignment: Alignment.center,
          //         width: MediaQuery.of(context).size.width / 7,
          //         decoration: BoxDecoration(
          //           border: Border.all(color: Colors.grey),
          //         ),
          //         child: Text(
          //           salesData.year,
          //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
