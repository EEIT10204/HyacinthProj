package model;

import java.util.List;

public interface MemberDAO {
	public abstract List<MemberBean> selectAll();
	public abstract MemberBean findByPK(Integer memberID);
	public abstract MemberBean findByAccount(String memberAccount);
	public abstract MemberBean insert(MemberBean bean);
	public abstract MemberBean update(MemberBean bean);
	public abstract MemberBean updateBasic(Integer memberID,String memberName,String memberTel,byte[] memberPic,String memberNickName,String memberGender,java.util.Date memberBirthday);
	public abstract MemberBean updatePrivacy(Integer memberID,String memberPwd,String memberMail,String memberHierachy,String activationCode);
	public abstract MemberBean updateHierachy(Integer memberID,String memberHierachy);
	public abstract boolean delete(Integer memberID);
	public abstract MemberBean findByMail(String memberMail);
}
