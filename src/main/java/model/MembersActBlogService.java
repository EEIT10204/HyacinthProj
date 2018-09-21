package model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MembersActBlogService {
	
	@Autowired
	private ActDAO actDAO;
	@Autowired
	private MemberActDAO memberActDAO;
	@Autowired
	private BlogDAO blogDAO;
	@Autowired
	private MemberBlogDAO memberBlogDAO;
	
	
	public List<ActBean> fetchHostedActs(Integer memberID,String sorting,int p,int num){
		return actDAO.findHostedByOne(memberID, sorting, p, num);
	}
	public List<Object[]> fetchJoinedActs(Integer memberID,String sorting,int p,int num){
		return memberActDAO.findJoinedByOne(memberID, sorting, p, num);
	}
	public List<Object[]> fetchFollwedActs(Integer memberID,String sorting,int p,int num){
		return memberActDAO.findFollowedByOne(memberID, sorting, p, num);
	}
	public List<BlogBean> fetchPostedBlogs(Integer memberID,String sorting,int p,int num){
		return blogDAO.findPostedByOne(memberID, sorting, p, num);
	}
	public List<Object[]> fetchSavedBlogs(Integer memberID,String sorting,int p,int num){
		return memberBlogDAO.findSavedByOne(memberID, sorting, p, num);
	}
	
	
}
