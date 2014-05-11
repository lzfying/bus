package com.bus.map.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bus.po.Station;

public class ConnectionMySql {

	
	public Connection getConnection(){
	Connection conn =null;
	String url = "jdbc:mysql://localhost:3306/map";
	String userName = "root";
	String password = "root";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = (Connection) DriverManager.getConnection(url,userName,password);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return conn;
	}

	public List<Station> getStation_List(String station_name){
		List<Station> list_sta=new ArrayList<Station>();
		Connection con = new ConnectionMySql().getConnection();
		Statement sql;
		try {
			sql = con.createStatement();
			String sqlstr="select station_name,baidu_lng,baidu_lat,sjcc,route_count from station_info where station_name like '%"+station_name+"%'";
			ResultSet result =sql.executeQuery(sqlstr);
			while(result.next()){
				Station sta=new Station();
				sta.setStation_name(result.getString("station_name"));
				sta.setBaidu_lng(result.getString("baidu_lng"));
				sta.setBaidu_lat(result.getString("baidu_lat"));
				sta.setSjcc(result.getString("sjcc"));
				sta.setRoute_count(result.getString("route_count"));
				list_sta.add(sta);
			}
			sql.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_sta;
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Connection con = new ConnectionMySql().getConnection();
		Statement sql;
		try {
			sql = con.createStatement();
			String sqlstr="select station_name from station_info where station_id=1";
			ResultSet result =sql.executeQuery(sqlstr);
			while(result.next()){
			System.out.println(result.getString("station_name"));
			}
			sql.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		

	}
}
