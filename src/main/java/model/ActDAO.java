package model;

import java.sql.Timestamp;
import java.util.List;

public interface  ActDAO {
	public abstract ActBean selectByPK(int ActSNum);

	public abstract List<ActBean> selectAll();
	
	public abstract ActBean insert(ActBean bean);

	public abstract ActBean update(ActBean bean);
			
	public abstract boolean deleteByPK(int ActSNum);

	public abstract ActBean selectByActID(ActBean bean);
	
	public abstract List<ActBean> selectTopSix();
	
	public abstract List<ActBean> Newset();

	public abstract ActBean findByPK(Integer actSNum);
	
	public abstract List<ActBean> findHostedByOne(Integer memberID,String sorting,int p,int num);
	
	public abstract Object[] findByMultiConditions(String keyword,String status,String sorting,int p,int num);
	
	public abstract ActBean selectBymemberIDandcreateDate(ActBean bean);
}
