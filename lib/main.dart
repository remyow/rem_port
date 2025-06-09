import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => counterProvider,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  ValueNotifier t = ValueNotifier<int>(0);


  @override
  Widget build(BuildContext context) {
    final c = Provider.of<CounterProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '${c.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Selector<CounterProvider, int>(
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }, selector: (_, model) => model.count,),
            ValueListenableBuilder(
                valueListenable: t,
                builder: (ctx, v, child){
                  return TweenAnimationBuilder(
                    key: ValueKey('${ctx.hashCode}'),
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 100),
                      builder: (ctx, tween, child){
                        return AnimatedScale(
                            scale: tween, duration: const Duration(milliseconds: 1000),
                            child: child,
                        );
                      },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        child!,
                        Text('$v')
                      ],
                    ),
                  );
                },
              child: Text('message'),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          c.increment();
          t.value = c.count;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
