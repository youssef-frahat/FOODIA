import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExactStepperWidget extends StatelessWidget {
  const ExactStepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _StepDot(active: true),
              Container(
                width: 180.w,
                height: 2,
                color: Colors.orange,
              ),
              const _StepDot(active: false),
              Expanded(
                child: Container(
                  height: 2,
                  color: Colors.grey.shade300,
                ),
              ),
              const _StepDot(active: false),
            ],
          ),
          const SizedBox(height: 10),
      
          // الأسهم + الأزرار
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _StepLabel(title: "اضف عنوان"),
              _StepLabel(title: "تفاصيل الطلب"),
              _StepLabel(title: "الدفع"),
            ],
          ),
        ],
      ),
    );
  }
}

class _StepDot extends StatelessWidget {
  final bool active;

  const _StepDot({required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: active ? Colors.orange : Colors.white,
        border: Border.all(
          color: active ? Colors.orange : Colors.grey.shade300,
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _StepLabel extends StatelessWidget {
  final String title;

  const _StepLabel({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.arrow_drop_up,
          color: Colors.orange,
          size: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
