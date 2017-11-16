class StoriesController < ApplicationController
  def index
    @stories = Story.all
    render :index
  end

  def show
    @story = Story.find(params[:id])
    @recent = @story.contributions.two_most_recent
    render :show
  end

  def new
    @story = Story.new
    render :new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to stories_path
    else
      render :new
    end
  end

  def edit
    @story = Story.find(params[:id])
    render :edit
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
      redirect_to stories_path
    else
      render :edit
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to stories_path
  end




  private
    def story_params
      params.require(:story).permit(:title, :description)
    end



end
