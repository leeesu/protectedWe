"<div class='row' id='${comment.commentNo}'>"
	+"<div class='col-sm-1 col-md-1' align='center'>"
		+"<img src='https://via.placeholder.com/80' style='border-radius: 5px; min-height: 80px; min-width: 60px;'/>"
	+"</div>"
	+"<div class='col-sm-9 col-md-9' align='left'>"
		+"<h4 id='${comment.commentNo}' class='h4tag'>"
		+"<b>${comment.nickName}</b>&nbsp; <small>${comment.regDate}</small>&nbsp;"
		+"</h4>"
		+"<input type='hidden' name='commentNo' value='${comment.commentNo}'>"
							
		+"<div id='${comment.commentNo}' class='area'>"
			+"<h5  id='${comment.commentNo}' class='cmCont'>${comment.commentContent}</h5>"
				+"<c:if test='${comment.id == sessionScope.user.id }'>"
					+"<span class='fas fa-pen'></span> &nbsp;" 
					+"<span class='fas fa-trash-alt'></span> &nbsp;" 
				+"</c:if>"
					+"<span class='fas fa-exclamation-triangle'></span> &nbsp;"
					+"<span class='fas fa-plus'></span> &nbsp;" 
				
				+"<span id='${comment.commentNo}' class='far fa-thumbs-up'></span>"
				+"<font id='${comment.commentNo}' class='font'>"
					+"<b>${comment.likeCount}</b>"
				+"</font>"
		+"</div>"
	+"</div>"
+"</div>"