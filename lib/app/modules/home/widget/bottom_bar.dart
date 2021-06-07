part of '../home_page.dart';

const double CIRCLE_SIZE = 50;
const double BOTTOM_SIZE = 52;

Widget _bottomBar({List<BottomBarModel> tabs, HomeController controller}) =>
    Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: BOTTOM_SIZE,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, -1),
              )
            ],
          ),
        ),
        Container(
          height: BOTTOM_SIZE,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: tabs
                    .map((d) => (d.index == 4)
                        ? Spacer(flex: 1)
                        : _bottomBarItem(
                            d.index,
                            icon: d.icon,
                            iconOut: d.iconOut,
                            label: d.label,
                            controller: controller,
                          ))
                    .toList() ??
                [],
          ),
        ),
      ],
    );

Widget _bottomBarItem(
  int index, {
  IconData icon,
  IconData iconOut,
  String label,
  HomeController controller,
}) =>
    Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: InkWell(
          onTap: () => controller.goToPage(index),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                (controller.isCurrentPage(index)) ? icon : iconOut,
                color: (controller.isCurrentPage(index))
                    ? Color(0xff6F967E)
                    : Color(0xff6F965E),
                size: 30,
              ),
              Text(
                label ?? '',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: (controller.isCurrentPage(index))
                      ? Color(0xff6F967E)
                      : Color(0xff6F965E),
                ),
              ),
            ],
          ),
        ),
      ),
    );

// NOTE model
class BottomBarModel {
  final int index;
  final IconData icon;
  final IconData iconOut;
  final String label;

  BottomBarModel({this.icon, this.label, this.iconOut, this.index});
}
