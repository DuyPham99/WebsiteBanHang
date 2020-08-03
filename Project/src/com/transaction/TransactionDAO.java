package com.transaction;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public interface TransactionDAO {
	public void insertTransaction(Transaction trans) throws SQLException;
	public void deleteTransaction(int id) throws SQLException;
	public Transaction getTransaction(String id) throws SQLException;
	public HashMap< String  , Transaction>  getListTransaction() throws SQLException;
}
