import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_widget_sample/src/bloc/sample_bloc.dart';
import 'package:flutter_bloc_widget_sample/src/bloc/sample_bloc_di.dart';
import 'package:flutter_bloc_widget_sample/src/repository/repository_sample.dart';

class RepositoryProviderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // ✅ RepositoryProvider
    // - API 호출, 데이터베이스 처리, 캐시 관리 등을 담당하는 Repository를 별도로 분리,
    // - 이를 이벤트 & 상태관리를 담당하는 Bloc에서 역으로 '주입'하여 활용함
    return RepositoryProvider(

      // Repository(단순 api 통신)를 생성한 후,
      create: (context) => RepositorySample(),

      // BlocProvider에서 위 Repository를 별도의 'SampleBlocDI'라는 블럭에 다시 DI(의존성 주입)함
      child: BlocProvider(

        // SampleBlocDI에서 RepositorySample을 주입
        // - 독립적이고 (기존 Bloc에서 API 호출, 데이터베이스 처리 등의 역할을 전부 담당하게 되면 매우 지저분함)
        // - 코드간의 결합도를 낮춤
        create: (context) => SampleBlocDI(context.read<RepositorySample>()),
        child: SamplePage(),
      ),
    );
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SampleBlocDI, int>(
          builder: (context, state) => Text(
            state.toString(),
            style: TextStyle(fontSize: 70),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SampleBlocDI>().add(SampleDIEvent());
        },
      ),
    );
  }
}
