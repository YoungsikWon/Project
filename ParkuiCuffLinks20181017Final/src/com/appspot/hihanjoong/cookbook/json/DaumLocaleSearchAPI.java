package com.appspot.hihanjoong.cookbook.json;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


public class DaumLocaleSearchAPI {

	public static void main(String[] args) {

		/* http://dna.daum.net/myapi/dataapi/new 에서 발급받은 키를 입력 */

		String apiKey = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx";

		String requestURI = "http://apis.daum.net/local/geo/addr2coord?apikey=" + apiKey + "&output=json&q=";

		// printAddressToCoord(requestURI, "역삼");

		parseAddressToCoord(requestURI, "야탑");

	}

	public static void printAddressToCoord(String requestURI, String address) {

		try {

			address = URLEncoder.encode(address, "UTF-8");

		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();

		}

		BufferedReader bufferedReader = openJSONReader(requestURI + address);

		printJSONData(bufferedReader);

		closeJSONReader(bufferedReader);

	}

	public static void parseAddressToCoord(String requestURI, String address) {

		try {

			address = URLEncoder.encode(address, "UTF-8");

		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();

		}

		BufferedReader bufferedReader = openJSONReader(requestURI + address);

		parseJSONData(bufferedReader);

		closeJSONReader(bufferedReader);

	}

	public static void printJSONData(BufferedReader bufferedReader) {

		String inputLine;

		try {

			while ((inputLine = bufferedReader.readLine()) != null) {

				System.out.println(inputLine);

			}

		} catch (IOException e) {

			e.printStackTrace();

		}

	}

	public static void parseJSONData(BufferedReader bufferedReader) {

		try {

			JSONParser jsonParser = new JSONParser();

			JSONObject jsonObject = (JSONObject) jsonParser.parse(bufferedReader);

			JSONObject channelObject = (JSONObject) jsonObject.get("channel");

			System.out.println("================= " + "전체 검색결과" + " ================== ");
			System.out.println("\tresult : " + channelObject.get("result"));
			System.out.println("\tpageCount : " + channelObject.get("pageCount"));
			System.out.println("\ttitle : " + channelObject.get("title"));
			System.out.println("\ttotalCount : " + channelObject.get("totalCount"));
			System.out.println("\tdescription : " + channelObject.get("description"));
			JSONArray itemObjectList = (JSONArray) channelObject.get("item");

			int i = 1;

			for (Object tempObject : itemObjectList) {
				System.out.println("");
				System.out.println("================= " + i + "번째 검색결과" + " ================= ");
				tempObject = (JSONObject) tempObject;
				System.out.println("\ttitle : " + ((JSONObject) tempObject).get("title"));
				System.out.println("\tpoint_x : " + ((JSONObject) tempObject).get("point_x"));
				System.out.println("\tpoint_y : " + ((JSONObject) tempObject).get("point_y"));

				i++;

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	public static BufferedReader openJSONReader(String requestURI) {

		URL requestURL = null;

		try {

			requestURL = new URL(requestURI);

		} catch (MalformedURLException e) {

			e.printStackTrace();

		}

		URLConnection urlConnection = null;

		try {

			urlConnection = requestURL.openConnection();

		} catch (IOException e) {

			e.printStackTrace();

		}

		BufferedReader bufferedReader = null;

		try {

			bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));

		} catch (IOException e) {

			e.printStackTrace();

		}

		return bufferedReader;

	}

	public static boolean closeJSONReader(BufferedReader bufferedReader) {

		boolean closeJSONReaderResult = true;

		try {
			bufferedReader.close();

		} catch (IOException e) {

			e.printStackTrace();
			closeJSONReaderResult = false;

		}

		return closeJSONReaderResult;

	}

}
