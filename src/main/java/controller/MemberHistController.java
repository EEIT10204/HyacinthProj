package controller;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.ACCommentBean;
import model.BGCommentBean;
import model.MemberBean;
import model.MemberHistService;
import model.NewsFeed;

@Controller
@SessionAttributes(names={"user"})
public class MemberHistController {

		@Autowired
		private MemberHistService memberHistService;
		
		@RequestMapping(path={"/readMyHist.do"},method= {RequestMethod.POST})
		@ResponseBody
		public List<NewsFeed> readMyHist(String memberID,String page) {	
			System.out.println("memberID="+memberID);
			if(memberID==null || "0".equals(memberID)) {
				return null;
			}
			
			int p = 1;
			int mId = 0;
			try {
				p = Integer.valueOf(page);
				mId = Integer.valueOf(memberID);
			} catch (NumberFormatException e) {
				e.printStackTrace();
//				return null;
			}
			System.out.println("readNewsFromFriends called. user:"+ mId +"page="+p);
			List<NewsFeed> result = memberHistService.readNewsFromSelf(mId, p, 5);
			System.out.println("result="+result);
			return result;
		}
		
		@RequestMapping(path={"/readFriendsNews.do"},method= {RequestMethod.GET})
		@ResponseBody
		public List<NewsFeed> readNewsFromFriends(@SessionAttribute(name="user") MemberBean user,String page) {
			
			int p = 1;
			try {
				p = Integer.valueOf(page);
			} catch (NumberFormatException e) {
				e.printStackTrace();
//				return null;
			}
			
			System.out.println("readNewsFromFriends called. user:"+ user.getMemberID() +"page="+p);
			List<NewsFeed> result = memberHistService.readNewsFromFriends(user.getMemberID(), p, 5);
			System.out.println("result="+result);
			return result;
		}
		
		@RequestMapping(path={"/readCommsById.do"},method= {RequestMethod.GET})
		@ResponseBody
		public List<Object[]> readCommsByPage(String articleId,String first) {
			
			System.out.println("articleId="+articleId);
			System.out.println("Comm-first="+first);
			String[] tokens = articleId.split("_");
			System.out.println("tokens[0]="+tokens[0]+",tokens[1]="+tokens[1]);
			Integer id = 0;
			int p = 1;
			try {
				id = Integer.valueOf(tokens[1]);
				p = Integer.valueOf(first);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			
			List<Object[]> result =memberHistService.readCommRowsBySNum(tokens[0], id, p-1);
			return result;
		}
		
		
		//180914:REST 新增path不能用.xx，方法不能用GET，回傳型別必須可被parse為JSON/XML，詳細原因和規則仍需驗證
		@RequestMapping(path={"/news_act_comments"},method= {RequestMethod.POST})
		@ResponseBody
		public ACCommentBean leaveMessagesOnAct(String actSNum,String memberID,String commentContent) throws URISyntaxException {
			System.out.println("actSNum="+actSNum+",memberID="+memberID+",commentContent="+commentContent);
			
			ACCommentBean act_CommentBean = new ACCommentBean();
			
			try {
				act_CommentBean.setActSNum(Integer.valueOf(actSNum));
				act_CommentBean.setMemberID(Integer.valueOf(memberID));
				if(commentContent.contains("\r\n")) {
					commentContent=commentContent.replaceAll("\r\n", "<br/>");
				}else {
					commentContent=commentContent.replaceAll("\n", "<br/>");	
				}
				System.out.println("editComm="+commentContent);
				act_CommentBean.setCommentContent(commentContent);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				return null;
			}
			
//			System.out.println("act_CommentBean="+act_CommentBean);
//			return (Act_CommentBean) memberHistService.leaveMessagesOnFeed(act_CommentBean, null);
			ACCommentBean resultBean = memberHistService.leaveActMessagesOnFeed(act_CommentBean);
//			System.out.println("resultBean="+resultBean);
			return resultBean;
					
//			if(resultBean!=null) {
//				return ResponseEntity.created(new URI("/act_comments.in/"+resultBean.getCommentSNum())).body(resultBean);
//			}else {
//				return ResponseEntity.noContent().build();
//			}
		}
		

		@RequestMapping(path={"/news_blog_comments"},method= {RequestMethod.POST})
		@ResponseBody
		public BGCommentBean leaveMessagesOnBlog(String blogSNum,String memberID,String commentContent) throws URISyntaxException {
			System.out.println("blogSNum="+blogSNum+",memberID="+memberID+",commentContent="+commentContent);
			
			BGCommentBean blog_CommentBean= new BGCommentBean();
			
			try {
				blog_CommentBean.setBlogSNum(Integer.valueOf(blogSNum));
				blog_CommentBean.setMemberID(Integer.valueOf(memberID));
				if(commentContent.contains("\r\n")) {
					commentContent=commentContent.replaceAll("\r\n", "<br/>");
				}else {
					commentContent=commentContent.replaceAll("\n", "<br/>");
				}
				System.out.println("editComm="+commentContent);
				blog_CommentBean.setCommentContent(commentContent);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				return null;
			}
			
//			System.out.println("blog_CommentBean="+blog_CommentBean);
//			return (Blog_CommentBean) memberHistService.leaveMessagesOnFeed(null,blog_CommentBean);
			BGCommentBean resultBean = memberHistService.leaveBlogMessagesOnFeed(blog_CommentBean);
//			System.out.println("resultBean="+resultBean);
			return resultBean;
			
//			if(resultBean!=null) {
//				return ResponseEntity.created(new URI("/blog_comments/"+resultBean.getCommentSNum())).body(resultBean);
//			}else {
//				return ResponseEntity.noContent().build();
//			}
		}
		
		@RequestMapping(path={"/tests"},method= {RequestMethod.POST})
		@ResponseBody
		public ResponseEntity<?> testIn(String blogSNum,String memberID,String commentContent) throws URISyntaxException {
			System.out.println("blogSNum="+blogSNum+",memberID="+memberID+",commentContent="+commentContent);
			
			BGCommentBean blog_CommentBean= new BGCommentBean();
			
			try {
				blog_CommentBean.setBlogSNum(Integer.valueOf(blogSNum));
				blog_CommentBean.setMemberID(Integer.valueOf(memberID));
				blog_CommentBean.setCommentContent(commentContent);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				return null;
			}
			
			System.out.println("blog_CommentBean="+blog_CommentBean);
//			return (Blog_CommentBean) memberHistService.leaveMessagesOnFeed(null,blog_CommentBean);
			BGCommentBean resultBean = memberHistService.leaveBlogMessagesOnFeed(blog_CommentBean);
			System.out.println("resultBean="+resultBean);
			
			if(resultBean!=null) {
				return ResponseEntity.created(new URI("/tests/"+resultBean.getCommentSNum())).body(resultBean);
			}else {
				return ResponseEntity.noContent().build();
			}
		}
		
		@RequestMapping(path={"/readBelongList.do"},method= {RequestMethod.GET})
		@ResponseBody
		public List<Object[]> readBelongList(String news,String type) {
			System.out.println("readBelongList called~");
			System.out.println("news="+news+",type="+type);
			if(news!=null && type!=null) {
				String[] tokens = news.split("_");
				int id =0;
				try {
					id = Integer.valueOf(tokens[1]);
				} catch (NumberFormatException e) {
					e.printStackTrace();
					return null;
				}
				List<Object[]> result = memberHistService.fetchWhoBelongToNews(id, type);
				if(!result.isEmpty()) {
					return result;
				}
			}
			return null;
		}
}
