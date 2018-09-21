package model;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Service;

import config.SpringJavaConfiguration;

@Service
public class MemberHistService {
	
	
	public static void main(String[] args) {
		
		//ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		try {
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
			sessionFactory.getCurrentSession().beginTransaction();
			
			MemberHistService memberHistService = (MemberHistService) context.getBean("memberHistService");
			
//			List<NewsFeed> select = memberHistService.readNewsFromFriends(1,2,5);
//			System.out.println("select=" + select);
			
//			List<Object[]> rows = memberHistService.readCommRowsBySNum("act", 1,1);
//			System.out.println("rows=" + rows);
			
			
//			Act_CommentBean insertBeanA= new Act_CommentBean();
//			insertBeanA.setActSNum(3);
//			insertBeanA.setMemberID(4);
//			insertBeanA.setCommentContent("這個也很不錯喔");
//			Act_CommentBean insertResultA = (Act_CommentBean) memberHistService.leaveMessagesOnFeed(insertBeanA,null);
//			System.out.println("insertResultA="+insertResultA);
			
//			Blog_CommentBean insertBeanB= new Blog_CommentBean();
//			insertBeanB.setBlogSNum(2);
//			insertBeanB.setMemberID(4);
//			insertBeanB.setCommentContent("Nice to meet you~");
//			Blog_CommentBean insertResultB = (Blog_CommentBean) memberHistService.leaveMessagesOnFeed(null,insertBeanB);
//			System.out.println("insertResultB="+insertResultB);
			
			List<NewsFeed> resultHist = memberHistService.readNewsFromSelf(1010, 1, 25);
			for (NewsFeed newsFeed : resultHist) {
				System.out.println(newsFeed);
			}
			
			sessionFactory.getCurrentSession().getTransaction().commit();
		} finally {
			((ConfigurableApplicationContext) context).close(); //close()方法即會引發destroy
		}	
	}

	@Autowired
	private MemberHistDAO memberHistDAO;
	@Autowired
	private ActDAO actDAO;
	@Autowired
	private BlogDAO blogDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private ACCommentDAO act_CommentDAO;
	@Autowired
	private BGCommentDAO  blog_CommentDAO;
	@Autowired
	private MemberActDAO memberActDAO;
	@Autowired
	private MemberBlogDAO memberBlogDAO;
	
	public List<NewsFeed> readNewsFromSelf(Integer memberID_A,int page,int num) {
		List<Object[]> temp = memberHistDAO.findHistBySelf(memberID_A, page, num);
		return this.combineNewsData(temp);
	}
	
	public List<NewsFeed> readNewsFromFriends(Integer memberID_A,int page,int num) {
		List<Object[]> temp = memberHistDAO.findAllFriendsHistByOne(memberID_A, page, num);
		return this.combineNewsData(temp);
	}
	
	private List<NewsFeed> combineNewsData(List<Object[]> temp){
//		System.out.println("temp="+temp.isEmpty());

		List<NewsFeed> newsList = new ArrayList<NewsFeed>();
		
		for(int i=0;i<temp.size();i++) {

			
			NewsFeed newsFeed = new NewsFeed();
			
			//抓History
			MemberHistBean memberHistBean = (MemberHistBean) temp.get(i)[0];
			newsFeed.setHistID(memberHistBean.getHistID());
			newsFeed.setPosterID(memberHistBean.getMemberID());
			newsFeed.setPostTime(memberHistBean.getHistTime());
			
			String action = memberHistBean.getHistAction();
			if("posted".equals(action)) {
				newsFeed.setPosterAction("發表了一篇網誌");
			}else if("updated".equals(action)) {
				newsFeed.setPosterAction("更新了一篇網誌");
			}else if("scored".equals(action)) {
				newsFeed.setPosterAction("評分了一篇網誌");
			}else if("created".equals(action)) {
				newsFeed.setPosterAction("發起了一項活動");
			}else if("edited".equals(action)) {
				newsFeed.setPosterAction("編輯了一項活動");
			}else if("attended".equals(action)) {
				newsFeed.setPosterAction("參加了一項活動");
			}else if("unattended".equals(action)) {
				newsFeed.setPosterAction("退出了一項活動");
			}
			
			newsFeed.setActSNum(memberHistBean.getActSNum());
			newsFeed.setBlogSNum(memberHistBean.getBlogSNum());
			
			//抓member
			MemberBean memberBean = (MemberBean) temp.get(i)[1];
			newsFeed.setPosterName(memberBean.getMemberName());
			newsFeed.setPosterPic(memberBean.getMemberPic());
			
			//抓活動or網誌
			if(memberHistBean.getActSNum()!=null) {
				ActBean actBean = actDAO.findByPK(memberHistBean.getActSNum());
				newsFeed.setAuthorID(actBean.getMemberID());
				if(!newsFeed.getPosterID().equals(newsFeed.getAuthorID())) {
					MemberBean authorBean =memberDAO.findByPK(actBean.getMemberID());
					newsFeed.setAuthorPic(authorBean.getMemberPic());
					newsFeed.setAuthorName(authorBean.getMemberName());
				}
				if(actBean.getActCreateDate()!=null) {
					newsFeed.setArticleTime(new java.util.Date(actBean.getActCreateDate().getTime()));
				}else {
					newsFeed.setArticleTime(null);
				}
				
				newsFeed.setArticleLocation(actBean.getActCity());
				newsFeed.setArticlePhoto(actBean.getActPhoto());
				newsFeed.setArticleTitle(actBean.getActTitle());
				newsFeed.setArticleContent(actBean.getActIntro());
				
				newsFeed.setCommentsNum(act_CommentDAO.findCommentsNum(memberHistBean.getActSNum()));
				Object[] butNum = memberActDAO.findFollowsAttenders(memberHistBean.getActSNum());
				if(butNum[0]!=null) {
					newsFeed.setFollowsNum(((Long)butNum[0]).intValue());
				}else {
					newsFeed.setFollowsNum(0);
				}
				
				if(butNum[1]!=null) {
					newsFeed.setJoinsNum(((Long)butNum[1]).intValue());
				}else {
					newsFeed.setJoinsNum(0);
				}


				
			}else if(memberHistBean.getBlogSNum()!=null){
				BlogBean blogBean = blogDAO.findByPK(memberHistBean.getBlogSNum());
				newsFeed.setAuthorID(blogBean.getMemberID());
//				System.out.println("這裡"+newsFeed.getPosterID()+","+newsFeed.getAuthorID());
				if(!newsFeed.getPosterID().equals(newsFeed.getAuthorID())) {  
					//Integer..,等wrapper class可能都得用equals不可用==
//					System.out.println("這裡2"+newsFeed.getPosterID()+","+newsFeed.getAuthorID());
					MemberBean authorBean=memberDAO.findByPK(blogBean.getMemberID());
					newsFeed.setAuthorPic(authorBean.getMemberPic());
					newsFeed.setAuthorName(authorBean.getMemberName());
				}
				newsFeed.setArticleTime(blogBean.getUpdatetime());
				newsFeed.setArticleLocation(blogBean.getBlogCity());
				newsFeed.setArticlePhoto(blogBean.getBlogCover());
				newsFeed.setArticleTitle(blogBean.getBlogTitle());
				newsFeed.setArticleContent(this.HtmlTagsRemove(blogBean.getBlogContext()));

				
				if(blogBean.getBlogView()!=null) {
					newsFeed.setViewsNum(blogBean.getBlogView());
				}else {
					newsFeed.setViewsNum(0);
				}
				newsFeed.setCommentsNum(blog_CommentDAO.findCommentsNum(memberHistBean.getBlogSNum()));
				Object[] butNum = memberBlogDAO.findSavesAVGScores(memberHistBean.getBlogSNum());
				if(butNum[0]!=null) {
					newsFeed.setSavesNum(((Long)butNum[0]).intValue());
				}else {
					newsFeed.setSavesNum(0);
				}
				if(butNum[1]!=null) {
					newsFeed.setRating(Math.floor((double) butNum[1]));
					newsFeed.setRatingPoints((Double)butNum[1]-(Math.floor((double) butNum[1])));
				}else {
					newsFeed.setRating(0.0);
					newsFeed.setRatingPoints(0.0);
				}
			}
			
			System.out.println("newsFeed["+i+"]="+newsFeed);
			newsList.add(newsFeed);
		}
		
		if(!newsList.isEmpty()) {
			return newsList;
		}
		return null;
	}
	
	private String HtmlTagsRemove(String htmlStr) {
        String regEx_html="<[^>]+>"; 
        Pattern p_html=Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE); 
        Matcher m_html=p_html.matcher(htmlStr); 
        htmlStr=m_html.replaceAll(""); 
        htmlStr=htmlStr.replaceAll("&nbsp;"," ");
        return htmlStr.trim(); 
	}
	
	public List<Object[]> readCommRowsBySNum(String article,Integer id,int first) {
		
		List<Object[]> commList = new ArrayList<>();
		
		if("act".equals(article)) {
			commList = act_CommentDAO.findCommRows(id,first,5);
		}else if("blog".equals(article)) {
			commList = blog_CommentDAO.findCommRows(id,first,5);
		}
		
		System.out.println("commList="+commList);
		if(!commList.isEmpty()) {
			return commList;
		}
		
		return null;

	}
	
	public ACCommentBean leaveActMessagesOnFeed(ACCommentBean act_CommentBean) {
		if(act_CommentBean!=null) {
			System.out.println("Act_CommentBean");
			return act_CommentDAO.insertCommRow(act_CommentBean);
		}
		return null;
	}
	
	public BGCommentBean leaveBlogMessagesOnFeed(BGCommentBean blog_CommentBean) {
		if(blog_CommentBean!=null) {
			System.out.println("Blog_CommentBean");
			return blog_CommentDAO.insertCommRow(blog_CommentBean);
		}
		return null;
	}
}
