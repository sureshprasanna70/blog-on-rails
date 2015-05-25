class HomeController < ApplicationController
  og_image=""

  def index
  	@title="HOME"
  	meta("index")
  	
  end
    def meta(fn_name)

    if fn_name=="index"
      og_title="STUDENTS FM|HOME"
      og_image="/assets/"
      og_url=""
    end
    
  end
end
