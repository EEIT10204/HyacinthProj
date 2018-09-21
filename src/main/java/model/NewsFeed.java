package model;

public class NewsFeed {
	
	private Integer histID;
	
	private Integer posterID;
	private byte[] posterPic;
	private String posterName;
	private String posterAction;
	private java.util.Date postTime;
	
	
	private Integer authorID;
	private byte[] authorPic;
	private String authorName;
	
	private Integer blogSNum;
	private Integer actSNum;


	private java.util.Date articleTime;
	private String articleLocation;
	
	private byte[] articlePhoto;
	private String articleTitle;
	private String articleContent;
	
	
	private Integer commentsNum;
	private Integer savesNum;
	private Integer viewsNum;
	
	private Double rating;
	private Double ratingPoints;
	
	private Integer followsNum;
	private Integer joinsNum;
	
	
	@Override
	public String toString() {
		return "NewsFeed [histID=" + histID + ", posterID=" + posterID + ", posterName=" + posterName
				+ ", posterAction=" + posterAction + ", postTime=" + postTime + ", authorID=" + authorID
				+ ", authorName=" + authorName + ", blogSNum=" + blogSNum + ", actSNum=" + actSNum + ", articleTime="
				+ articleTime + ", articleLocation=" + articleLocation + ", articleTitle=" + articleTitle
				+ ", articleContent=" + articleContent + ", commentsNum=" + commentsNum + ", savesNum=" + savesNum
				+ ", viewsNum=" + viewsNum + ", rating=" + rating + ", ratingPoints=" + ratingPoints
				+ ", followsNum=" + followsNum + ", joinsNum=" + joinsNum + "]";
	}

	public Integer getHistID() {
		return histID;
	}
	public void setHistID(Integer histID) {
		this.histID = histID;
	}
	
	public Integer getPosterID() {
		return posterID;
	}
	public void setPosterID(Integer posterID) {
		this.posterID = posterID;
	}
	public byte[] getPosterPic() {
		return posterPic;
	}
	public void setPosterPic(byte[] posterPic) {
		this.posterPic = posterPic;
	}
	public String getPosterName() {
		return posterName;
	}
	public void setPosterName(String posterName) {
		this.posterName = posterName;
	}
	public String getPosterAction() {
		return posterAction;
	}
	public void setPosterAction(String posterAction) {
		this.posterAction = posterAction;
	}
	public java.util.Date getPostTime() {
		return postTime;
	}
	public void setPostTime(java.util.Date postTime) {
		this.postTime = postTime;
	}
	public Integer getAuthorID() {
		return authorID;
	}
	public void setAuthorID(Integer authorID) {
		this.authorID = authorID;
	}
	public byte[] getAuthorPic() {
		return authorPic;
	}
	public void setAuthorPic(byte[] authorPic) {
		this.authorPic = authorPic;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public Integer getBlogSNum() {
		return blogSNum;
	}
	public void setBlogSNum(Integer blogSNum) {
		this.blogSNum = blogSNum;
	}
	public Integer getActSNum() {
		return actSNum;
	}
	public void setActSNum(Integer actSNum) {
		this.actSNum = actSNum;
	}

	
	public java.util.Date getArticleTime() {
		return articleTime;
	}
	public void setArticleTime(java.util.Date articleTime) {
		this.articleTime = articleTime;
	}
	public String getArticleLocation() {
		return articleLocation;
	}
	public void setArticleLocation(String articleLocation) {
		this.articleLocation = articleLocation;
	}
	public byte[] getArticlePhoto() {
		return articlePhoto;
	}
	public void setArticlePhoto(byte[] articlePhoto) {
		this.articlePhoto = articlePhoto;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public String getArticleContent() {
		return articleContent;
	}
	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}
	public Integer getCommentsNum() {
		return commentsNum;
	}
	public void setCommentsNum(Integer commentsNum) {
		this.commentsNum = commentsNum;
	}
	public Integer getSavesNum() {
		return savesNum;
	}
	public void setSavesNum(Integer savesNum) {
		this.savesNum = savesNum;
	}
	public Integer getViewsNum() {
		return viewsNum;
	}
	public void setViewsNum(Integer viewsNum) {
		this.viewsNum = viewsNum;
	}
	public Double getRating() {
		return rating;
	}
	public void setRating(Double rating) {
		this.rating = rating;
	}
	public Double getRatingPoints() {
		return ratingPoints;
	}
	public void setRatingPoints(Double ratingPoints) {
		this.ratingPoints = ratingPoints;
	}

	public Integer getFollowsNum() {
		return followsNum;
	}
	public void setFollowsNum(Integer followsNum) {
		this.followsNum = followsNum;
	}
	public Integer getJoinsNum() {
		return joinsNum;
	}
	public void setJoinsNum(Integer joinsNum) {
		this.joinsNum = joinsNum;
	}





	
	
}
