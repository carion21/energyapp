

class Api{

  String protocolServer = "";
  String ipServer = "";
  String portServer = "";
  String nameServer = "";

  String urlServer = "";

  var env = {};

  static final dev = {
    'protocolServer': "http",
    //'ipServer' : "192.168.1.100",
    'ipServer' : "192.168.1.146",
    'portServer': ":8000",
    'nameServer': ""
  };

  static final prod = {
    'protocolServer': "https",
    'ipServer': "energy.geasscorp.com",
    'portServer': "",
    'nameServer': ""
  };

  Api(){
    env = dev;
    //this.env = prod;
    protocolServer = env['protocolServer'];
    ipServer = env['ipServer'];
    portServer = env['portServer'];
    nameServer = env['nameServer'];

    // ignore: prefer_interpolation_to_compose_strings
    urlServer = protocolServer+"://"+ipServer+""+portServer+"/"+nameServer;
  }

}
