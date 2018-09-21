package model;

import java.sql.Timestamp;
import java.util.List;

public interface  ActDAO {
	public abstract ActBean selectByPK(int ActSNum);

	public abstract List<ActBean> selectAll();
	
	public abstract ActBean insert(ActBean bean);

	public abstract ActBean update(ActBean bean);
			
	public abstract boolean deleteByPK(int ActSNum);

	public abstract ActBean selectBymemberIDandcreateDate(ActBean bean);
	
	


	
}
