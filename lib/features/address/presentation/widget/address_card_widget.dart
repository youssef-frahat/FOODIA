import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressCardWidget extends StatelessWidget {
  final String city;
  final String address;
  final bool selected;
  final int id; // تمرير الـ id الخاص بالعنوان
  final Function()? onTap;
  final Function()? onDelete;
  final Function()? onEdit;

  const AddressCardWidget({
    super.key,
    required this.city,
    required this.address,
    required this.id, // استلام الـ id
    this.selected = false,
    this.onTap,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      width: double.infinity,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: REdgeInsets.symmetric(vertical: 8),
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    selected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off,
                    color: selected ? Colors.orange : Colors.grey,
                    size: 30,
                  ),
                  const SizedBox(width: 12),
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.orange,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      city,
                      style: const TextStyle(
                        color: Color(0xFF32343E),
                        fontSize: 14,
                        fontFamily: 'Changa',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      address,
                      style: const TextStyle(
                        color: Color(0xFF32343E),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                      size: 20,
                    ),
                    onPressed: onDelete, // وظيفة الحذف
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.black, size: 20),
                    onPressed: onEdit, // وظيفة التعديل
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
