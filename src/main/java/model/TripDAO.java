package model;

import java.util.List;

public interface TripDAO {
	
	public abstract TripBean select(TripBean bean);

	public abstract List<TripBean> selectAll();

	public abstract TripBean insert(TripBean bean);

	public abstract TripBean update(TripBean bean);

	public abstract TripBean delete(int ActSNum);
	
	public abstract TripBean selectByPK(int ActSNum);
	
	public abstract List<TripBean> select(int ActSNum);

}
