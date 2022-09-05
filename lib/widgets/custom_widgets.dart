import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Color? color;

  const IconCard({this.text, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 85,
        width: 85,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
            ),
            Text(
              '${text}',
              style: TextStyle(fontSize: 15),
            )
          ],
        ));
  }
}

class CustomCard extends StatelessWidget {
  final String? text;
  final List<String> list;

  const CustomCard({required this.list, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                text!,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                separatorBuilder: (ctx, index) => SizedBox(
                  height: 2,
                ),
                itemCount: list.length,
                itemBuilder: (ctx, index) => Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    '${list[index]}',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class Background extends StatelessWidget {
  final String? image;

  Background({this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image!,
      fit: BoxFit.fill,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}

class SwitchTile extends StatefulWidget {
  final bool? val;
  final String? name;
  final String? caption;
  final Function(bool value)? change;

  const SwitchTile(
      {@required this.val = false,
      @required this.name,
      @required this.caption,
      @required this.change});

  @override
  _SwitchTileState createState() => _SwitchTileState();
}

class _SwitchTileState extends State<SwitchTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(15)),
      child: SwitchListTile(
        subtitle:Text(widget.caption!),
        value: widget.val!,
        onChanged: widget.change,
        title: Text(
          widget.name!,
          style:  Theme.of(context).textTheme.bodyText1,
        ),
        activeColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
