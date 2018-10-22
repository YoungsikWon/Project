package com.java.finish;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class Room extends Thread {
	JFrame frame = new JFrame();
	JTextArea textarea = new JTextArea();
	JTextField inputText = new JTextField();

	private DataInputStream inputStream;
	private DataOutputStream outputStream;
	String userName;
	String roomName;
	ServerSocket server;
	Socket serverSocket;
	Vector<Room> rooms;

	public Room(ServerSocket server, Socket serverSocket, Vector<Room> rooms) {
		this.server = server;
		this.serverSocket = serverSocket;
		this.rooms = rooms;
		try {
			inputStream = connectInputStream();
			outputStream = connectOutputStream();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public synchronized void run() {
		try {
			while (true) {
				String msg = receiveDataFromClient();
				receiveMsgHandler(msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				serverSocket.close();
				rooms.remove(this);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public DataInputStream connectInputStream() throws Exception {
		inputStream = new DataInputStream(serverSocket.getInputStream());
		System.out.println("데이터를 받아오는 통로 연결");
		return inputStream;
	}

	public DataOutputStream connectOutputStream() throws Exception {
		outputStream = new DataOutputStream(serverSocket.getOutputStream());
		System.out.println("데이터를 보내는 통로 연결");
		return outputStream;
	}

	public void sendDataToClient(String msg) throws Exception {
		outputStream.writeUTF(msg);
		System.out.println("client에 " + msg + "를 전달했어요");
	}

	public String receiveDataFromClient() throws Exception {
		String obj = inputStream.readUTF();
		System.out.println("client에서 " + obj + "를 받았어요");
		return obj;
	}

	public String userNameList() {
		StringBuilder sendUserName = new StringBuilder();
		for (Room room : rooms) {
			if (this.roomName.equals(room.roomName)) {
				sendUserName.append(room.userName + "¶");
			}
		}
		System.out.println(sendUserName.toString());
		return "유저리스트¶" + sendUserName.toString();
	}

	public void broadCastInRoom(String msg) throws Exception {
		for (Room room : rooms) {
			if (this.roomName.equals(room.roomName)) {
				room.sendDataToClient(msg);
			}
		}
	}

	public String roomNameList() {
		StringBuilder sendRoomName = new StringBuilder();
		for (Room room : rooms) {
			if (this.userName.equals(room.userName)) {
				sendRoomName.append(room.roomName + "¶");
			}
		}
		System.out.println(sendRoomName);
		return "방리스트¶" + sendRoomName.toString();
	}

	public void broadCastInUser(String roomName) throws Exception {
		for (Room room : rooms) {
			if (this.userName.equals(room.userName)) {
				room.sendDataToClient(roomName);
			}
		}
		System.out.println("같은이름의 유저에게 모든 방을 보냄");
	}

	public void receiveMsgHandler(String msg) throws Exception {
		String[] msgs = msg.split("¶");
		switch (msgs[0]) {
		case "입장":
			System.out.println(msgs[0] + msgs[1] + msgs[2]);
			userName = msgs[1];
			roomName = msgs[2];
			System.out.println(userName);
			System.out.println(roomName);
			broadCastInRoom(userNameList());
			broadCastInUser(roomNameList());
			break;
		case "퇴장":
			rooms.remove(this);
			broadCastInRoom(userNameList());
			broadCastInUser(roomNameList());
			serverSocket.close();
			break;
		case "메시지":
			broadCastInRoom(msg);
			break;
		}
	}
}
