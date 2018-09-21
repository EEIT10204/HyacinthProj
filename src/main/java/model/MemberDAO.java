package model;

import java.util.List;

public interface MemberDAO {
	public abstract List<MemberBean> selectAll();
	public abstract MemberBean findByPK(Integer memberID);
	public abstract MemberBean findByAccount(String memberAccount);
	public abstract MemberBean findByMail(String memberMail);
	public abstract MemberBean insert(MemberBean bean);
	public abstract MemberBean update(MemberBean bean);
	public abstract boolean delete(Integer memberID);
}
