package com.cufflink.blockchain;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;

public class Block {
	String previousHash;
	String timestamp;
	List<Transaction> pendingTransactions = new ArrayList<>();
	String hash;
	int nonce;

	// �?�??? ???��??
	public Block(List<Transaction> pendingTransactions, String previousHash) {
		this.previousHash = previousHash;
		Date today = new Date();
	    SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss a");
		this.timestamp = date.format(today);
		this.pendingTransactions = pendingTransactions;
		this.hash = calculateHash();
	}

	// �?�??? ?��??
	public String calculateHash() {
		return DigestUtils.sha256Hex(previousHash + timestamp + pendingTransactions + nonce);
	}

	// �?�? �?�?
	public void mineBlock(int difficulty) {
		String target = new String(new char[difficulty]).replace('\0', '0'); // Create a string with difficulty * "0"
		while (!hash.substring(0, difficulty).equals(target)) {
			nonce++;
			hash = calculateHash();
		}
		System.out.println("Block Mined!!! : " + hash);
	}
}
