import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safewheel/data/network/status.dart';
import 'package:safewheel/myviewmodel.dart';

class DetailsScreen extends StatelessWidget {
  final String id;
  final String name;

  const DetailsScreen(this.id, this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    MyViewModel myViewModel = MyViewModel();
    myViewModel.fetchDetailsData(id, name);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Details'),
      ),
      body: ChangeNotifierProvider<MyViewModel>(
        create: (BuildContext context) => myViewModel,
        child: Consumer<MyViewModel>(
          builder: (context, value, _) {
            switch (value.detailsResponse.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(
                    child: Text(value.detailsResponse.message.toString()));
              case Status.COMPLETE:
                var data = value.detailsResponse.data!.data!.pokemon!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width:    MediaQuery.of(context).size.width,
                      child: Image.network(data.image.toString(),
                          errorBuilder: (context, error, stack) {
                        return const Icon(Icons.person, color: Colors.red);
                      }),
                    ),
                    Text("ID: ${data.id}"),
                    Text("Name: ${data.name}"),
                    Text("Classification: ${data.classification}"),
                    Text(
                        "Height: ${data.height?.minimum} - ${data.height?.maximum}"),
                    Text(
                        "Weight: ${data.weight?.minimum} - ${data.weight?.maximum}"),
                  ],
                );

              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
