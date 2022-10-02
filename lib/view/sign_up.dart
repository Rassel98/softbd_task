import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soft_bd_task/utils/constant.dart';
import 'package:soft_bd_task/provider/softbd_task_provider.dart';

class SignUpPage extends StatelessWidget {
  static const String routeName='/sign_up';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final rePassController = TextEditingController();
   
   // bool isObscureText = true;
   // String ?dob;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Sign Up',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                const SizedBox(height: 30,),
                Form(
                  key: formKey,
                  child: Flexible(
                    child: Consumer<SoftbdTaskProvider>(
                      builder: (context, provider, child) => ListView(
                        shrinkWrap: true,
                        //physics: NeverScrollableScrollPhysics(),
                        children: [
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: 'Email Address',
                              prefixIcon: Icon(Icons.email,),

                            ),
                            validator: (value) {
                              if(value.toString().isEmpty||value.toString()==null){
                                return 'Please valid email address';
                              }
                            },
                          ),
                          DropdownButtonFormField(
                            style: const TextStyle(color: Colors.black26),
                              //icon: Icon(Icons.person,),
                                alignment: Alignment.centerLeft,
                                items:gender.map((e) =>DropdownMenuItem(
                                    value:e,
                                    child: Row(
                                      children: [
                                        const Icon(Icons.person,),
                                        Text(provider.genderValue,style: const TextStyle(color: Colors.black),),
                                      ],
                                    ))
                                ).toList(),
                                onChanged: (gender){
                                  provider.setGender(gender!);


                                }),
                          TextButton(
                              onPressed: (){
                                provider.selectDate(context);
                              },
                              child: Row(
                                children: [
                                  const Icon(Icons.calendar_month),
                                  const SizedBox(width: 8,),
                                  Text(provider.dob == null ? 'No Date Chosen' : provider.dob!),
                                ],
                              )),


                          TextFormField(
                            obscureText:provider.isObscurePassText,
                            textInputAction: TextInputAction.done,
                            controller: passController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              //border: const OutlineInputBorder(),
                              hintText: 'Password',
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(provider.isObscurePassText
                                    ? Icons.visibility_off
                                    : Icons.visibility),

                                onPressed: () {
                                  provider.setobScurePass();
                                }
                              ),
                              filled: true,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field must not be empty';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            obscureText:provider.isObscureRePassText,
                            textInputAction: TextInputAction.done,
                            controller: rePassController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              //border: const OutlineInputBorder(),
                              hintText: 'Re-Type Password',
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(provider.isObscureRePassText
                                    ? Icons.visibility_off
                                    : Icons.visibility),

                                onPressed: () {
                                  provider.setobScureRePass();
                                }
                              ),
                              filled: true,
                            ),

                            validator: (value) {
                              if (value.toString() !=passController.text ||value==null) {
                                return 'Password cannot match';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15,),
                          InkWell(splashColor: Colors.pink,
                            onTap: (){

                            },
                            child: Ink(
                              // alignment: Alignment.center,
                              height: 70,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius:BorderRadius.circular(35) ,
                              ),
                              child: const Center(child: Text('Sign Up',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
