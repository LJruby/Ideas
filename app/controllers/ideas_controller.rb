class IdeasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_idea, only: [:show, :edit, :update, :destroy, :action_vote]
  before_action :set_vote, only: [:show, :action_vote]
  before_action :get_statuses, :get_categories, :get_users, only: [:new, :create, :show, :edit, :update, :destroy, :index]
  
	def get_statuses
    @statuses = Status.all
  end

  def get_categories
    @categories = Category.all
  end

  def get_users
    @users = User.all
  end
  
  # GET /ideas
  # GET /ideas.json
  def index
		@ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  # GET /ideas/1.xml
  def show
    respond_to do |format|
      format.html
      format.json { render json: @idea }
      format.xml { render xml: @idea }
    end
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def action_vote
    if params[:vote_up]
      @vote = Vote.new(idea_id: params[:id], user_id: current_user.id)
      respond_to do |format|
        if @vote.save
          format.html { redirect_to @idea, notice: 'Vote was successfully created.' }
          format.json { render :show, status: :created, location: @idea }
        else
          format.html { render :show }
          format.json { render json: @idea.errors, status: :unprocessable_entity }
        end
      end
    else
      @vote.destroy
      respond_to do |format|
        format.html { redirect_to @idea, notice: 'Vote was successfully destroyed.' }
        format.json { render :show, status: :created, location: @idea }
      end
    end
  end
  
  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head ote was successfully creat:no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end
    def set_vote
      @vote = Vote.find_by(idea_id: params[:id], user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :description, :status_id, :category_id, :user_id, :attachment)
    end
end
