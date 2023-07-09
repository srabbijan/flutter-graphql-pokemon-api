import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safewheel/data/network/status.dart';
import 'package:safewheel/myviewmodel.dart';
import 'package:safewheel/ui/Details_screen.dart';
import 'package:safewheel/ui/List_screen.dart';
import 'package:safewheel/utils/routes/routes_name.dart';
import 'package:safewheel/utils/splash_services.dart';
import 'package:safewheel/utils/utils.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  MyViewModel mViewModel = MyViewModel();

  @override
  void initState() {
    mViewModel.fetchListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon List'),
      ),
      body: ChangeNotifierProvider<MyViewModel>(
        create: (BuildContext context) => mViewModel,
        child: Consumer<MyViewModel>(
          builder: (context, value, _) {
            switch (value.apiResponse.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(
                    child: Text(value.apiResponse.message.toString()));
              case Status.COMPLETE:
                return ListView.builder(
                    itemCount: value.apiResponse.data?.data?.pokemons?.length,
                    itemBuilder: (context, index) {
                      var data = value.apiResponse.data!.data!.pokemons![index];
                      return GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(data.id.toString(),data.name.toString()),
                            ),
                          )
                          // Navigator.pushNamed(context, RoutesName.details)
                        },
                        child: Card(
                          elevation: 4.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 120,
                                      child: Image.network(
                                          data.image.toString(), errorBuilder:
                                              (context, error, stack) {
                                        return const Icon(Icons.person,
                                            color: Colors.red);
                                      }),
                                    ),
                                    Text(data.name.toString()),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${data.classification}",
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text("ID: ${data.id}"),
                                    Text(
                                        "Height: ${data.height?.minimum} - ${data.height?.maximum}"),
                                    Text(
                                        "Weight: ${data.weight?.minimum} - ${data.weight?.maximum}"),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
