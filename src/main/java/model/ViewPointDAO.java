package model;

import java.util.List;

public interface ViewPointDAO {

//	public abstract ViewPointBean select(Integer viewPointID);

	public abstract List<ViewPointBean> selectAll();

	public abstract ViewPointBean insert(ViewPointBean bean);

	public abstract ViewPointBean update(ViewPointBean bean);

	public abstract boolean delete(int viewPointID);

	public abstract List<ViewPointBean> selectByCondition(ViewPointBean bean);
	
	public abstract ViewPointBean select(ViewPointBean bean);

	public abstract ViewPointBean select(int viewPointID);
	

	
}