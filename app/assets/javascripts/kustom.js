	
toHtml=""
$(document).ready(function(){
	//Blog Ajax
	$("#getposts").on("click",function(){
		console.log("Kill");
		console.log("function call");
		console.log("HOME EMPTIED")
		var home=document.getElementById('home')
		home.innerHTML=""
		$('#loader').html('<img class="loader" src="assets/ajax-loading.gif">')
		$.ajax({
			type:"GET",
			url:"/posts.json",
			cache:true,
			success:function(data){

				console.log("ajax call success")
				for(var i=0;i<data.length;i++){

					toHtml+='<div class="col-md-3 post">'+
	'<div class="row">'+
		'<div class="col-md-12 title"><i class="fa fa-angle-double-right"></i>'+
			'<a href="'+data[i].url+'">'+
			data[i].title+
			'</a>'+
		'</div>'+
		'<div class="col-md-11 content">'+
		data[i].content.substr(0,100)+
		'</div>'+
		'<div class="col-md-8"><i class="fa fa-calendar-o"></i> Posted at:<br> '+
			data[i].created_at.substr(0,10) +
		'</div>'+
	'</div>'+
'</div>'

				}
				
				console.log("BLOG FILLED")
				var blog=document.getElementById('blog')
				blog.innerHTML=toHtml
			}
		});
	})	
})

