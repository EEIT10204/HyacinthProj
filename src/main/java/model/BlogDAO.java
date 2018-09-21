package model;

import java.util.List;

public interface BlogDAO {
	public abstract BlogBean findByPK(Integer blogSNum);
	public abstract List<BlogBean> findPostedByOne(Integer memberID,String sorting,int p,int num);
}
