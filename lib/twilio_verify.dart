
import 'package:twilio_phone_verify/twilio_phone_verify.dart';

class TwilioVerify{
  TwilioPhoneVerify _twilioPhoneVerify = new TwilioPhoneVerify(
        accountSid: 'AC8a6e6d6fe2867871a384f317ca3bf3a7', // replace with Account SID
        authToken: 'd23a2eef5d89c77200ec9497190b9a36',  // replace with Auth Token
        serviceSid: 'VA5ebe21b94ab43b754c85fe4230affb62' // replace with Service SID
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