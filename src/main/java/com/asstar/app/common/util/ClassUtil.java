package com.asstar.app.common.util;

import java.util.Date;

public class ClassUtil {

	public static <T> boolean type(T t) {
		if (t instanceof Integer) {
			return true;
		} else if (t instanceof String) {
			return true;
		} else if (t instanceof Character) {
			return true;
		} else if (t instanceof Float) {
			return true;
		} else if (t instanceof Double) {
			return true;
		} else if (t instanceof Byte) {
			return true;
		} else if (t instanceof Short) {
			return true;
		} else if (t instanceof Long) {
			return true;
		} else if (t instanceof Boolean) {
			return true;
		} else if (t instanceof Date) {
			return true;
		} else {
			return false;
		}
	}

	public static <T> Object typeof(T t) {
		if (t instanceof Integer) {
			return Integer.class;
		} else if (t instanceof String) {
			return String.class;
		} else if (t instanceof Character) {
			return Character.class;
		} else if (t instanceof Float) {
			return Float.class;
		} else if (t instanceof Double) {
			return Double.class;
		} else if (t instanceof Byte) {
			return Byte.class;
		} else if (t instanceof Short) {
			return Short.class;
		} else if (t instanceof Long) {
			return Long.class;
		} else if (t instanceof Boolean) {
			return Boolean.class;
		} else if (t instanceof Date) {
			return Date.class;
		} else {
			return null;
		}
	}

}
