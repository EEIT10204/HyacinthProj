package model;

import java.util.List;

public interface ViewPointDAO {
	
	public abstract List<ViewPointBean> selectAll ();
	
	public abstract List<ViewPointBean> selectByCondition(ViewPointBean bean);
	
	public abstract ViewPointBean insert(ViewPointBean bean);
	
	public abstract ViewPointBean update(ViewPointBean bean);
	
	public abstract ViewPointBean delete (int viewPointID);

}
