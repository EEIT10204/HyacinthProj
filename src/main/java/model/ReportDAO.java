package model;

import java.util.List;

public interface ReportDAO {
	
	public abstract ReportBean selectByCase (String caseID);
	
	public abstract List<ReportBean> selectAll();
	
	public abstract List<ReportBean> selectByCondition(ReportBean bean);
	
	public abstract ReportBean insert(ReportBean bean);
	
	public abstract ReportBean update(ReportBean bean);
	
	public abstract boolean delete (String caseID);
}
