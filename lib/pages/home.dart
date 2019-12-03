import "package:flutter/material.dart";
import 'package:game_flix/pages/detail.dart';
import '../data/data.dart';
import '../widgets/gradient_background.dart';
import '../utils/dimension_helper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: mediaQueryVertical(context, 0.50)),
            child: _imageScrollableBackground(),
          ),
          Padding(
              padding: EdgeInsets.only(top: mediaQueryVertical(context, 0.35)),
              child: gradientBackground(
                  Colors.transparent, Color.fromRGBO(35, 45, 59, 1)
              )
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                mediaQueryHorizontal(context, 0.030),
                mediaQueryVertical(context, 0.05),
                mediaQueryHorizontal(context, 0.030),
                mediaQueryVertical(context, 0.01)
            ),
            child: _infoColumns(context),
          )
        ],
      ),
    );
  }

  Widget _imageScrollableBackground() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: PageScrollPhysics(),
        itemCount: featuredGames.length,
        itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  image: DecorationImage(
                      image: NetworkImage(featuredGames[index].imageURL),
                      fit: BoxFit.cover)),
            ));
  }

  Widget _infoColumns(BuildContext _context) {
    return Column(
      children: <Widget>[
        _topBar(),
        SizedBox(
          height: mediaQueryVertical(_context, 0.22),
        ),
        Text("Assasin's Creed Odyssey",
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w500)),
        SizedBox(height: mediaQueryVertical(_context, 0.03),),
        _gameListView(_context, games),
        Padding(
          padding: EdgeInsets.only
            (top: mediaQueryVertical(_context, 0.02),
            bottom: mediaQueryVertical(_context, 0.02)
            ),
          child: _gameBanner(_context),
        ),
        _gameListView(_context, games_2)
      ],
    );
  }

  Widget _topBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 25,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.white,
                size: 25,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _gameListView(BuildContext _context, List<GameData> _games) =>
      SizedBox(
        height: mediaQueryVertical(_context, 0.19),
        width: mediaQueryVertical(_context, 1),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _games.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    DetailPage(_games[index].name, _games[index].imageURL))),
            child: Padding(
              padding: EdgeInsets.only(
                right: 10.0
              ),
              child: Container(
                width: mediaQueryHorizontal(context, 0.30),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(_games[index].imageURL)
                    ),
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
            ),
          ),
        ),
      );

  Widget _gameBanner(BuildContext context) => Container(
    height: mediaQueryVertical(context, 0.12),
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ-LED41iSKwS6hkXLOzuRcZ2g7kuqr6AQjGt2-aZcmMwIfO0O_'
        )
      )
    ),
  );
}
