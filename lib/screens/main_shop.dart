import 'package:flutter/material.dart';
import 'package:petshop/utility/my_style.dart';
import 'package:petshop/utility/signout_process.dart';
import 'package:petshop/widget/information_shop.dart';
import 'package:petshop/widget/list_petfood_menu_shop.dart';
import 'package:petshop/widget/order_list_shop.dart';

class MainShop extends StatefulWidget {
  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  //Field
  Widget currentWidget = OrderListShop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Shop'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => signOutProcess(context),
          )
        ],
      ),
      drawer: showDrawer(),
      body: currentWidget,
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(),
            homeMenu(),
            petfoodMenu(),
            infomationMenu(),
            signOutMenu(),
          ],
        ),
      );

  ListTile homeMenu() => ListTile(
        leading: Icon(Icons.home),
        title: Text('รายการที่ลูกค้าสั่ง'),
        subtitle: Text('รายการที่ยังไม่ได้ชำระสินค้า'),
        onTap: () {
          setState(() {
            currentWidget = OrderListShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile petfoodMenu() => ListTile(
        leading: Icon(Icons.pets),
        title: Text('รายการ'),
        subtitle: Text('สินค้าของร้าน'),
        onTap: () {
          setState(() {
            currentWidget = ListPetFoodShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile infomationMenu() => ListTile(
        leading: Icon(Icons.info),
        title: Text('รายละเอียดของร้าน'),
        subtitle: Text('พร้อม Edit'),
        onTap: () {
          setState(() {
            currentWidget = InformationShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile signOutMenu() => ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text('Sign Out'),
        subtitle: Text('ออกจากระบบ'),
        onTap: () => signOutProcess(context),
      );

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration(),
      currentAccountPicture: ClipRRect(
        borderRadius: BorderRadius.circular(70),
        child: Image.asset('images/Logo.png'),
      ),
      accountName: Text(
        'Name Login',
        style: TextStyle(color: Colors.white),
      ),
      accountEmail: Text(
        'Login',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
