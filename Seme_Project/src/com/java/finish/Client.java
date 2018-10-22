package com.java.finish;

import java.net.Socket;

public class Client {
	public Socket clientSocket;
	public ClientThread clientThread;
	public String roomName;
	public Client(String host, int port) {
		try {
			clientSocket = throwSocket(host, port);
			clientThread = new ClientThread(clientSocket);
			clientThread.start();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Socket throwSocket(String host, int port) throws Exception {
		clientSocket = new Socket(host, port);
		System.out.println("server와 연결됨");
		return clientSocket;
	}
}
