import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/colors.dart';
import '../../models/expense_model.dart';
import '../../models/income_model.dart';
import '../../widgets/rounded_custom_button.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  // state to track the expense or income
  int _selectedMethod = 0;

  // Store selected item in dropdown menu
  ExpenseCategory _expenseCategory = ExpenseCategory.health;
  IncomeCategory _incomeCategory = IncomeCategory.salary;

  // text editing controllers for 3 text form fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime = DateTime.now();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethod == 0 ? kRed : kGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          // white color container is on the red one
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Stack(
              children: [
                // main container toggle screen
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: kWhite,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedMethod = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: _selectedMethod == 0 ? kRed : kWhite,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 55,
                                vertical: 16,
                              ),
                              child: Text(
                                "Expense",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: _selectedMethod == 0 ? kWhite : kBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedMethod = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: _selectedMethod == 1 ? kGreen : kWhite,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 55, vertical: 16),
                              child: Text(
                                "Income",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: _selectedMethod == 1 ? kWhite : kBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Amount adding area
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "How much ?",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kWhite.withOpacity(0.8),
                          ),
                        ),
                        const TextField(
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: kWhite,
                          ),
                          decoration: InputDecoration(
                              hintText: "0",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: kWhite,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ),

                // Form fields
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.30),
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: kWhite,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Form(
                      child: Column(
                        children: [
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                              ),
                            ),
                            style: const TextStyle(fontSize: 16, color: kGrey),
                            items: _selectedMethod == 0
                                ? ExpenseCategory.values.map((category) {
                                    return DropdownMenuItem(
                                        value: category,
                                        child: Text(category.name));
                                  }).toList()
                                : IncomeCategory.values.map((category) {
                                    return DropdownMenuItem(
                                        value: category,
                                        child: Text(category.name));
                                  }).toList(),
                            value: _selectedMethod == 0
                                ? _expenseCategory
                                : _incomeCategory,
                            onChanged: (value) {
                              setState(() {
                                _selectedMethod == 0
                                    ? _expenseCategory =
                                        value as ExpenseCategory
                                    : _incomeCategory = value as IncomeCategory;
                                // check assigning are correct
                                //print(_selectedMethod==0?_expenseCategory:_incomeCategory);
                              });
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Text form fields
                          TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                                hintText: "Title",
                                hintStyle: const TextStyle(color: kGrey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Text form fields
                          TextFormField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                                hintText: "Description",
                                hintStyle: const TextStyle(color: kGrey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Text form fields
                          TextFormField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Amount",
                              hintStyle: const TextStyle(color: kGrey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // flutter provided
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2025),
                                  ).then((value) {
                                    // will catch ok button
                                    if (value != null) {
                                      setState(() {
                                        _selectedDate = value;
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: kMainColor,
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: kWhite,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Select Date",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: kWhite,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                DateFormat.yMMMd().format(_selectedDate),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: kGrey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // flutter provided
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    if (value != null) {
                                      setState(() {
                                        _selectedTime = DateTime(
                                            _selectedDate.year,
                                            _selectedDate.month,
                                            _selectedDate.day,
                                            value.hour,
                                            value.minute);
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: kYellow,
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: kWhite,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Select Time",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: kWhite,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                DateFormat.jm().format(_selectedTime),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: kGrey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(
                            color: kLightGrey,
                            thickness: 3,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RoundedCustomButton(
                            buttonName: "Add",
                            buttonColor: _selectedMethod == 0 ? kRed : kGreen,
                          )
                        ],
                      ),
                    ),
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
