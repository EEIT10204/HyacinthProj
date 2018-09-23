package model.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.ReportBean;
import model.ReportDAO;

@Repository
public class ReportDAOHibernate implements ReportDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public List<ReportBean> selectAll() {
List temp = this.getSession().createNativeQuery("select R.caseID,R.memberID,R.referID,R.reason, R.reportedTime,R.process, m.memberName from Reported_Case R left join Member M on R.memberID = M.memberID ORDER BY R.caseSNum ASC").list();
		
		List<ReportBean> results = new ArrayList<ReportBean>();
		Iterator it=temp.iterator();
        while(it.hasNext())
        {
            Object rows[] = (Object[])it.next();

            ReportBean bean = new ReportBean();           
            bean.setCaseID((String)rows[0]);
            System.out.println("caseID: " + rows[0]);
            bean.setMemberID((int)rows[1]);
            bean.setReferID((String)rows[2]);
            bean.setReason((String)rows[3]);
            bean.setReportedTime((Timestamp)rows[4]);
            bean.setProcess((String)rows[5]);
            bean.setMemberName((String)rows[6]);
            results.add(bean);                
//            System.out.println(rows[0]+ " -- " +rows[1] + "--"+rows[2]+"--"+rows[3]);
        }
		System.out.println(results.toString());
		return results;	
	}
	
	public List selectByCondition(ReportBean bean){
		
		List temp = this.getSession().createNativeQuery("select R.caseID,R.memberID,R.referID,R.reason, R.reportedTime,R.process, m.memberName from Reported_Case R left join Member M on R.memberID = M.memberID WHERE " + bean.getReferID() + bean.getProcess() + "ORDER BY R.caseSNum ASC").list();
		
		List<ReportBean> results = new ArrayList<ReportBean>();
		Iterator it=temp.iterator();
        while(it.hasNext())
        {
            Object rows[] = (Object[])it.next();

            ReportBean tempBean = new ReportBean();
            tempBean.setCaseID((String)rows[0]);
            tempBean.setMemberID((int)rows[1]);
            tempBean.setReferID((String)rows[2]);
            tempBean.setReason((String)rows[3]);
            tempBean.setReportedTime((Timestamp)rows[4]);
            tempBean.setProcess((String)rows[5]);
            tempBean.setMemberName((String)rows[6]);
            results.add(tempBean);                
//            System.out.println(rows[0]+ " -- " +rows[1] + "--"+rows[2]+"--"+rows[3]);
        }
		System.out.println("DAO: " + results.toString());
		return results;	
	}
	
	@Override
	public ReportBean selectByCase(String caseID) {
		String hql = "from ReportBean where 1=1 and caseID LIKE :caseID";
		Query hqy = this.getSession().createQuery(hql);
		hqy.setParameter("caseID", caseID);
		ReportBean result = (ReportBean) hqy.getSingleResult();		
		return result;
	}

	@Override
	public ReportBean insert(ReportBean bean) {
		this.getSession().save(bean);
		return bean;
	}

	@Override
	public ReportBean update(ReportBean bean) {
		this.getSession().saveOrUpdate(bean);
		return null;
	}

	@Override
	public boolean delete(String caseID) {
		// TODO Auto-generated method stub
		return false;
	}

	

}
