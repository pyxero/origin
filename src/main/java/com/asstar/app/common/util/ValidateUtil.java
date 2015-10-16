package com.asstar.app.common.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ValidateUtil {

	private static int width = 90;// 定义图片的width
	private static int height = 34;// 定义图片的height
	private static int codeCount = 4;// 定义图片上显示验证码的个数
	private static int xx = 15;
	private static int fontHeight = 26;
	private static int codeY = 26;
	static char[] codeSequenceMul = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
			'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
	static char[] codeSequenceNum = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

	/**
	 * 
	 * @param req
	 * @param type
	 * @param len
	 * @return
	 * @throws IOException
	 */
	public static String createVerifyCode(HttpServletRequest req, int type, int len) throws IOException {
		char[] codeSequence = codeSequenceNum;
		if (type == 1) {
			codeSequence = codeSequenceMul;
		}
		String verifyCode = "";
		Random random = new Random();
		StringBuffer randomCode = new StringBuffer();
		for (int i = 0; i < len; i++) {
			// 得到随机产生的验证码数字。
			String code = String.valueOf(codeSequence[random.nextInt(36)]);
			// 将产生的四个随机数组合在一起。
			randomCode.append(code);
		}
		verifyCode = randomCode.toString();
		HttpSession session = req.getSession();
		session.setAttribute("verify", verifyCode);
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.MINUTE, 30);// 到期时间，30分钟后
		session.setAttribute("verifyExpire", cal);
		return verifyCode;
	}

	public static int checkVerifyCode(HttpServletRequest req, String verifyCode) throws IOException {
		HttpSession session = req.getSession();
		int status = 0;// 验证码不正确，1正确，2超时
		if (verifyCode == null || verifyCode.equals("") || !verifyCode.equals(session.getAttribute("verify"))) {
			Calendar verCal = (Calendar) session.getAttribute("verifyExpire");// 验证码生成时间
			Calendar calCur = Calendar.getInstance();// 当前时间
			calCur.setTime(new Date());
			if (verCal.after(calCur)) {
				status = 1;// 未过期
			}
		}
		return status;
	}

	public static void getCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		// 定义图像buffer
		BufferedImage buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		// Graphics2D gd = buffImg.createGraphics();
		// Graphics2D gd = (Graphics2D) buffImg.getGraphics();
		Graphics gd = buffImg.getGraphics();
		// 创建一个随机数生成器类
		Random random = new Random();
		// 将图像填充为白色
		gd.setColor(Color.WHITE);
		gd.fillRect(0, 0, width, height);

		// 创建字体，字体的大小应该根据图片的高度来定。
		Font font = new Font("Fixedsys", Font.BOLD, fontHeight);
		// 设置字体。
		gd.setFont(font);

		// 画边框。
		gd.setColor(Color.BLACK);
		gd.drawRect(0, 0, width - 1, height - 1);

		// 随机产生10条干扰线，使图象中的认证码不易被其它程序探测到。
		gd.setColor(Color.BLACK);
		for (int i = 0; i < 10; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			gd.drawLine(x, y, x + xl, y + yl);
		}

		// randomCode用于保存随机产生的验证码，以便用户登录后进行验证。
		StringBuffer randomCode = new StringBuffer();
		int red = 0, green = 0, blue = 0;

		// 随机产生codeCount数字的验证码。
		for (int i = 0; i < codeCount; i++) {
			// 得到随机产生的验证码数字。
			String code = String.valueOf(codeSequenceMul[random.nextInt(36)]);
			// 产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同。
			red = random.nextInt(255);
			green = random.nextInt(255);
			blue = random.nextInt(255);

			// 用随机产生的颜色将验证码绘制到图像中。
			gd.setColor(new Color(red, green, blue));
			gd.drawString(code, (i + 1) * xx, codeY);

			// 将产生的四个随机数组合在一起。
			randomCode.append(code);
		}
		// 将四位数字的验证码保存到Session中。
		HttpSession session = req.getSession();
		System.out.print(randomCode);
		session.setAttribute("code", randomCode.toString());

		// 禁止图像缓存。
		resp.setHeader("Pragma", "no-cache");
		resp.setHeader("Cache-Control", "no-cache");
		resp.setDateHeader("Expires", 0);

		resp.setContentType("image/jpeg");

		// 将图像输出到Servlet输出流中。
		ServletOutputStream sos = resp.getOutputStream();
		ImageIO.write(buffImg, "jpeg", sos);
		sos.close();
	}

}
