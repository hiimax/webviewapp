import '../../../res/import/import.dart';

class ConfigureScreen extends StatelessWidget {
  const ConfigureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: webviewappWhite,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.account_balance_wallet),
            onPressed: () {
              // Do something when the icon is pressed
            },
          )
        ],
        title: Text('OVNP Profiles'),
        backgroundColor: webviewappPrimaryColor,
        titleTextStyle: TextStyle(
            color: webviewappWhite,
            fontFamily: "Helvetica Neue",
            fontWeight: FontWeight.bold,
            fontSize: 17.0),
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width/2,
        color: Colors.white,
      ),

      floatingActionButton: Container(
          // child: C,
          ),
      body: SafeArea(
        child: ConfigureScreenWidget(),
      ),
    );
  }
}

class ConfigureScreenWidget extends StatelessWidget {
  bool switcher =false;
   ConfigureScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setter) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              YMargin(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Disconnected',
                      style: TextStyle(
                        color: webviewappPrimaryColor,
                        fontFamily: "Helvetica Neue",
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),),
                    YMargin(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 44,
                              height: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: switcher ? webviewappMainColor  : webviewappTextColor,
                              ),
                              child: Switch(
                                onChanged: (value) {
                                  setter(() {
                                    switcher=value;
                                  });
                                  setter(() {

                                  });
                                },
                                value: switcher,
                                activeColor: Colors.white,
                                activeTrackColor: webviewappMainColor,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: webviewappTextColor,
                              ),
                            ),
                            XMargin(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('OpenVPN Profile',
                                  style: TextStyle(
                                      color: webviewappTextColor,
                                      fontFamily: "Helvetica Neue",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),),
                                YMargin(5),
                                Text('bepstein@openvpn.ias.edu',
                                  style: TextStyle(
                                      color: webviewappTextColor,
                                      fontFamily: "Helvetica Neue",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),),
                              ],
                            ),
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios_outlined,color: webviewappTextColor,),
                      ],
                    )
                  ],
                ),
              ),
              YMargin(30),
              Divider(thickness: 2,color: webviewappBlack,),
            ],
          ),
        );
      }
    );
  }
}
