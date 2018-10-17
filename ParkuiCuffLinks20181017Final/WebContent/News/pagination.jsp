<%@page import="java.util.StringTokenizer"%>
<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
 
     String value  =  request.getParameter("Json2");
     try {
    	 
         JSONParser jsonParser = new JSONParser();
         JSONObject jsonObject = (JSONObject) jsonParser.parse(value);
         JSONArray bookInfoArray = (JSONArray) jsonObject.get("items");

    
         for(int i=0; i<bookInfoArray.size(); i++){
 
             JSONObject bookObject = (JSONObject) bookInfoArray.get(i);
         
      
             %>
             <div class="ui two column grid" style="text-align:center;">
						<div class="column" style="padding-left: 30px; padding-right: 0px; padding-top: 10px; padding-bottom: 20px;text-align: left; width:80%;">
							<a style="color: black" href="<%=bookObject.get("link")%>"><%=bookObject.get("title")%></a>
						</div>

					</div>
			
					<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
						<hr class="garo" style="" />
					</div>

             <% 
             
         }

      
     } catch (ParseException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
     }

    %>

                   