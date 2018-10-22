package com.java.finish;

import java.awt.Color;
import java.awt.Font;
import java.awt.Image;
import java.awt.List;
import java.awt.Toolkit;
import java.net.URL;

import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.EtchedBorder;
import javax.swing.border.TitledBorder;

public class ChatTing extends JFrame {
	public JMenuBar mb; // 메뉴바
	public JMenu screenMenu;// 메뉴
	public JButton jb1, jb2, jb3, bt1, bt2, bt3, bt4;// 버튼
	public JTextArea area; // 텍스트
	public JTextArea userarea = new JTextArea(); // 텍스트
	public JTextField jt_field, tf; // 텍스트 필드
	public JScrollPane scrollPane, sp_list; // 스크롤바
	public JPanel p; // 패널
	public List list; // List
	public JLabel la_msg, la_User, icon_jl; // 라벨
	public JList<String> li_inwon;
	public ImageIcon img, icon;
	public JMenuItem item, Load;
	public int isRoot = 0; // 방장 =1. 아니면 0
	public ButtonGroup hereGroup;
	static boolean isNew = false;
	URL src_r = getClass().getResource("images/1234.png");
	Image img_r = Toolkit.getDefaultToolkit().getImage(src_r);
	
	final String imgPath = "src\\com\\java\\finish\\images\\";
	private final static String newline = "\n";
	private static final String Swingconstants = null;
	
	JLabel jl_img_r = new JLabel(new ImageIcon(img_r));
	
	Font f_button = new Font("맑은 고딕",Font.BOLD,14); 
	EtchedBorder jbtn_eb  = new EtchedBorder();     

	public ChatTing(boolean isShow) {
		showView(isShow);
	}

	public void showView(boolean isShow) {
		setTitle("4조 채팅방");
		createMenu(); // 메뉴 생성, 프레임에 삽입
		Field(); // 텍스트 생성 setSize(800,600);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		scrollPane.setBounds(10, 10, 380, 390);
		la_msg.setBounds(10, 410, 60, 30);
		la_User.setBounds(400, 100, 120, 30);
		tf.setBounds(70, 410, 320, 30);
		sp_list.setBounds(400, 10, 120, 350);// 스크롤바
		la_User.setBorder(new TitledBorder("유저"));
		jb2.setBounds(400, 370, 120, 30);// 이모티콘
		jb1.setBounds(400, 410, 120, 30);// 입력
				
		jb1.setBackground(new Color(255, 149, 184));
		jb2.setBackground(new Color(255, 111, 157));
		
		jb1.setFont(f_button);
		jb2.setFont(f_button);
		jb1.setBorder(jbtn_eb);
	    jb2.setBorder(jbtn_eb);
	    
	    
	    p.add(jl_img_r);
		
		jl_img_r.setBounds(2,460,530,30);
	    
		setSize(550, 550);
		setLocation(700, 400);
		setVisible(isShow);
		
		
	}

	public void createMenu() {// 메뉴
		mb = new JMenuBar();
		item = new JMenuItem("Load");
		screenMenu = new JMenu("메뉴");
		screenMenu.setFont(new Font("HY엽서L", Font.PLAIN, (int) 10));
		screenMenu.add(new JMenuItem("전송"));
		screenMenu.add(new JMenuItem("초대"));
		screenMenu.add(new JMenuItem("강퇴"));
		screenMenu.add(new JMenuItem("방장권한"));
		screenMenu.add(new JMenuItem("방나가기"));
		screenMenu.addSeparator();
		mb.add(screenMenu);
		setJMenuBar(mb);
	}

	public void Field() {// 필드
		img = new ImageIcon(imgPath + "kakao.png");
		icon = new ImageIcon(imgPath + "Nike.png");
		area = new JTextArea();
		tf = new JTextField(15); // 텍스트필드 초기화
		scrollPane = new JScrollPane(area);
		sp_list = new JScrollPane(userarea);
		p = new JPanel(); // 패널 초기화
		jb1 = new JButton("입력"); // 버튼 초기화
		jb2 = new JButton("나가기"); // 버튼 초기화
		jb3 = new JButton("채팅창"); // 채팅창
		la_msg = new JLabel("Message");
		la_User = new JLabel("유저");
		scrollPane = new JScrollPane(area, JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
				JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);

		area.setLineWrap(true);// TextArea 가로길이를 벗어나는 text발생시 자동 줄바꿈
		this.getContentPane().add(area);
		this.getLayout();
		jb1.setForeground(Color.WHITE);// 버튼 안의 글자색 바꿈.
		jb2.setForeground(Color.WHITE);
		p.setLayout(null);
		scrollPane.setViewportView(area);
		p.setBackground(new Color(255, 225, 240));// 화면 색깔 바꿈.
		p.add(scrollPane);// 스크롤바
		p.add(la_msg);// 라벨 "Message"
		p.add(tf);// 텍스트필드
		p.add(sp_list);// 유저정보방
		p.add(jb1);// 입력
		p.add(jb2);// 이모티콘
		p.add(jb3);// 채팅창)
		add(p);// 전체실행
		tf.requestFocus();
	} 	
	// 채팅방 구문

	public static void main(String[] args) {
		ChatTing c = new ChatTing(false);
	}
}

