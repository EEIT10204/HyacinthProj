package model;

public interface MemberBlogDAO {
	public abstract Object[] findSavesAVGScores(Integer blogSNum);
	public abstract Boolean selectLike(Integer memberID,Integer blogSNum);
	public abstract Double selectScore(Integer memberID,Integer blogSNum);
	public abstract MemberBlogBean updateLike(Integer memberID,Integer blogSNum,int like);
	public abstract MemberBlogBean updateScore(Integer memberID,Integer blogSNum,Double score);
	public abstract MemberBlogBean insert(Integer memberID,Integer blogSNum,int like,Double score);
	public abstract MemberBlogBean selectPK(Integer memberID,Integer blogSNum);
}
