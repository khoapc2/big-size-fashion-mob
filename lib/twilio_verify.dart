
import 'package:twilio_phone_verify/twilio_phone_verify.dart';

class TwilioVerify{
  TwilioPhoneVerify _twilioPhoneVerify = new TwilioPhoneVerify(
        accountSid: 'AC53d61aff1d3f4e8e5695d028a5bc2a3d', // replace with Account SID
        authToken: '7f163205787d01fda97921f0fbe52ec7',  // replace with Auth Token
        serviceSid: 'VA273633e2e110d0e1a2673766c45a5b60' // replace with Service SID
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