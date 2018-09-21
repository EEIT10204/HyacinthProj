package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.dao.TripDAOHibernate;

@Service
public class TripService {
	
	@Autowired
	private TripDAO tirpDAO;

	Map<String,String> errors = new HashMap<String,String>();
	public List<TripBean> Save(TripBean bean) {
		TripBean result = null;
		if(tirpDAO.select(bean)!= null){
			result = tirpDAO.delete(bean.getActSNum());
		}
		
		return null;
}
	
}
