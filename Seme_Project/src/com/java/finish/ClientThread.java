package com.java.finish;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JTextField;

public class ClientThread extends Thread {
	JFrame frame = new JFrame();
	JTextField inputText = new JTextField();

	public Socket clientSocket;
	public DataInputStream inputStream;
	public DataOutputStream outputStream;
	public String userName;
	public ChatFriends cf = new ChatFriends();
	public String roomName = ChatFriends.roomName; 
	public ChatTing chat;
	public ArrayList<String> roomNames;
	public ArrayList<String> userNames;
	
	public ClientThread(Socket clientSocket) {
		this.clientSocket = clientSocket;
		try {
			inputStream = connectInputStream();
			outputStream = connectOutputStream();
			userName = (String) new SelectDAO().selectOne(LoginDisplay.code).get("name");
			sendDataToServer("입장¶" + userName + "¶" + roomName);
			sendDataToServer("메시지¶" + userName + "님이 입장하셨습니다.");
			chat = new ChatTing(true);
			eventHandler();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void run() {
		try {
			while (true) {
				String msg = receiveDataFromServer();
				receiveMsgHandler(msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
				outputStream.close();
				clientSocket.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public void eventHandler() {
		chat.tf.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				String msg = chat.tf.getText();
				try {
					sendDataToServer("메시지¶" +userName+": "+ msg);
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				chat.area.setCaretPosition(chat.area.getDocument().getLength());
				chat.tf.setText("");
			}
		});
		chat.jb2.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				try {
					sendDataToServer("메시지¶"+userName+"님이 퇴장 하셨습니다.");
					sendDataToServer("퇴장¶"+userName);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				chat.dispose();
			}
		});
	}

	public void receiveMsgHandler(String msg) throws Exception {
		String[] msgs = msg.split("¶");
		switch (msgs[0]) {
		case "메시지":
			chat.area.append(msgs[1]+"\n");
			break;
		case "방리스트":
			roomNames = new ArrayList<>();
			for (int i = 1; i < msgs.length; i++) {
				roomNames.add(msgs[i]);
			}
			System.out.println(roomNames);
			break;
		case "유저리스트":
			userNames = new ArrayList<>();
			for (int i = 1; i < msgs.length; i++) {
				userNames.add(msgs[i]);
			}
			System.out.println(userNames);
			chat.userarea.setText("참가자명단\n");
			for (String userName : userNames) {
				if(!"".equals(userName.trim())) {
					chat.userarea.append(userName + "\n");
				}
			}
			break;
		}
	}

	public DataInputStream connectInputStream() throws Exception {
		inputStream = new DataInputStream(clientSocket.getInputStream());
		System.out.println("데이터를 받아오는 통로 연결");
		return inputStream;
	}

	public DataOutputStream connectOutputStream() throws Exception {
		outputStream = new DataOutputStream(clientSocket.getOutputStream());
		System.out.println("데이터를 보내는 통로 연결");
		return outputStream;
	}

	public void sendDataToServer(String obj) throws Exception {
		outputStream.writeUTF(obj);
		System.out.println("server에 " + obj + "를 전달했어요");
	}

	public String receiveDataFromServer() throws Exception {
		String obj = inputStream.readUTF();
		System.out.println("server에서 온 " + obj + "를 받았어요");
		return obj;
	}

	public static void main(String[] args) {
		new Client("localhost", 3000);
	}
}
