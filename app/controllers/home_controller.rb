class HomeController < ApplicationController
  og_image=""

  def index
  	@title="HOME"
  	meta("index")
  	
  end
    def meta(fn_name)

    if fn_name=="index"
      og_title="CEG SPARTANZ|HOME"
      
      og_image="/assets/"
      og_url="http://cegspartanz.in"
      og_description="The official website of CEG-SPARTANZ"
    end
    
  end
end
