class ContributionsController < ApplicationController
  def new
    @story = Story.find(params[:story_id])
    @contribution = @story.contributions.new
  end

  def create
    @story = Story.find(params[:story_id])
    @contribution = @story.contributions.new(contribution_params)
    if @contribution.save
      redirect_to story_path(@contribution.story)
    else render :new
    end
  end

  def destroy
    @story = Story.find(params[:story_id])
    @contribution = Contribution.find(params[:id])
    @contribution.destroy
    redirect_to story_path(@contribution.story)
  end

  def edit
    @story = Story.find(params[:story_id])
    @contribution = Contribution.find(params[:id])
    render :edit
  end

  def update
    @story = Story.find(params[:story_id])
    @contribution = Contribution.find(params[:id])
    if @contribution.update(contribution_params)
      redirect_to story_path(@contribution.story)
    else
      render :edit
    end
  end


  private
  def contribution_params
    params.require(:contribution).permit(:username, :sentence)
  end
end
