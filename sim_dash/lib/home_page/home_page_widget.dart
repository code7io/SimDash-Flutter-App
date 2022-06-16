import 'package:f1_2021_udp/f1_2021_udp.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String gearTxt = 'N';
  bool drsAvail = false;
  bool drsOn = false;
  bool pitLimit = false;
  Color flagColor;
  List<Color> revLed = [];

  void init() {
    // init values
    parseFiaFlags(-1);

    // add 14 empty colors for the leds
    for (var i = 0; i < 14; i++) {
      revLed.add(Color(0xFF2E2E2E));
    }

    F12021TelemetryListener listener = F12021TelemetryListener(20777);
    listener.start();

    // Car Telemetry
    listener.packetCarTelemetryDataStream.listen((packet) {
      //print(packet.m_carTelemetryData[0].toString());

      parseGear(packet.m_carTelemetryData[0].m_gear);
      parseRev(packet.m_carTelemetryData[0].m_revLightsPercent);
      drsOn = packet.m_carTelemetryData[0].m_drs == 1;
    });

    // Car Status
    listener.packetCarStatusDataStream.listen((packet) {
      //print(packet.m_carStatusData[0].toString());

      drsAvail = packet.m_carStatusData[0].m_drsAllowed == 1;
      pitLimit = packet.m_carStatusData[0].m_pitLimiterStatus == 1;
      parseFiaFlags(packet.m_carStatusData[0].m_vehicleFiaFlags);
    });
  }

  void parseGear(int gear) {
    switch (gear) {
      case -1:
        gearTxt = 'R';
        break;
      case 0:
        gearTxt = 'N';
        break;
      default:
        gearTxt = gear.toString();
        break;
    }
  }

  void parseRev(int revPercent) {
    int leds = 14 ~/ (revPercent / 100);

    for (var i = 0; i < 14; i++) {
      if (i < leds) {
        if (i < 6) {
          revLed[i] = FlutterFlowTheme.of(context).green;
        } else if (i > 5 && i < 11) {
          revLed[i] = FlutterFlowTheme.of(context).redd;
        } else {
          revLed[i] = FlutterFlowTheme.of(context).purple;
        }
      } else {
        revLed[i] = FlutterFlowTheme.of(context).secondaryBackground;
      }
    }
  }

  void parseFiaFlags(int flag) {
    switch (flag) {
      case 1: // green flag
        flagColor = FlutterFlowTheme.of(context).green;
        break;
      case 2: // blue flag
        flagColor = FlutterFlowTheme.of(context).blue;
        break;
      case 3: // yellow flag
        flagColor = FlutterFlowTheme.of(context).yellow;
        break;
      case 4: // red flag
        flagColor = FlutterFlowTheme.of(context).redd;
        break;
      default:
        flagColor = FlutterFlowTheme.of(context).secondaryBackground;
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: revLed[0],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: revLed[1],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: revLed[2],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: revLed[3],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: revLed[4],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: revLed[5],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: revLed[6],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: revLed[7],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: revLed[8],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: revLed[9],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: revLed[10],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: revLed[11],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: revLed[12],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: revLed[13],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: flagColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: flagColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: flagColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: drsOn ? FlutterFlowTheme.of(context).green : FlutterFlowTheme.of(context).primaryBackground,
                              border: Border.all(
                                color: drsAvail ? FlutterFlowTheme.of(context).green : FlutterFlowTheme.of(context).primaryBackground,
                                width: 5,
                              ),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Text(
                              'DRS',
                              style: FlutterFlowTheme.of(context).title1.override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: pitLimit ? FlutterFlowTheme.of(context).purple : FlutterFlowTheme.of(context).primaryBackground,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).purple,
                                width: 5,
                              ),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Text(
                              'PIT',
                              style: FlutterFlowTheme.of(context).title1.override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              gearTxt,
                              style: FlutterFlowTheme.of(context).title1.override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context).yellow,
                                    fontSize: 300,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: flagColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: flagColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: flagColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
