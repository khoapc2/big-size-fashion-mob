
import 'package:twilio_phone_verify/twilio_phone_verify.dart';

class TwilioVerify{
  TwilioPhoneVerify _twilioPhoneVerify = new TwilioPhoneVerify(
        accountSid: 'AC99a8f74e1faf99acb4be675365385e0e', // replace with Account SID
        authToken: '4938c50fddcb2117c7c774343c7425f9',  // replace with Auth Token
        serviceSid: 'VA44d8396103c55e62ab415a99fd83fb3b' // replace with Service SID
        );
  String? phone;
  bool? timeLeft;

        TwilioPhoneVerify getTwilioPhoneVerify(){
          return this._twilioPhoneVerify;
        }
        void setPhone(String phone){
            this.phone = phone;
        }
        String? getPhone(){
          return this.phone;
        }

        void setTimeLeft(bool? timeLeft){
            this.timeLeft = timeLeft;
        }
        bool? getTimeLeft(){
          return this.timeLeft;
        }
}