package com.cufflink.blockchain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/blockchain")
public class BlockChain {
	public static List<Block> chain;
	public static int difficulty = 3;
	public static List<Transaction> pendingTransactions;
	public int miningReward = 1000;

	public BlockChain() {
		chain = new ArrayList<>();
		pendingTransactions = new ArrayList<>();
		System.out.println("GenesisBlock 생성");
		Block block = createGenesisBlock();
		chain.add(block);
		minePendingTransactions("Master");
		minePendingTransactions("Master");
	}

	public Block createGenesisBlock() {
		return new Block(pendingTransactions, "Genesis Block");
	}

	public Block getLatestBlock() {
		return chain.get(chain.size() - 1);
	}

	public boolean isChainValid() {
		for (int i = 1; i < chain.size(); i++) {
			Block currentBlock = chain.get(i);
			Block previousBlock = chain.get(i - 1);

			if (!currentBlock.hash.equals(currentBlock.calculateHash()))
				return false;
			if (!currentBlock.previousHash.equals(previousBlock.hash))
				return false;
		}
		return true;
	}
	
	@RequestMapping(value = "/createTransaction", method = RequestMethod.POST)
	public List<Transaction> createTransaction(@RequestParam Map<String, Object> pMap) {
		System.out.println(pMap);
		Transaction transaction = new Transaction((String) pMap.get("from"), (String) pMap.get("to"),
				Integer.parseInt((String) pMap.get("amount")));
		if (getBalance((String) pMap.get("from")) < Integer.parseInt((String) pMap.get("amount"))) {
			System.out.println("적당한 금액을 입력해주세요");
			return null;
		} else {
			pendingTransactions.add(transaction);
			return pendingTransactions;
		}
	}

	// 거래내역을 넣고나서 체이닝
	public void minePendingTransactions(String miningRewardAddress) {
		Block newBlock = new Block(pendingTransactions, chain.get(chain.size() - 1).hash);
		newBlock.mineBlock(difficulty);
		chain.add(newBlock);
		pendingTransactions = new ArrayList<>();
		Transaction newTran = new Transaction("CoinManager", miningRewardAddress, miningReward);
		pendingTransactions.add(newTran);
	}

	@RequestMapping(value = "mining", method = RequestMethod.POST)
	public List<Block> miningpage() {
		minePendingTransactions("Master");
		return chain;
	}

	public int getBalance(String address) {
		int balance = 0;
		// Loop over each block and each transaction inside the block
		for (Block block : chain) {
			for (Transaction trans : block.pendingTransactions) {

				// If the given address is the sender -> reduce the balance
				if (trans.from.equals(address)) {
					balance -= trans.amount;
				}

				// If the given address is the receiver -> increase the balance
				if (trans.to.equals(address)) {
					balance += trans.amount;
				}
			}
		}
		return balance;
	}
	
	@RequestMapping(value="myCoin", method = RequestMethod.POST)
	public int myCoin(@RequestParam("email") String email) {
		int coin = 0;
		coin = getBalance(email);
		return coin;
	}
	
	@RequestMapping(value="/trans",method=RequestMethod.POST)
	public List<Map<String,Object>> transactions(@RequestParam("address") String address){
		List<Map<String,Object>> list = new ArrayList<>();
		int balance = 0;
		for (Block block : chain) {
			for (Transaction trans : block.pendingTransactions) {
				Map<String,Object> inputCoin = new HashMap<>();
				Map<String,Object> outputCoin = new HashMap<>();
				if (trans.from.equals(address)) {
					balance -= trans.amount;
					inputCoin.put("from", trans.from);
					inputCoin.put("to", trans.to);
					inputCoin.put("amount", trans.amount);
					inputCoin.put("date", block.timestamp);
					inputCoin.put("balance", balance);
					list.add(inputCoin);
				}

				if (trans.to.equals(address)) {
					balance += trans.amount;
					outputCoin.put("from", trans.from);
					outputCoin.put("to", trans.to);
					outputCoin.put("amount", trans.amount);
					outputCoin.put("date", block.timestamp);
					outputCoin.put("balance", balance);
					list.add(outputCoin);
				}
			}
		}
		return list;
	}
	
}
