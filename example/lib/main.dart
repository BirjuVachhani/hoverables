import 'package:flutter/material.dart';
import 'package:hoverables/hoverables.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView(
          padding: const EdgeInsets.all(56),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            mainAxisSpacing: 56,
            crossAxisSpacing: 56,
          ),
          children: [
            // Hover Builder
            HoverBuilder(
              builder: (context, hovering, child) {
                return Center(
                  child: GestureDetector(
                    onTap: onTap,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: hovering ? 300 : 200,
                      height: hovering ? 300 : 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: hovering
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: DefaultTextStyle.of(context).style.copyWith(
                              fontSize: hovering ? 30 : 20,
                              fontWeight: hovering
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontStyle: hovering
                                  ? FontStyle.italic
                                  : FontStyle.normal,
                            ),
                        child: child!,
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Hover Me'),
            ),
            // Hover Scale
            HoverBuilder(
              builder: (context, hovering, child) {
                return AnimatedScale(
                  duration: const Duration(milliseconds: 200),
                  scale: hovering ? 1.35 : 1,
                  child: child,
                );
              },
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Hover Scale'),
                ),
              ),
            ),
            // Hover Rotation
            HoverBuilder(
              builder: (context, hovering, child) {
                return AnimatedRotation(
                  duration: const Duration(milliseconds: 200),
                  turns: hovering ? 10 / 360 : 0,
                  child: child,
                );
              },
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Hover Turn'),
                ),
              ),
            ),
            // Hover Translate
            HoverBuilder(
              builder: (context, hovering, child) {
                return AnimatedSlide(
                  duration: const Duration(milliseconds: 200),
                  offset: hovering
                      ? const Offset(-0.05, -0.05)
                      : const Offset(0, 0),
                  child: child,
                );
              },
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Hover Turn'),
                ),
              ),
            ),
            // Hover Fade
            HoverBuilder(
              builder: (context, hovering, child) {
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: hovering ? 0.6 : 1,
                  child: child,
                );
              },
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Hover Turn'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Hoverables are awesome!'),
      ),
    );
  }
}
