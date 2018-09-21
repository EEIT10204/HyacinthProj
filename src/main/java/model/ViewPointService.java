package model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.dao.ViewPointDAOHibernate;

@Service
public class ViewPointService {
	
	@Autowired
	private ViewPointDAOHibernate viewPointDAO;
	
	public List<ViewPointBean> select(ViewPointBean bean){
		
		List<ViewPointBean> results = viewPointDAO.selectAll();
		return results;
	}
	
	public List<ViewPointBean> selectByCondition(ViewPointBean bean){
		List<ViewPointBean> results = viewPointDAO.selectByCondition(bean);
		return results;
	}
	
	public ViewPointBean insert(ViewPointBean bean) {
		ViewPointBean temp = viewPointDAO.selectByName(bean);
		
		if(temp == null) { //No duplicate viewPoint name found
			temp = viewPointDAO.insert(bean);
		return temp;
		}
		else {
			System.out.println("service not insert");
			return null;
		}		
	}
	
	public ViewPointBean update(ViewPointBean bean) {
		
		ViewPointBean temp = viewPointDAO.update(bean);
		return temp;
	}
}
