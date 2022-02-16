import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: SfCartesianChart(primaryXAxis: CategoryAxis(),
              series: [
            LineSeries(
                dataSource: [

                  ObservationTable(00, 158,157,158,57),
                  ObservationTable(20, 238,236,237, 85.5),
                  ObservationTable(40, 376,374,375, 131.1),
                  ObservationTable(60, 451,450,451, 148.2),
                  ObservationTable(80, 438,436,437, 136.8),
                  ObservationTable(100, 392,390,391, 114),
                // ObservationTable(Unknown, 371,367,369, 2.3,0.94)
                ],
                xValueMapper: (ObservationTable entry, _) => entry.conc,
                yValueMapper: (ObservationTable entry, _) => entry.rel_vis),
            LineSeries(
                dataSource: [
                  ObservationTable(00, 158,157,158,57),
                  ObservationTable(20, 238,236,237, 85.5),
                  ObservationTable(40, 376,374,375, 131.1),
                  ObservationTable(60, 451,450,451, 148.2),
                  ObservationTable(80, 438,436,437, 136.8),
                  ObservationTable(100, 392,390,391, 114),
                // ObservationTable(Unknown, 371,367,369, 2.3,0.94)
                ],
                xValueMapper: (ObservationTable entry, _) => entry.conc,
                yValueMapper: (ObservationTable entry, _) => entry.rel_den),

            // ColumnSeries(
            //     dataSource: [
            //       SalesData('Feb', 32, 93),
            //     ],
            //     xValueMapper: [],
            //     yValueMapper: (SalesData sales, _) => sales.vals),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales, this.vals);

  final dynamic vals;
  final String year;
  final dynamic sales;
}

class Viscosity {
  dynamic timeWater;
  dynamic rdWeightWater;
  static Map observationTable = {};

  // dynamic t1,t2,rdWeight,t3=-1;

  Viscosity(this.timeWater, this.rdWeightWater) {
    // this.observation_table = observation_table;
  }

  void TakeReading(self, dynamic conc, t1, t2, dynamic rdWeight, t3) {
    dynamic t;
    if (t3 > -1) {
      t = (t1 + t2 + t3) / 3;
      observationTable['conc'] = conc;
    } else {
      t = (t1 + t2) / 2;
    }
    observationTable['conc']['t1'] = t1;
    observationTable['conc']['t2'] = t2;
    observationTable['conc']['mean'] = t;
    observationTable['conc']['rel_den'] = rdWeight / rdWeightWater;
    observationTable['conc']['rel_vis'] =
        observationTable['conc']['rel_den'] * (t / timeWater);
  }
}

class ObservationTable {
  double conc, t1, t2, t3,rdWeight;
  double mean = -1, rel_den = -1, rel_vis = -1;
  static dynamic rdWeightWater=57, timeWater=157;

  ObservationTable(this.conc, this.t1, this.t2, this.t3,this.rdWeight) {
    // timeWater = xtimeWater;
    // rdWeightWater = xrdWeightWater;
    dynamic t;
    if (t3 > -1) {
      t = (t1 + t2 + t3) / 3;
      this.conc = conc;
    } else {
      t = (t1 + t2) / 2;
    }

    this.mean = t;
    this.rel_den = rdWeight / rdWeightWater;
    print('rel_den');
    print(this.rel_den);
    this.rel_vis = this.rel_den * (t / timeWater);
  }
}
