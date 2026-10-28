package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.bean.AccountBean;
import com.util.DbConnection;

public class AccountDao {

	// select * from accounts
	public ArrayList<AccountBean> getAllAccounts() {

		ArrayList<AccountBean> list = new ArrayList<AccountBean>();

		String selectQ = "select * from accounts";

		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement(selectQ);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
//				int accountId = rs.getInt("accountId");
//				String accountName = rs.getString("accountName");
//				float amount = rs.getFloat("amount");
//				int thresholdLimit = rs.getInt("thresholdLimit");

				AccountBean accBean = new AccountBean();
				accBean.setAccountId(rs.getInt("accountId"));
				accBean.setAmount(rs.getFloat("amount"));
				accBean.setAccountName(rs.getString("accountName"));
				accBean.setThresholdLimit(rs.getInt("thresholdLimit"));
				list.add(accBean);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	// select * from accounts
		public ArrayList<AccountBean> getAllAccountsByUserId(int userId) {

			ArrayList<AccountBean> list = new ArrayList<AccountBean>();

			String selectQ = "select * from accounts where userId = ? ";

			try {
				Connection con = DbConnection.getConnection();
				PreparedStatement pstmt = con.prepareStatement(selectQ);
				pstmt.setInt(1, userId); 
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
//					int accountId = rs.getInt("accountId");
//					String accountName = rs.getString("accountName");
//					float amount = rs.getFloat("amount");
//					int thresholdLimit = rs.getInt("thresholdLimit");

					AccountBean accBean = new AccountBean();
					accBean.setAccountId(rs.getInt("accountId"));
					accBean.setAmount(rs.getFloat("amount"));
					accBean.setAccountName(rs.getString("accountName"));
					accBean.setThresholdLimit(rs.getInt("thresholdLimit"));
					list.add(accBean);

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			return list;
		}
}
