package model;

import java.util.List;

public interface BlogDAO {
	public abstract BlogBean updateView(Integer blogSNum);
	public abstract BlogBean select(Integer blogSNum);
	public abstract List<BlogBean> selectByDate(BlogBean bean);
	public abstract List<Object[]> selectByNation(String search,int page);
	public abstract List<Object[]> selectByNationDate(String nation,int page);
	public abstract List<BlogBean> selectByCity(BlogBean bean,int page);
	public abstract BlogBean insert(BlogBean bean);
	public abstract BlogBean update(BlogBean bean);
	public abstract boolean delete(Integer blogSNum);
	public abstract List<BlogBean> select();
	public abstract List<BlogBean> selectByCityNav();
	public abstract List<Object[]> selectByBlogNewPage(Integer blogSNum);
	public abstract List<Object[]> selectByInput(String search,String page,int num,String newhot);
	public abstract BlogBean updateDelete(Integer blogSNum);
	public abstract BlogBean selectByBlogID(BlogBean bean);
	public List<BlogBean> selectTopSix();
}
