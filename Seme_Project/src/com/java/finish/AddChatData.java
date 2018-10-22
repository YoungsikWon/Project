package com.java.finish;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.BevelBorder;

public class AddChatData extends JDialog implements ActionListener {

	JPanel jp_center = new JPanel();

	JLabel jlb_id = new JLabel("아이디:");
	JTextField jtf_id = new JTextField(20);
	JLabel jlb_pw = new JLabel("비번:");
	JTextField jtf_pw = new JTextField(20);
	JLabel jlb_name = new JLabel("이름:");
	JTextField jtf_name = new JTextField(20);
	JLabel jlb_msg = new JLabel("상태메세지:");
	JTextField jtf_msg = new JTextField(20);

	JButton jbtn_upd = new JButton("수정");
	JButton jbtn_cancel = new JButton("취소");
	
	ChatFriends parent;
	Font f_label = new Font("맑은 고딕", Font.BOLD, 12);
	Font f_button = new Font("맑은 고딕", Font.BOLD, 14);
	BevelBorder jbtn_eb = new BevelBorder(BevelBorder.RAISED);
	HashMap<String, Object> user;
	int code;

	public AddChatData(ChatFriends parent) {
		this.parent = parent;
	}

	public void initUpdateDisplay() {
		jp_center.setLayout(null);
		
		jlb_id.setBounds(20, 20, 100, 20);
		jtf_id.setBounds(120, 20, 150, 20);
		jlb_pw.setBounds(20, 45, 100, 20);
		jtf_pw.setBounds(120, 45, 150, 20);
		jlb_name.setBounds(20, 70, 100, 20);
		jtf_name.setBounds(120, 70, 150, 20);
		jlb_msg.setBounds(20, 95, 100, 20);
		jtf_msg.setBounds(120, 95, 150, 20);
		
		jbtn_upd.setBounds(60, 130, 100, 25);
		jbtn_cancel.setBounds(180, 130, 100, 25);

		jp_center.add(jlb_id);
		jp_center.add(jtf_id);
		jp_center.add(jlb_pw);
		jp_center.add(jtf_pw);
		jp_center.add(jlb_name);
		jp_center.add(jtf_name);
		jp_center.add(jlb_msg);
		jp_center.add(jtf_msg);
						
		jp_center.add(jbtn_upd);
		jp_center.add(jbtn_cancel);
			
		jp_center.add(jlb_id);
		jp_center.add(jtf_id);
		jp_center.add(jlb_pw);
		jp_center.add(jtf_pw);
		
		jbtn_upd.addActionListener(this);
		jbtn_cancel.addActionListener(this);
		this.add("Center",jp_center);
		
		this.setTitle("내정보수정");
		this.setSize(350, 220);
		this.setVisible(true);
		
		jbtn_upd   .setBackground(new Color(255, 149, 184));
		jbtn_cancel.setBackground(new Color(255, 149, 184));
		
		jbtn_upd   .setBorder(jbtn_eb);
		jbtn_cancel.setBorder(jbtn_eb);
		
		jbtn_upd   .setForeground(Color.WHITE);
		jbtn_cancel.setForeground(Color.WHITE);
		
		jlb_id     .setFont(f_label);
		jlb_pw     .setFont(f_label);
		jlb_name   .setFont(f_label);
		jlb_msg    .setFont(f_label);
		jbtn_upd   .setFont(f_button);
		jbtn_cancel.setFont(f_button);
		
		jlb_id     .setForeground(Color.GRAY);
		jlb_pw     .setForeground(Color.GRAY);
		jlb_name   .setForeground(Color.GRAY);
		jlb_msg    .setForeground(Color.GRAY);
		jbtn_upd   .setForeground(Color.WHITE);
		jbtn_cancel.setForeground(Color.WHITE);
		
		jp_center.setBackground(new Color(255, 230, 242));
		
	}

	public void setUserInfo() {
		user = new HashMap<>();
		user.put("id", jtf_id.getText());
		user.put("pw", jtf_pw.getText());
		user.put("name", jtf_name.getText());
		user.put("msg", jtf_msg.getText());
		new InsertDAO().userInsert(user);
	}

	public void updateEvent(int code) {
		this.code = code;
		System.out.println(code);
		SelectDAO select = new SelectDAO();
		HashMap<String, Object> user = select.selectOne(code);
		System.out.println(user);
		jtf_id.setText((String) user.get("id"));
		jtf_pw.setText((String) user.get("pw"));
		jtf_name.setText((String) user.get("name"));
		jtf_msg.setText((String) user.get("msg"));
	}

	public void putUpdateValue() {
		UpdateDAO upd = new UpdateDAO();
		user = new HashMap<>();
		user.put("code", code);
		user.put("id", jtf_id.getText());
		user.put("pw", jtf_pw.getText());
		user.put("name", jtf_name.getText());
		user.put("msg", jtf_msg.getText());
		upd.userUpdate(user);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		String label = e.getActionCommand();
		if ("수정".equals(label)) {
			putUpdateValue();
			this.dispose();
			parent.refresh();
		}
		if ("등록".equals(label)) {
			System.out.println("등록버튼클릭");
			setUserInfo();
			this.dispose();
			parent.refresh();
		}
		if ("취소".equals(label)) {
			System.out.println("취소버튼클릭");
			this.dispose();
		}
	}

	/*
	 * public static void main(String[] args) { AddChatData acd = new AddChatData();
	 * acd.initDisplay(); }
	 */
}
