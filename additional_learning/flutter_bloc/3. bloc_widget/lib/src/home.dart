import 'package:flutter/material.dart';
import 'package:flutter_bloc_widget_sample/src/pages/builder/bloc_builder_page.dart';
import 'package:flutter_bloc_widget_sample/src/pages/bloc_consumer_page.dart';
import 'package:flutter_bloc_widget_sample/src/pages/bloc_listener_page.dart';
import 'package:flutter_bloc_widget_sample/src/pages/repository/multi_repository_provider_page.dart';
import 'package:flutter_bloc_widget_sample/src/pages/provider/bloc_provider_page.dart';
import 'package:flutter_bloc_widget_sample/src/pages/bloc_selector_page.dart';
import 'package:flutter_bloc_widget_sample/src/pages/provider/multi_bloc_provider_page.dart';
import 'package:flutter_bloc_widget_sample/src/pages/repository/repository_provider_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

          // ========== ✅ Bloc Provider
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BlocProviderPage()),
              );
            },
            child: const Text('BlocProvider'),
          ),

          // ========== ✅ MultiBloc Provider
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const MultiBlocProviderPage()),
              );
            },
            child: const Text('MultiBlocProvider'),
          ),

          // ========== ✅ BlocBuilder
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BlocBuilderPage()),
              );
            },
            child: const Text('BlocBuilder'),
          ),

          // ========== ✅ RepositoryProvider
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => RepositoryProviderPage()),
              );
            },
            child: const Text('RepositoryProvider'),
          ),

          // ========== ✅ MultiRepostioryProvider
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const MultiRepositoryProviderPage()),
              );
            },
            child: const Text('MultiRepositoryProvider'),
          ),

          // ========== ✅ BlocSelector
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BlocSelectorPage()),
              );
            },
            child: const Text('BlocSelector'),
          ),

          // ========== ✅ BlocListener
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BlocListenerPage()),
              );
            },
            child: const Text('BlocListener'),
          ),

          // ========== ✅ BlocConsumer
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BlocConsumerPage()),
              );
            },
            child: const Text('BlocConsumer'),
          ),
        ]),
      ),
    );
  }
}
