package model;

import java.util.List;

public interface ActDAO {
	public abstract ActBean findByPK(Integer actSNum);
	public abstract List<ActBean> findHostedByOne(Integer memberID,String sorting,int p,int num);
}
