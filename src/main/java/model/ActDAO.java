package model;

import java.sql.Timestamp;
import java.util.List;

<<<<<<< HEAD

=======
>>>>>>> 413fea5d64c84f191628e25016e2efe5c963d1ef
public interface  ActDAO {
	public abstract ActBean selectByPK(int ActSNum);

	public abstract List<ActBean> selectAll();
	
	public abstract ActBean insert(ActBean bean);

	public abstract ActBean update(ActBean bean);
			
	public abstract boolean deleteByPK(int ActSNum);

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 413fea5d64c84f191628e25016e2efe5c963d1ef
	public abstract ActBean selectByActID(ActBean bean);
	
	public abstract List<ActBean> selectTopSix();
	
	public abstract List<ActBean> Newset();
<<<<<<< HEAD

	public abstract ActBean findByPK(Integer actSNum);
	
	public abstract List<ActBean> findHostedByOne(Integer memberID,String sorting,int p,int num);
	
	public abstract ActBean selectBymemberIDandcreateDate(ActBean bean);

=======
=======
	public abstract ActBean selectBymemberIDandcreateDate(ActBean bean);
	
	
>>>>>>> c89f0141882deea9b6670f84845d38c26d69ae3c


	
>>>>>>> 413fea5d64c84f191628e25016e2efe5c963d1ef
}
