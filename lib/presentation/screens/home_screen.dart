import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/logic/bloc/api_bloc.dart';
import 'package:weather/logic/bloc/api_event.dart';
import 'package:weather/logic/bloc/api_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ApiBloc>().add(ApiFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Handling"), centerTitle: true),
      body: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          if (state is ApiFailureState) {
            return Center(child: Text(state.failureMsg));
          }

          if (state is! ApiSuccessState) {
            return Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: ListView.builder(
              itemCount: state.model.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 23,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ListTile(
                    title: Column(
                      children: [
                        Text(state.model[index].userId.toString()),
                        Text(state.model[index].id.toString()),
                        Text(state.model[index].title.toString()),
                        Text(state.model[index].completed.toString()),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
