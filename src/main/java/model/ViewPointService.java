package model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.dao.ViewPointDAOHibernate;

@Service
public class ViewPointService {
	@Autowired
	private ViewPointDAOHibernate vPointDAOHibernate;


	public List<ViewPointBean> select(ViewPointBean bean) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ViewPointBean> selectByCondition(ViewPointBean bean) {
		List<ViewPointBean> result=vPointDAOHibernate.selectByCondition(bean);
		return result;
	}

	public ViewPointBean insert(ViewPointBean bean) {
		// TODO Auto-generated method stub
		return null;
	}

}
