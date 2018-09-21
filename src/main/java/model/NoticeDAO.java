package model;

import java.util.List;

public interface NoticeDAO {
	public abstract List<NoticeBean> selectByMemberReceiver(Integer memberID);
	public abstract Boolean updateReadStatus(Integer memberID);
	public abstract NoticeBean insertNotice(NoticeBean bean);

}
