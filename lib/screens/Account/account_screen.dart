import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import '../../provider/theme_dark_provider.dart';
import './widgets/switch_theme_widget.dart';
import './widgets/header_account.dart';

class Account extends StatefulWidget {

  Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _listItem = [
    {
      "title": "Address",
      "subtitle": "my Address",
      "iconLeft":  const IconlyLightData(0xe04b),
    },
    {
      "title": "Orders",
      "iconLeft":  const IconlyLightData(0xe019),
    },
    {
      "title": "WishList",
      "iconLeft":  const IconlyLightData(0xe034),
    },
    {
      "title": "Viewed",
      "iconLeft":  const IconlyLightData(0xe052),
    },
    {
      "title": "Forget Password",
      "iconLeft":  const IconlyLightData(0xe05a),
    },
    {
      "title": "Theme",
    },
    {
      "title": "Logout",
      "iconLeft":  const IconlyLightData(0xe03d),
    },
  ];
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  void showAddressAlertDialog()
  {
    showDialog(
      context: context, 
      builder: (context) {
        final themeModeColor = 
          Provider
            .of<ThemeDarkProvider>(context)
            .getDarkTheme;
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Address"),
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: "Address"
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if(Navigator.canPop(context))
                {
                  Navigator.of(context).pop();
                }
              }, 
              child: const Text("Update"),
              style: TextButton.styleFrom(
                primary: themeModeColor ? Colors.white : Colors.black
              ),
            )
          ],
        );
      });
  }
  void showLogoutAlertDialog()
  {
    showDialog(
      context: context, 
      builder: (context) {
        final themeModeColor = 
          Provider
            .of<ThemeDarkProvider>(context)
            .getDarkTheme;
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Sign Out"),
          content: Container(
            child: Text("Do you want to Sign out"),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    if(Navigator.canPop(context))
                    {
                      Navigator.of(context).pop();
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: themeModeColor ? Colors.white : Colors.black
                  ), 
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: themeModeColor ? Colors.white : Colors.black
                  ), 
                  child: const Text("Okay"),
                ),
              ],
            ),
          ],
        );
      });
  }
  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeDarkProvider>().getDarkTheme;
    final Color color = themeState ? Colors.white : Colors.black;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderAccount(
                username: "My Name",
                email: "test.com",
              ),
              const SizedBox(height: 15),
              const Divider(
                height: 3,
                thickness: 1.5,
                color: Colors.grey,
              ),
              const SizedBox(height: 15),
              Column(
                children: _listItem.map((e) {
                  return e["title"] == "Theme"
                    ? SwitchThemeWidget(title: e["title"])
                    : ListTile(
                        title: TextWidget(
                          text:e["title"],
                          color: color, 
                          textSize: 22,
                        ),
                        leading: Icon(e["iconLeft"]),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        subtitle: TextWidget(
                          text:e["subtitle"] ?? "", 
                          color: color, 
                          textSize: 13,
                        ),
                        onTap: () {
                          switch(e["title"])
                          {
                            case "Address" :
                              return showAddressAlertDialog();
                            case "Logout" :
                              return showLogoutAlertDialog();
                            default:
                              return;
                          }
                        },
                      );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
