import 'package:counterapp/BLOC/COUNTER_BLOC/counter_bloc.dart';
import 'package:counterapp/REPOSITORY/COUNTER_REPOSITORY/counter_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => CounterBloc(
          counterRepository: RepositoryProvider.of<CounterRepository>(context))
        ..add(GetCounterEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Counter App"),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    if (state is CounterGetState) {
                      return IconButton(
                          icon: Icon(Icons.add_circle_sharp),
                          onPressed: () {
                            context
                                .read<CounterBloc>()
                                .add(AddCountEvent(count: state.counter));
                          });
                    }
                    return SizedBox();
                  },
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    if (state is CounterGetState) {
                      return Text("${state.counter.count}");
                    }
                    return SizedBox();
                  },
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    if (state is CounterGetState) {
                      return IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () {
                            context
                                .read<CounterBloc>()
                                .add(MinusCountEvent(count: state.counter));
                          });
                    }
                    return SizedBox();
                  },
                ),
              ],
            )),
      ),
    );
  }
}
