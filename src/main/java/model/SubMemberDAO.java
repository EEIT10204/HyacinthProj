package model;

import java.util.List;

public interface SubMemberDAO {
	public abstract List<SubMemberBean> selectAll();
	public abstract SubMemberBean findByPK(Integer memberID);
	public abstract SubMemberBean insert(SubMemberBean bean);
	public abstract SubMemberBean update(SubMemberBean bean);
	public abstract boolean delete(Integer memberID);
}
