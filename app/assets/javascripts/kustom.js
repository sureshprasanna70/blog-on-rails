	
toHtml=""
$(document).ready(function(){
	//Blog Ajax
	$("#getposts").on("click",function(){
		console.log("Kill");
		console.log("function call");
		$.ajax({
			type:"GET",
			url:"/posts.json",
			cache:true,
			success:function(data){

				console.log("ajax call success")
				for(var i=0;i<data.length;i++){

					toHtml+='<div class="container"><div class="row">'+
					'<div class="col-md-12 title"><i class="fa fa-angle-double-right"></i>'+
					data[i].title+
					'</div></div><div class="row"> <div class="col-md-11 content">'+
					data[i].content.substr(0,100)+
					'</div></div><div class="row"><div class="col-md-5"><i class="fa fa-calendar-o"></i>Posted at :'+
					data[i].created_at+
					'</div><br><div class="col-md-1"><a class="show" href="'+data[i].url+'">SHOW'+
					'</a></div></div><div class="row"><div class="col-md-12 sep"></div></div>'+
					'</div></div>'

				}
				console.log("HOME EMPTIED")
				var home=document.getElementById('home')
				home.innerHTML=""
				console.log("BLOG FILLED")
				var blog=document.getElementById('blog')
				blog.innerHTML=toHtml
			}
		});
	})	
})

