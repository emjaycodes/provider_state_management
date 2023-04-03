// Importing the necessary packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Defining the main function which runs the app
void main() {
  runApp(MyProviderApp());
}

// Defining the MyProviderApp class which wraps the MaterialApp widget with the ChangeNotifierProvider widget
class MyProviderApp extends StatefulWidget {
  const MyProviderApp({super.key});

  @override
  State<MyProviderApp> createState() => _MyProviderAppState();
}

class _MyProviderAppState extends State<MyProviderApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterModel(),
      child: MaterialApp(
        title: 'Provider Example',
        home: ProviderPage(),
      ),
    );
  }
}

// Defining the ProviderPage class which displays the current value of the counter and increments it when the user taps on it
class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
// Retrieving the current value of the counter from the CounterModel
    // final count = CounterModel._count;

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
      body: Consumer<CounterModel>(
        builder: (context, CounterModel, child) => Center(
          child: GestureDetector(
            onTap: () {
              // Incrementing the counter value
              CounterModel.incrementCount();
            },
            child: Text(
              'you\'ve Tapped: ${CounterModel._count}', // Displaying the current value of the counter
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
      ),
    );
  }
}

// Defining the CounterModel class
class CounterModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void incrementCount() {
    _count++;
    notifyListeners();
  }
}
