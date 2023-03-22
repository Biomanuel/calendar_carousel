import 'package:carousel_calendar/carousel_calendar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calendar Carousel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  DateTime? date;

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CalendarCarousel(
                monthSelectorMargin: EdgeInsets.only(bottom: 2.0),
                weekdayMargin: EdgeInsets.symmetric(vertical: 12.0),
                weekdayAbb: WeekdayAbbreviation.two,
                dayCarouselHeight: 120,
                showYearAlways: true,
                onChanged: (nm) {
                  setState(() {
                    date = nm;
                  });
                },
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Selected Date',
                  ),
                  Text(
                    '${date != null ? "${date!.day}-${date!.month}-${date!.year}" : "No selection yet."}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Visibility(
                    visible: false,
                    child: const Text(
                      'You have pushed the button this many times:',
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: false,
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
