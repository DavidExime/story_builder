class StoriesController < ApplicationController

	def index
	@stories = Story.all

	end

	def new
		@story = Story.new
		@a = 'whatever'
	end

	def create
		mystory = Story.new(story_params)
		if(story_params[:content].length < 100)
			flash[:message] = 'All submissions must contain at least 500 characters'
			redirect_to "/stories/new"
		else	
			mystory.save(story_params)
			current_user.stories << Story.last #connects the story and user	
        	flash[:message] = 'You created a story'
        	redirect_to "/stories"
        end
	end

	def show
		@story = Story.find_by_id(params[:id])

	end



private

  def story_params
    params.require(:story).permit(:title, :genre, :content)
  end

end
