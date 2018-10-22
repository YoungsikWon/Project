package com.java.finish;

import java.net.ServerSocket;
import java.net.Socket;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class Server {
	JFrame frame = new JFrame();
	JTextArea textarea = new JTextArea();
	JTextField inputText = new JTextField();

	private ServerSocket server;
	private Socket serverSocket;
	private Vector<Room> rooms;
	private Room room;

	public Server(int port) {
		try {
			server = makeServer(port);
			rooms = new Vector<Room>();
			while (true) {
				serverSocket = catchSocket();
				room = new Room(server, serverSocket, rooms);
				rooms.add(room);
				room.start();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ServerSocket makeServer(int port) throws Exception {
		server = new ServerSocket(port);
		System.out.println("연결대기중...");
		return server;
	}

	public Socket catchSocket() throws Exception {
		serverSocket = server.accept();
		System.out.println(serverSocket.getInetAddress() + "와 연결됨");
		return serverSocket;
	}

	public static void main(String[] args) {
		new Server(3000);
	}
}
