package com.asstar.app.common.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ValidateUtil {

	private static int width = 90;// ����ͼƬ��width
	private static int height = 34;// ����ͼƬ��height
	private static int codeCount = 4;// ����ͼƬ����ʾ��֤��ĸ���
	private static int xx = 15;
	private static int fontHeight = 26;
	private static int codeY = 26;
	static char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
			'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

	public static void getCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		// ����ͼ��buffer
		BufferedImage buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		// Graphics2D gd = buffImg.createGraphics();
		// Graphics2D gd = (Graphics2D) buffImg.getGraphics();
		Graphics gd = buffImg.getGraphics();
		// ����һ���������������
		Random random = new Random();
		// ��ͼ�����Ϊ��ɫ
		gd.setColor(Color.WHITE);
		gd.fillRect(0, 0, width, height);

		// �������壬����Ĵ�СӦ�ø���ͼƬ�ĸ߶�������
		Font font = new Font("Fixedsys", Font.BOLD, fontHeight);
		// �������塣
		gd.setFont(font);

		// ���߿�
		gd.setColor(Color.BLACK);
		gd.drawRect(0, 0, width - 1, height - 1);

		// �������10�������ߣ�ʹͼ���е���֤�벻�ױ���������̽�⵽��
		gd.setColor(Color.BLACK);
		for (int i = 0; i < 10; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			gd.drawLine(x, y, x + xl, y + yl);
		}

		// randomCode���ڱ��������������֤�룬�Ա��û���¼�������֤��
		StringBuffer randomCode = new StringBuffer();
		int red = 0, green = 0, blue = 0;

		// �������codeCount���ֵ���֤�롣
		for (int i = 0; i < codeCount; i++) {
			// �õ������������֤�����֡�
			String code = String.valueOf(codeSequence[random.nextInt(36)]);
			// �����������ɫ������������ɫֵ�����������ÿλ���ֵ���ɫֵ������ͬ��
			red = random.nextInt(255);
			green = random.nextInt(255);
			blue = random.nextInt(255);

			// �������������ɫ����֤����Ƶ�ͼ���С�
			gd.setColor(new Color(red, green, blue));
			gd.drawString(code, (i + 1) * xx, codeY);

			// ���������ĸ�����������һ��
			randomCode.append(code);
		}
		// ����λ���ֵ���֤�뱣�浽Session�С�
		HttpSession session = req.getSession();
		System.out.print(randomCode);
		session.setAttribute("code", randomCode.toString());

		// ��ֹͼ�񻺴档
		resp.setHeader("Pragma", "no-cache");
		resp.setHeader("Cache-Control", "no-cache");
		resp.setDateHeader("Expires", 0);

		resp.setContentType("image/jpeg");

		// ��ͼ�������Servlet������С�
		ServletOutputStream sos = resp.getOutputStream();
		ImageIO.write(buffImg, "jpeg", sos);
		sos.close();
	}

}
