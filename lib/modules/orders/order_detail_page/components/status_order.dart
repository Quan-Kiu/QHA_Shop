import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatusOrder extends StatefulWidget {
  final current_status;
  StatusOrder({Key? key, this.current_status}) : super(key: key);

  List<String> status = ['Kho', 'Đang vận chuyển', 'Đang giao', 'Thành công'];

  @override
  _StatusOrderState createState() => _StatusOrderState();
}

class _StatusOrderState extends State<StatusOrder> {
  final _key = GlobalKey();
  double X_Position = 0.00;
  double Y_Position = 0.00;
  void _getPosition() {
    RenderBox? box = _key.currentContext!.findRenderObject() as RenderBox?;

    Offset position = box!.localToGlobal(Offset.zero);

    setState(() {
      X_Position = position.dx - 16.0;
      Y_Position = position.dy - 16.0;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => _getPosition());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Stack(
        children: [
          Positioned(
              left: 0,
              top: 10.0,
              right: 0,
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightClr, width: 1)),
                ),
              )),
          Positioned(
              left: 0,
              top: 10.0,
              child: Container(
                width: X_Position,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.blueClr, width: 1)),
              )),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  widget.status.length,
                  (index) => Column(
                        crossAxisAlignment: index == 0
                            ? CrossAxisAlignment.start
                            : index == widget.status.length - 1
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.center,
                        children: [
                          Opacity(
                            key: widget.current_status - 1 == index
                                ? _key
                                : null,
                            opacity:
                                index > widget.current_status - 1 ? 0.2 : 1,
                            child: SvgPicture.asset(
                              AppAssetsPath.successIcon,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            widget.status[index],
                            style: const TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w300),
                          ),
                        ],
                      )))
        ],
      ),
    );
  }
}
