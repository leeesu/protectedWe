package org.protectedog.service.review;

import java.util.List;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Review;

public interface ReviewDAO {
	//INSERT
	public void addReview(Review review) throws Exception;
	//SELECTONE
	public Review getReview(int postNo) throws Exception;
	//SELECTLIST
	public List<Review> listReview(Search search) throws Exception;
	//UPDATE
	public void updateReview(Review review) throws Exception;
	
	public void delReview(Review review)throws Exception;
	//TOTALCOUNT
	public int getTotalCount(Search search) throws Exception;


}
