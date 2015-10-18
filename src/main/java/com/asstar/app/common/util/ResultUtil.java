package com.asstar.app.common.util;

import com.asstar.app.common.entity.ResultEntity;

public class ResultUtil {

	public static ResultEntity set(boolean flag, String msg, int status) {
		ResultEntity result = new ResultEntity();
		result.setFlag(flag);
		result.setMsg(msg);
		result.setStatus(status);
		return result;
	}

	public static ResultEntity set(boolean flag, String msg) {
		ResultEntity result = new ResultEntity();
		result.setFlag(flag);
		result.setMsg(msg);
		return result;
	}

	public static ResultEntity set(boolean flag) {
		ResultEntity result = new ResultEntity();
		result.setFlag(flag);
		return result;
	}
}
