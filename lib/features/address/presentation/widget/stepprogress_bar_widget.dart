import 'package:flutter/material.dart';

class ExactStepperWidget extends StatefulWidget {
  const ExactStepperWidget({super.key, required this.currentStep});

  final int currentStep;

  @override
  State<ExactStepperWidget> createState() => _ExactStepperWidgetState();
}

class _ExactStepperWidgetState extends State<ExactStepperWidget> {
  final List<String> steps = const ["اضف عنوان", "تفاصيل الطلب", "الدفع"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          textDirection: TextDirection.ltr,
          children: List.generate(steps.length * 2 - 1, (index) {
            if (index % 2 == 0) {
              final stepIndex = index ~/ 2;
              final isCurrent = widget.currentStep == stepIndex;
              final isCompleted = widget.currentStep > stepIndex;

              return Column(
                children: [
                  if (isCurrent)
                    Icon(Icons.arrow_drop_down, color: Colors.orange, size: 24)
                  else
                    SizedBox(height: 24),

                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          isCompleted || isCurrent
                              ? Colors.orange
                              : Colors.grey.shade300,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      steps[stepIndex],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              final lineIndex = (index - 1) ~/ 2;
              final isHalfFilled = widget.currentStep == lineIndex;
              final isFilled = widget.currentStep > lineIndex;

              return Expanded(
                child: Container(
                  height: 2,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  child: FractionallySizedBox(
                    widthFactor:
                        isFilled
                            ? 1
                            : isHalfFilled
                            ? 0.5
                            : 0,
                    child: Container(height: 2, color: Colors.orange),
                  ),
                ),
              );
            }
          }),
        ),
      ],
    );
  }
}
