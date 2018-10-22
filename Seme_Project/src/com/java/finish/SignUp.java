package com.java.finish;

import java.awt.Color;
import java.awt.Font;
import java.awt.Image;
import java.awt.TextField;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.EtchedBorder;

public class SignUp implements ActionListener {
	// 선언부
	DBConnection dbcon = new DBConnection();
	LoginDisplay login;
	SignUp sp;
	JFrame jf_si = new JFrame();
	JPanel jp_center = new JPanel();
	JLabel jlb_id = new JLabel("ID : ");
	JTextField jtf_id = new JTextField();
	JLabel jlb_bigo = new JLabel("상태메시지: ");
	JTextArea jta_bigo = new JTextArea(3, 20);
	JScrollPane jsp_bigo = new JScrollPane(jta_bigo,JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
	JLabel jlb_name = new JLabel("이름 :");
	TextField jtf_name = new TextField();
	JLabel jlb_pw = new JLabel("PW :");
	TextField jtf_pw = new TextField();
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	// 설정 버튼
	JButton jtb_ok = new JButton("확인");
	JButton jtb_cancel = new JButton("취소");
	Font f_label = new Font("맑은 고딕",Font.BOLD,14);
	Font f_button = new Font("맑은 고딕",Font.BOLD,16);
	EtchedBorder jbtn_eb  = new EtchedBorder();
	URL src_r = getClass().getResource("images/r2.png");
	URL src_t = getClass().getResource("images/tt.png");
	Image img_r = Toolkit.getDefaultToolkit().getImage(src_r);
	Image img_t = Toolkit.getDefaultToolkit().getImage(src_t);
	JLabel jl_img_r = new JLabel(new ImageIcon(img_r));
	JLabel jl_img_t = new JLabel(new ImageIcon(img_t));
	// 생성자
	public SignUp() {
		initDisplay();
	}

	public void initDisplay() {

		jtb_ok.addActionListener(this);
		jtb_cancel.addActionListener(this);

		jp_center.setLayout(null);
		jp_center.setBackground(new Color(255, 225, 240));
		
		jl_img_r.setBounds(60,285,330,120);
		jl_img_t.setBounds(20,450,420,60);
		jlb_name.setBounds(90, 50, 40, 20);
		jtf_name.setBounds(150, 50, 200, 20);
		jlb_id.setBounds(105, 90, 40, 20);
		jtf_id.setBounds(150, 90, 200, 20);
		jlb_pw.setBounds(95, 130, 40, 20);
		jtf_pw.setBounds(150, 130, 200, 20);
		jlb_bigo.setBounds(55, 170, 90, 20);
		jsp_bigo.setBounds(150, 170, 200, 80);
		jtb_ok.setBounds(110, 400, 100, 40);
		jtb_cancel.setBounds(250, 400, 100, 40);
		
		jp_center.add(jtb_ok);
		jp_center.add(jtb_cancel);
		jp_center.add(jlb_name);
		jp_center.add(jtf_name);
		jp_center.add(jlb_id);
		jp_center.add(jtf_id);
		jp_center.add(jlb_pw);
		jp_center.add(jtf_pw);
		jp_center.add(jlb_bigo);
		jp_center.add(jsp_bigo);
		jp_center.add(jl_img_r);
		jp_center.add(jl_img_t);
	
		jtf_pw.setEchoChar('*');
		jf_si.add("Center", jp_center);
		jf_si.setSize(480, 550);
		jf_si.setVisible(true);
		jf_si.setTitle("회원 가입");
		
		jlb_name.setFont(f_label);
		jlb_id  .setFont(f_label);
		jlb_pw  .setFont(f_label);
		jlb_bigo.setFont(f_label);
		jtb_ok    .setFont(f_button);
		jtb_cancel.setFont(f_button);
		
		jlb_name.setForeground(Color.GRAY); 
		jlb_id  .setForeground(Color.GRAY); 
		jlb_pw  .setForeground(Color.GRAY); 
		jlb_bigo.setForeground(Color.GRAY); 
		jtb_ok    .setForeground(Color.WHITE);
		jtb_cancel.setForeground(Color.WHITE);
		
		jtb_ok    .setBackground(new Color(255, 111, 157));
		jtb_cancel.setBackground(new Color(255, 111, 157));
		
		jtb_ok    .setBorder(jbtn_eb);
		jtb_cancel.setBorder(jbtn_eb);
	}

	public void insertUser() {
		HashMap<String, Object> userInfo = new HashMap<>();
		userInfo.put("id", jtf_id.getText());
		userInfo.put("pw", jtf_pw.getText());
		userInfo.put("name", jtf_name.getText());
		userInfo.put("msg", jta_bigo.getText());
		InsertDAO insert = new InsertDAO();
		insert.userInsert(userInfo);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		String label = e.getActionCommand();
		if ("확인".equals(label)) {
			insertUser();
			jf_si.dispose();
		}
		if ("취소".equals(label)) {
			jf_si.dispose();
		}
	}

}
