package com.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.mozilla.universalchardet.UniversalDetector;
import org.springframework.web.multipart.MultipartFile;

public class Encoder {
	public static String urlEncode(String tmp) {
		String url = null;
		try {
			url = URLEncoder.encode(tmp, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return url;
	}
	
	public static String utfToIso(String tmp){
		String iso = null;
		try {
			iso = new String(tmp.getBytes("UTF-8"), "ISO-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return iso;
	}
	
	public static String isoToUTF(String tmp) {
		String utf = null;
		try {
			utf = new String(tmp.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return utf;
	}

	public static String findMultipartFileEncoding(MultipartFile file) throws IOException {
		byte[] buf = new byte[4096];
		InputStream fis = file.getInputStream();

		UniversalDetector detector = new UniversalDetector(null);

		int nread;
		while ((nread = fis.read(buf)) > 0 && !detector.isDone()) {
			detector.handleData(buf, 0, nread);
		}
		detector.dataEnd();

		String encoding = detector.getDetectedCharset();
		if (encoding != null) {
			System.out.println("Detected encoding = " + encoding);
		} else {
			System.out.println("No encoding detected.");
		}

		detector.reset();
		return encoding;
	}
	
	// 찾아보자 인코딩
	public static void stringEncodingChecker(String str) throws UnsupportedEncodingException{
		System.out.println("utf-8(1) : " + new String(str.getBytes("utf-8"), "euc-kr"));
		System.out.println("utf-8(2) : " + new String(str.getBytes("utf-8"), "ksc5601"));
		System.out.println("utf-8(3) : " + new String(str.getBytes("utf-8"), "x-windows-949"));
		System.out.println("utf-8(4) : " + new String(str.getBytes("utf-8"), "iso-8859-1"));
		 
		System.out.println("iso-8859-1(1) : " + new String(str.getBytes("iso-8859-1"), "euc-kr"));
		System.out.println("iso-8859-1(2) : " + new String(str.getBytes("iso-8859-1"), "ksc5601"));
		System.out.println("iso-8859-1(3) : " + new String(str.getBytes("iso-8859-1"), "x-windows-949"));
		System.out.println("iso-8859-1(4) : " + new String(str.getBytes("iso-8859-1"), "utf-8"));
		 
		System.out.println("euc-kr(1) : " + new String(str.getBytes("euc-kr"), "ksc5601"));
		System.out.println("euc-kr(2) : " + new String(str.getBytes("euc-kr"), "utf-8"));
		System.out.println("euc-kr(3) : " + new String(str.getBytes("euc-kr"), "x-windows-949"));
		System.out.println("euc-kr(4) : " + new String(str.getBytes("euc-kr"), "iso-8859-1"));
		 
		System.out.println("ksc5601(1) : " + new String(str.getBytes("ksc5601"), "euc-kr"));
		System.out.println("ksc5601(2) : " + new String(str.getBytes("ksc5601"), "utf-8"));
		System.out.println("ksc5601(3) : " + new String(str.getBytes("ksc5601"), "x-windows-949"));
		System.out.println("ksc5601(4) : " + new String(str.getBytes("ksc5601"), "iso-8859-1"));
		 
		System.out.println("x-windows-949(1) : " + new String(str.getBytes("x-windows-949"), "euc-kr"));
		System.out.println("x-windows-949(2) : " + new String(str.getBytes("x-windows-949"), "utf-8"));
		System.out.println("x-windows-949(3) : " + new String(str.getBytes("x-windows-949"), "ksc5601"));
		System.out.println("x-windows-949(4) : " + new String(str.getBytes("x-windows-949"), "iso-8859-1"));

	}

}