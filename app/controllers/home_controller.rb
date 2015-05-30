class HomeController < ApplicationController
  $og_image=""
  $og_title=""
  $og_description="The official Studentsfm site"
  $og_url="www.studentsfm.in"
  def index
  	@title="HOME"
        meta("HOME","","","","Welcome to the home of Students FM.the best entertainment online")
        puts $og_title  	
  end
  def contact
    @title="CONTACT"
    @contact=Hash
    @contact["name"=>""]
    @contact["address"=>""]
    @contact["phone"=>""]
    meta("Contact Us","","","","Contact us through email or phone mentioned below")
  end
  def meta(fn_name,title,image,url,desc)
      $og_title="STUDENTS FM|"+fn_name
      $og_image="/assets/"
      if not url==""
        $og_url=url
      end
      if not desc==""
        $og_description=desc
      end
  end
end
