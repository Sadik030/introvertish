// import 'package:english_words/english_words.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../main.dart';
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var pair = appState.current;
//
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('Welcome to the Introvertish.life'),
//           BigCard(pair: pair),
//           SizedBox(height: 10),
//           ElevatedButton(onPressed: () {
//             appState.getNext();
//           }, child: Text('Click here!'))
//         ],
//       ),
//     );
//   }
// }
//
// class BigCard extends StatelessWidget {
//   const BigCard({
//     super.key,
//     required this.pair,
//   });
//
//   final WordPair pair;
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final style = theme.textTheme.displayMedium!.copyWith(
//       color: theme.colorScheme.onPrimary,
//     );
//
//     return Card(
//       color: theme.colorScheme.primary,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(pair.asLowerCase, style: style, semanticsLabel: "${pair.first} ${pair.second}",),
//       ),
//     );
//   }
// }