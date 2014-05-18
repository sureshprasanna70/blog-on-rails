
	function getposts(){
		console.log("clicked");
		$.ajax({
			type:"GET",
			url:"/posts.json",
			data:"",
			success:function(data){
				console.log(data);
			}
		});
	}
