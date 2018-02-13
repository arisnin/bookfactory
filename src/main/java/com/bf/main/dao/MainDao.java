package com.bf.main.dao;

<<<<<<< HEAD
import com.bf.myPage.dto.MyPageReviewDto;
=======
import com.bf.main.dto.RegisterDto;
>>>>>>> 8c2f53bd057ec95ce93c5e304b8c68d34c6eb944

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description 
 */
public interface MainDao {

<<<<<<< HEAD
	int insertReview(MyPageReviewDto myPageReviewDto);
=======
	public int cartWishList(int num);

	public int cartDelete(int num);

	public int register(RegisterDto registerDto);
>>>>>>> 8c2f53bd057ec95ce93c5e304b8c68d34c6eb944

}
