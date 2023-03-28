import 'dart:async';

import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tutorial/current_activity/domain/use_case/controller/location_controller.dart';
import 'package:tutorial/home_page/actividades_controller.dart';
import 'package:tutorial/home_page/home_page_widget.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import 'package:flutter/material.dart';
import 'current_activity_model.dart';
export 'current_activity_model.dart';

class CurrentActivityWidget extends StatefulWidget {
  final String type;
  CurrentActivityWidget({Key? key, required this.type}) : super(key: key);

  @override
  _CurrentActivityWidgetState createState() => _CurrentActivityWidgetState();
}

class _CurrentActivityWidgetState extends State<CurrentActivityWidget> {
  StopWatchTimer stopWatchTimer = StopWatchTimer();
  late CurrentActivityModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CurrentActivityModel());
  }

  @override
  void dispose() {
    stopWatchTimer.dispose();
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LocationController locationController = Get.put(LocationController());
    ActividadesController activityController = Get.put(ActividadesController());
    locationController.suscribeLocationUpdates();
    stopWatchTimer.onStartTimer();
    var _displayTime;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        leading: null,
        title: Text(
          'Activity',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Align(
            alignment: AlignmentDirectional(0.15, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                  child: Text(
                    widget.type,
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.05),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                    child: Container(
                      width: 298.9,
                      height: 109.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            child: StreamBuilder<int>(
                              stream: stopWatchTimer.rawTime,
                              initialData: stopWatchTimer.rawTime.value,
                              builder: (context, snapshot) {
                                final value = snapshot.data;
                                _displayTime = StopWatchTimer.getDisplayTime(
                                    value!,
                                    hours: true);
                                Timer.periodic(Duration(minutes: 1), (arg) {
                                  print("corriendooooooo funcion");
                                  locationController.calculateAvgPace(
                                      locationController
                                          .convertDuration(_displayTime));
                                });

                                return Text(
                                  _displayTime,
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 50,
                                      ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Text(
                              'Time',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                    child: Container(
                      width: 350.0,
                      height: 182.6,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => Text(
                                "${locationController.getDistance.toStringAsFixed(2)}",
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                              )),
                          Text(
                            'Km',
                            style: FlutterFlowTheme.of(context).subtitle2,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Obx(() => Text(
                                        "${locationController.getKcal.toStringAsFixed(1)}",
                                        style: FlutterFlowTheme.of(context)
                                            .title2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                            ),
                                      )),
                                  Text(
                                    'Kcal',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Obx(() => Text(
                                        "${locationController.getAvgPace.toStringAsFixed(1)}",
                                        style: FlutterFlowTheme.of(context)
                                            .title2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                            ),
                                      )),
                                  Text(
                                    'AVG Pace',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          print("touched!!");
                          print(
                              "The location is paused? ${locationController.isPaused}");
                          if (locationController.isPaused) {
                            locationController.resumeLocationUpdates();
                            stopWatchTimer.onStartTimer();
                          } else {
                            locationController.pauseLocationUpdates();
                            stopWatchTimer.onStopTimer();
                          }
                        },
                        text: 'Pause',
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color.fromARGB(255, 255, 255, 255),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF254A7A),
                                  ),
                          borderSide: BorderSide(
                            color: Color(0xFF254A7A),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          stopWatchTimer.onStopTimer();
                          final Duration durationT =
                              locationController.convertDuration(_displayTime);
                          DateTime date = DateTime.now();
                          activityController.agregarActividad(
                              tipo: widget.type,
                              cronometro: durationT,
                              km: locationController.getDistance,
                              kcal: locationController.getKcal,
                              avgPace: locationController.getAvgPace,
                              estado: true,
                              fecha: DateTime(date.year, date.month, date.day),
                              puntos: locationController.allPositions);
                          locationController.resetAll();
                          locationController.unSuscribeLocationUpdates();

                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NavBarPage(page: HomePageWidget()),
                            ),
                          );
                        },
                        text: 'Finish',
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF254A7A),
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                          borderSide: BorderSide(
                            color: Color(0xFF254A7A),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
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
