package model;

import java.sql.Timestamp;
import java.util.List;

public interface  ActDAO {
	public abstract ActBean selectByPK(int ActSNum);

	public abstract List<ActBean> selectAll();
	
	public abstract ActBean insert(ActBean bean);

	public abstract ActBean update(ActBean bean);
			
	public abstract boolean deleteByPK(int ActSNum);

<<<<<<< HEAD
	public abstract ActBean selectByActID(ActBean bean);
	
	public abstract List<ActBean> selectTopSix();
	
	public abstract List<ActBean> Newset();
=======
	public abstract ActBean selectBymemberIDandcreateDate(ActBean bean);
	
	
>>>>>>> c89f0141882deea9b6670f84845d38c26d69ae3c


	
}
