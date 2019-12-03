import 'package:flutter/material.dart';
import 'package:game_flix/utils/dimension_helper.dart';
import 'package:game_flix/widgets/gradient_background.dart';
import '../data/data.dart';
class DetailPage extends StatelessWidget {
  final String title;
  final String image;

  DetailPage(this.title, this.image);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: mediaQueryVertical(context, 0.50)),
            child: _backgroundImage(context),
          ),
          Padding(
              padding: EdgeInsets.only(top: mediaQueryVertical(context, 0.30)),
              child: gradientBackground(
                  Colors.transparent, Color.fromRGBO(35, 45, 59, 1))),
          Padding(
            padding: EdgeInsets.fromLTRB(
                mediaQueryHorizontal(context, 0.030),
                mediaQueryVertical(context, 0.05),
                mediaQueryHorizontal(context, 0.030),
                mediaQueryVertical(context, 0.05)),
            child: _infoColumns(context),
          )
        ],
      ),
    );
  }

  Widget _backgroundImage(BuildContext _context) => Container(
        width: MediaQuery.of(_context).size.width,
        height: MediaQuery.of(_context).size.height,
        decoration: BoxDecoration(
            color: Colors.redAccent,
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
      );

  Widget _infoColumns(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _topBar(),
          SizedBox(
            height: mediaQueryVertical(context, 0.27),
          ),
          Text(
            title
                .split(' ')
                .map((word) =>
                    (word == title.split(' ').last) ? '\n' + word : word + ' ')
                .join(),
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                0,
                mediaQueryVertical(context, 0.02),
                0,
                mediaQueryVertical(context, 0.01)
            ),
            child: Text('EA Game', style: TextStyle(
            color: Colors.red[700],
            fontSize: 15,
            fontWeight: FontWeight.w400
          ),
          ),
          ),
          _infoText(),
          Padding(
            padding: EdgeInsets.fromLTRB(
                0,
                mediaQueryVertical(context, 0.02),
                0,
                mediaQueryVertical(context, 0.01)
            ),
            child: Text('SnapShot', style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400
            ),
            ),
          ),
          _snapShotList(context, screenshots)
        ],
      );
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

  Widget _infoText() => Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Id diam maecenas ultricies mi eget. Libero volutpat sed cras ornare. Curabitur gravida arcu ac tortor dignissim convallis aenean et tortor. Sapien et ligula ullamcorper malesuada proin. Volutpat ac tincidunt vitae semper. Vitae semper quis lectus nulla at volutpat diam ut venenatis. Sit amet aliquam id diam. Urna nunc id cursus metus aliquam eleifend mi in. Vulputate eu scelerisque felis imperdiet proin fermentum leo vel orci. Vestibulum lectus mauris ultrices eros in cursus turpis. Donec ac odio tempor orci dapibus ultrices.',
  style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w200,
    fontSize: 14
  ),);

  Widget _snapShotList(BuildContext _context, List<String> _snapshots) =>
      SizedBox(
        height: mediaQueryVertical(_context, 0.155),
        width: mediaQueryVertical(_context, 1),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _snapshots.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(
                right: 10.0
            ),
            child: Container(
              width: mediaQueryHorizontal(context, 0.60),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_snapshots[index])
                  ),
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
          ),
        ),
      );

}
