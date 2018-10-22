package com.java.finish;

import java.awt.Color;
import java.awt.Font;
import java.awt.Image;
import java.awt.Label;
import java.awt.TextField;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.EtchedBorder;

public class LoginDisplay extends JFrame implements ActionListener {
	// 선언부

	JPanel jp_center = new JPanel();
	JPanel jp_img = new JPanel();

	Label lb_id = new Label("ID:");
	Label lb_pw = new Label("PW:");
	TextField jtf_id = new TextField();
	TextField jtf_pw = new TextField();
	JButton lg = new JButton("로그인");
	JButton sign_up = new JButton("회원 가입");

	Font f_label = new Font("맑은 고딕", Font.BOLD, 14);
	Font f_button = new Font("맑은 고딕", Font.BOLD, 16);
	EtchedBorder jbtn_eb = new EtchedBorder();
	URL src_r = getClass().getResource("images/rabbit.png");
	URL src_c = getClass().getResource("images/1.png");
	Image img_r = Toolkit.getDefaultToolkit().getImage(src_r);
	Image img_c = Toolkit.getDefaultToolkit().getImage(src_c);
	JLabel jl_img_r = new JLabel(new ImageIcon(img_r));
	JLabel jl_img_c = new JLabel(new ImageIcon(img_c));
	public static int code;

	// 생성자
	public LoginDisplay() {
		initdisplay();
	}

	// 화면출력부
	public void initdisplay() {
		lg.addActionListener(this);
		sign_up.addActionListener(this);

		jp_center.setLayout(null);
		jp_center.setBackground(new Color(255, 225, 240));

		jl_img_r.setBounds(30, 80, 293, 288);
		jl_img_c.setBounds(190, 90, 293, 288);
		lb_id.setBounds(90, 350, 30, 20);
		jtf_id.setBounds(130, 350, 200, 20);
		lb_pw.setBounds(90, 380, 30, 20);
		jtf_pw.setBounds(130, 380, 200, 20);
		lg.setBounds(355, 355, 100, 40);
		sign_up.setBounds(170, 440, 130, 40);

		jp_center.add(lb_id);
		jp_center.add(jtf_id);
		jp_center.add(lb_pw);
		jp_center.add(jtf_pw);
		jp_center.add(lg);
		jp_center.add(sign_up);
		jp_center.add(jl_img_r);
		jp_center.add(jl_img_c);
		jtf_pw.setEchoChar('*');

		lb_id.setForeground(Color.GRAY);
		lb_pw.setForeground(Color.GRAY);
		lg.setForeground(Color.WHITE);
		sign_up.setForeground(Color.WHITE);

		lb_id.setFont(f_label);
		jtf_id.setFont(f_label);
		lb_pw.setFont(f_label);
		jtf_pw.setFont(f_label);
		lg.setFont(f_button);
		sign_up.setFont(f_button);

		lg.setBackground(new Color(255, 111, 157));
		sign_up.setBackground(new Color(255, 149, 184));

		lg.setBorder(jbtn_eb);
		sign_up.setBorder(jbtn_eb);

		this.add("Center", jp_center);
		this.setSize(480, 550);// 창의 가로와 세로 길이 지정
		this.setVisible(true);
		this.setResizable(false);
		this.setTitle("토깽이 톡");
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}

	// 메인메소드
	public static void main(String[] args) {
		new LoginDisplay();
	}

	public void check() {
		ArrayList<HashMap<String, Object>> users = new ArrayList<>();
		SelectDAO s = new SelectDAO();
		users = s.selectALL();
		ArrayList<String> userId = new ArrayList<>();
		ArrayList<String> userPw = new ArrayList<>();
		for (HashMap<String, Object> user : users) {
			userId.add((String) user.get("id"));
			userPw.add((String) user.get("pw"));
		}
		for (int i = 0; i < userId.size(); i++) {
			if (userId.get(i).equals(jtf_id.getText()) && userPw.get(i).equals(jtf_pw.getText())) {
				JOptionPane.showMessageDialog(this, "로그인성공", "SUCCESS", JOptionPane.INFORMATION_MESSAGE);
				this.dispose();
				ChatFriends cf = new ChatFriends();
				cf.initDisplays();
				code = new SelectDAO().selectOneCode(jtf_id.getText(), jtf_pw.getText());
				System.out.println(code);
				break;
			} else {
				if (i == userId.size() - 1) {
					JOptionPane.showMessageDialog(this, "로그인실패", "ERROR", JOptionPane.ERROR_MESSAGE);
				}
			}
		}
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		String label = e.getActionCommand();
		if ("로그인".equals(label)) {
			System.out.println("로그인 버튼 호출성공");
			check();
		}
		if ("회원 가입".equals(label)) {
			new SignUp();
		}
	}
}
