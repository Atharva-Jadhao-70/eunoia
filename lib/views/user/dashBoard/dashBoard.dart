import 'package:eunoia/views/user/profilePage/profilePage.dart';
import 'package:eunoia/utils/movieRecommandation.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var recommendedMovies = [];
  var recommendedMusic = [];

  bool loadingData = true;

  Future<void> getRecommandedMovies() async {
    var data = await MovieRecommandation.getDepressionMovies();
    if (data != null) {
      setState(() {
        recommendedMovies = data;
        loadingData = false;
      });
    }
    print(recommendedMovies);
  }

  void loadData() async {
    setState(() {
      loadingData = true;
    });
    // Code to fetch data
    setState(() {
      loadingData = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getRecommandedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dashboard'),
            GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfilePage()));
              },
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Container for header result
          Container(
              child: const Card(
            child: ListTile(
              title: Text('Mental Health Diagnosis:'),
              subtitle: Text('Type: Major Depression, Level: Severe'),
            ),
          )),

          const SizedBox(height: 16),

          //container for movie recommandation
          const Text('Recommanded movies'),
          Container(
            child: loadingData
                ? const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 4.0,
                  ),
                )
                : SingleChildScrollView(
                    child: Row(children: [
                      //card - 1
                      Card(
                        child: Column(
                          children: [
                            //Display poster image
                            Container(
                              width: 100,
                              height: 100,
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${recommendedMovies[1]['poster_path']}',
                              ),
                            ),
                            Text(
                              recommendedMovies[1]['title'],
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      //Card - 2
                      Card(
                        child: Column(
                          children: [
                            //Display poster image
                            Container(
                              width: 100,
                              height: 100,
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${recommendedMovies[2]['poster_path']}',
                              ),
                            ),
                            Text(
                              recommendedMovies[2]['title'],
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
          ),
        ],
      ),
    );
  }
}
