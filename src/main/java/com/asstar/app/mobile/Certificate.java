package com.asstar.app.mobile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tencent.wechat.mp.aes.WXBizMsgCrypt;

@Controller
public class Certificate {
	@ResponseBody
	@RequestMapping(value = "/certificate", method = RequestMethod.GET)
	public static String certificate(String msg_signature, String timestamp, String nonce, String echostr)
			throws Exception {
		String sCorpID = "wx2f809e24ddde3a42";
		String sToken = "kipjRTPp";
		String sEncodingAESKey = "dWvmk6s9bwer4SJ2jqWMu2jObqHMLOoE5SiUPTyqG9R";

		WXBizMsgCrypt wxcpt = new WXBizMsgCrypt(sToken, sEncodingAESKey, sCorpID);
		String sVerifyMsgSig = msg_signature;
		String sVerifyTimeStamp = timestamp;
		String sVerifyNonce = nonce;
		String sVerifyEchoStr = echostr;
		String sEchoStr = null;
		try {
			sEchoStr = wxcpt.VerifyURL(sVerifyMsgSig, sVerifyTimeStamp, sVerifyNonce, sVerifyEchoStr);
			return sEchoStr;
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

	}
}
