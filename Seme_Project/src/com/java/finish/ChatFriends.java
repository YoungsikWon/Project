package com.java.finish;

import java.awt.BorderLayout;
import java.awt.CardLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.border.EtchedBorder;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

public class ChatFriends implements ActionListener {
	JFrame jf_chatf = new JFrame();

	JPanel jp_search = new JPanel();
	JPanel jp_button = new JPanel();
	JPanel jp_room = new JPanel();
	JPanel jp_friend = new JPanel();
	JPanel jp_card = new JPanel();

	String[] f_header = { "회원번호", "이름", "상태메세지" };
	String[][] f_datas = new String[0][3];
	String[] r_header = { "방이름", "인원수" };
	String[][] r_datas = new String[0][2];

	CardLayout card = new CardLayout(0, 0);

	DefaultTableModel dtm_friend = new DefaultTableModel(f_datas, f_header);
	DefaultTableModel dtm_room = new DefaultTableModel(r_datas, r_header);

	JTable jt_friend = new JTable(dtm_friend);
	JTable jt_room = new JTable(dtm_room);

	JScrollPane jsp_fdisplay = new JScrollPane(jt_friend, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
			JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
	JScrollPane jsp_rdisplay = new JScrollPane(jt_room, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
			JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);

	JButton jb_search = new JButton("검색");
	JButton jb_out = new JButton("로그아웃");
	JButton jb_room = new JButton("방목록");
	JButton jb_friend = new JButton("친구목록");
	JButton jb_addroom = new JButton("방만들기");
	JButton jb_addfriend = new JButton("방입장");
	JButton jb_rdelet = new JButton("방삭제");
	JButton jb_fdelet = new JButton("친구삭제");
	JButton jb_refresh = new JButton("내정보수정");

	JTextField jtf_input = new JTextField();
	Client client;
	public static String roomName;
	JTableHeader jth_flist = jt_friend.getTableHeader();
	JTableHeader jth_rlist = jt_room.getTableHeader();

	Font f = new Font("맑은 고딕", Font.BOLD, 14);
	EtchedBorder jbtn_eb = new EtchedBorder();

	public void initDisplays() {
		jp_friend.add(jsp_fdisplay);
		jp_room.add(jsp_rdisplay);

		jb_search.addActionListener(this);
		jb_room.addActionListener(this);
		jb_friend.addActionListener(this);
		jb_addroom.addActionListener(this);
		jb_addfriend.addActionListener(this);
		jb_rdelet.addActionListener(this);
		jb_fdelet.addActionListener(this);
		jb_out.addActionListener(this);
		jb_refresh.addActionListener(this);

		jp_card.setLayout(card);
		jp_card.add("친구목록", jp_friend);
		jp_card.add("방목록", jp_room);

		jf_chatf.add("North", jp_search);
		jf_chatf.add("Center", jp_button);
		jf_chatf.add("South", jp_card);
		jf_chatf.setSize(480, 550);
		// jf_chatf.setResizable(false);
		jf_chatf.setVisible(true);
		jf_chatf.setTitle("친구들");
		jf_chatf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		jp_search.setLayout(new BorderLayout());
		jp_search.add("Center", jtf_input);
		jp_search.add("East", jb_search);

		jp_button.setLayout(new GridLayout(2, 4));

		jp_button.add(jb_friend);
		jp_button.add(jb_addfriend);
		jp_button.add(jb_fdelet);
		jp_button.add(jb_out);
		jp_button.add(jb_room);
		jp_button.add(jb_addroom);
		jp_button.add(jb_rdelet);
		jp_button.add(jb_refresh);
		jb_search.setBackground(new Color(255, 111, 157));
		jb_out.setBackground(new Color(255, 149, 184));
		jb_room.setBackground(new Color(255, 149, 184));
		jb_friend.setBackground(new Color(255, 149, 184));
		jb_addroom.setBackground(new Color(255, 149, 184));
		jb_addfriend.setBackground(new Color(255, 149, 184));
		jb_rdelet.setBackground(new Color(255, 149, 184));
		jb_fdelet.setBackground(new Color(255, 149, 184));
		jb_refresh.setBackground(new Color(255, 149, 184));

		jb_search.setBorder(jbtn_eb);
		jb_out.setBorder(jbtn_eb);
		jb_room.setBorder(jbtn_eb);
		jb_friend.setBorder(jbtn_eb);
		jb_addroom.setBorder(jbtn_eb);
		jb_addfriend.setBorder(jbtn_eb);
		jb_rdelet.setBorder(jbtn_eb);
		jb_fdelet.setBorder(jbtn_eb);
		jb_refresh.setBorder(jbtn_eb);

		jb_search.setForeground(Color.WHITE);
		jb_out.setForeground(Color.WHITE);
		jb_room.setForeground(Color.WHITE);
		jb_friend.setForeground(Color.WHITE);
		jb_addroom.setForeground(Color.WHITE);
		jb_addfriend.setForeground(Color.WHITE);
		jb_rdelet.setForeground(Color.WHITE);
		jb_fdelet.setForeground(Color.WHITE);
		jb_refresh.setForeground(Color.WHITE);

		jb_search.setFont(f);
		jb_out.setFont(f);
		jb_room.setFont(f);
		jb_friend.setFont(f);
		jb_addroom.setFont(f);
		jb_addfriend.setFont(f);
		jb_rdelet.setFont(f);
		jb_fdelet.setFont(f);
		jb_refresh.setFont(f);

		jp_friend.setBackground(new Color(255, 230, 242));
		jp_room.setBackground(new Color(255, 230, 242));

		// 테이블 헤더 설정 변경 해 볼까욥!
		jth_flist.setBackground(new Color(255, 183, 206));
		jth_rlist.setBackground(new Color(255, 183, 206));
		jth_flist.setFont(f);
		jth_rlist.setFont(f);
		jth_flist.setForeground(Color.GRAY);
		jth_rlist.setForeground(Color.GRAY);
		// 테이블 헤더 순서 변경 금지
		jth_flist.setReorderingAllowed(false);
		jth_rlist.setReorderingAllowed(false);
		// 테이블 헤더
		jth_flist.setResizingAllowed(false);
		jth_rlist.setResizingAllowed(false);
	}

	public void deleteEvent() {
		ArrayList<Integer> userCodes = new ArrayList<>();
		int[] rows = jt_friend.getSelectedRows();
		for (int i : rows) {
			int code = Integer.parseInt((String) dtm_friend.getValueAt(i, 0));
			System.out.println(code);
			userCodes.add(code);
		}
		System.out.println(userCodes);
		DeleteDAO del = new DeleteDAO();
		del.userDelete(userCodes);
		refresh();
	}

	public void removeRow(String getValue) {
		System.out.println("removeRow함수 호출");
		int rowCount = jt_room.getRowCount();
		ArrayList<String> values = new ArrayList<>();
		for (int i = 0; i < rowCount; i++) {
			 values.add((String) jt_room.getValueAt(i, 0));
		}
		System.out.println(values);
		for (String value : values) {
			if(getValue.equals(value)) {
				dtm_room.removeRow(values.indexOf(value));
				System.out.println(values.indexOf(value));
			}
		}
		while (dtm_friend.getRowCount() > 0) {
			dtm_friend.removeRow(0);
		}
	}

	public void refresh() {
		while (dtm_friend.getRowCount() > 0) {
			dtm_friend.removeRow(0);
		}
		SelectDAO select = new SelectDAO();
		ArrayList<HashMap<String, Object>> rows = new ArrayList<>();
		rows = select.selectALL();
		for (HashMap<String, Object> row : rows) {
			Vector<Object> user = new Vector<>();
			user.add(row.get("code"));
			user.add(row.get("name"));
			user.add(row.get("msg"));
			dtm_friend.addRow(user);
		}
	}

	public static void main(String[] args) {
		ChatFriends cf = new ChatFriends();
		cf.initDisplays();
	}

	public void searchName(String name) {
		while (dtm_friend.getRowCount() > 0) {
			dtm_friend.removeRow(0);
		}
		SelectDAO s = new SelectDAO();
		try {
			ArrayList<HashMap<String, Object>> rows = new ArrayList<HashMap<String, Object>>();
			rows = s.selectNames(name);
			for (HashMap<String, Object> row : rows) {
				Vector<Object> user = new Vector<>();
				user.add(row.get("code"));
				user.add(row.get("name"));
				user.add(row.get("msg"));
				dtm_friend.addRow(user);
			}
		} catch (Exception e) {
			JOptionPane.showMessageDialog(jf_chatf, "없어요", "ERROR", JOptionPane.ERROR_MESSAGE);
		}
	}

	public String makeRoomName(String msg) {
		roomName = JOptionPane.showInputDialog(msg);
		ArrayList<String> list = new ArrayList<>();
		for (int i = 0; i < dtm_room.getRowCount(); i++) {
			list.add((String) dtm_room.getValueAt(i, 0));
		}
		if (roomName != null && !"".equals(roomName.trim())) {
			if (list.contains(roomName)) {
				roomName = makeRoomName("이미 있는 방이름이에요 다시적어주세요");
				return roomName;
			} else {
				return roomName;
			}
		} else {
			roomName = makeRoomName("방이름을 꼭 입력하세요");
			return roomName;
		}
	}

	public void addRoom() {
		while (dtm_room.getRowCount() > 0) {
			dtm_room.removeRow(0);
		}
		ArrayList<String> roomlist = client.clientThread.roomNames;
		ArrayList<String> userlist = client.clientThread.userNames;
		System.out.println(roomlist);
		System.out.println(userlist);
		Integer size = userlist.size();
		for (String room : roomlist) {
			Vector<String> v = new Vector<>();
			v.add(room);
			v.add(size.toString());
			dtm_room.addRow(v);
		}
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		if (obj == jb_friend) {
			card.show(jp_card, "친구목록");
			System.out.println("친구목록버튼입니다!!!");
			refresh();
		} else if (obj == jb_room) {
			card.show(jp_card, "방목록");
			System.out.println("방버튼입니다^^");
			addRoom();
		} else if (obj == jb_addroom) {
			System.out.println("방만들기 버튼");
			roomName = makeRoomName("방을 만들어 주세요");
			client = new Client("192.168.0.221", 3000);
			card.show(jp_card, "방목록");
			JOptionPane.showMessageDialog(jf_chatf, "방이 만들어졌어요. 방목록 버튼 눌러주세요", "MAKE", JOptionPane.INFORMATION_MESSAGE);
		} else if (obj == jb_addfriend) {
			System.out.println("방입장 버튼");
			int i = jt_room.getSelectedRow();
			if (i == -1) {// 값이 비워져있니?
				roomName = makeRoomName("입장 할 방이름을 입력해 주세요.\n 없으면 만들도록 할게요~");
				client = new Client("192.168.0.221", 3000);
				JOptionPane.showMessageDialog(jf_chatf, "방이 만들어졌어요. 방목록 버튼 눌러주세요", "MAKE", JOptionPane.INFORMATION_MESSAGE);
			} else {
				roomName = (String) dtm_room.getValueAt(i, 0);
				client = new Client("192.168.0.221", 3000);
			}
		} else if (obj == jb_rdelet) {// 삭제버튼
			System.out.println("방삭제버튼");
		} else if (obj == jb_fdelet) {// 삭제버튼
			System.out.println("친구삭제버튼");
			deleteEvent();
		} else if (jb_out.equals(obj)) {// 로그아웃버튼
			System.exit(0);
			System.out.println("로그아웃버튼");
		} else if (obj == jb_search) {
			System.out.println("검색버튼");
			String s = jtf_input.getText();
			searchName(s);
		} else if (obj == jb_refresh) {
			System.out.println("친구수정버튼입니다.");
			AddChatData add = new AddChatData(this);
			int i = jt_friend.getSelectedRow();
			int code = Integer.parseInt((String) dtm_friend.getValueAt(i, 0));
			System.out.println(code);
			add.updateEvent(code);
			add.initUpdateDisplay();
		}
	}
}
