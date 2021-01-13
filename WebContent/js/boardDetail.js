function addReply(data){

	var replyItem = `<li id="reply-${data.id}" class="media">`;
	replyItem += `<div class="media-body">`;
	replyItem += `<strong class="text-primary">${data.userId}</strong>`;
	replyItem += `<p>${data.content}.</p></div>`;
	replyItem += `<div class="m-2">`;

	replyItem += `<i onclick="deleteReply(${data.id})" class="material-icons">delete</i></div></li>`;

	$("#reply__list").prepend(replyItem);
}

function deleteReply(id){
	// 세션의 유저의 id와 reply의 userId를 비교해서 같을때만!!
	//alert("댓글 아이디 : "+id);
	$.ajax({
		type : "post",
		url : "/blog/reply?cmd=delete&id="+id,
		dataType : "json"
	}).done(function(result) { //  { "statusCode" : 1 }
		if (result.statusCode == 1) {
			console.log(result);
			$("#reply-"+id).remove();
		} else {
			alert("댓글삭제 실패");
		}
	});
}

function replySave(userId, boardId) {

	var data = {
		userId : userId,
		boardId : boardId,
		content : $("#content").val()
	}

	$.ajax({
		type : "post",
		url : "/blog/reply?cmd=save",
		data : JSON.stringify(data),
		contentType : "application/json; charset=utf-8",
		dataType : "json"
	}).done(function(result) {
		if (result.statusCode == 1) {
			console.log(result);
			//addReply(result.data);
			$("#content").val("");
			location.reload();
			//위에 prepend를 굳이 안해도 reload로 새로고침하면 어차피
			//select문이 다시 실행되서 값을 뿌려주기 때문에 쉽다.
location.reload();
		} else {
			alert("댓글쓰기 실패");
		}
	});
}


function deleteById(boardId){

	$.ajax({
		type: "post",
		url: "/blog/board?cmd=delete&id="+boardId,
		dataType: "json"
	}).done(function(result){
		console.log(result);
		if(result.statusCode == 1){
			location.href="index.jsp";
		}else{
			alert("삭제에 실패하였습니다.");
		}
	});
} 

 function deleteById(boardId){
			// 요청과 응답	을 json
			var data = {
				boardId: boardId
			}

			$.ajax({
				type: "post",
				url: "/blog/board?cmd=delete",
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function(result){
				console.log(result);
				if(result.status == "ok"){
					location.href="index.jsp";
				}else{
					alert("삭제에 실패하였습니다.");
				}
			});
		}