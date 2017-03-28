class FoundersController < ApplicationController
  # def index
  #   #1st you retrieve the post thanks to params[:post_id]
  #   company = Company.find(params[:company_id])
  #   #2nd you get all the comments of this post
  #   @founders = company.founders
  #
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.xml  { render :xml => @founder }
  #   end
  # end
  #
  # # GET /posts/:post_id/comments/:id
  # # GET /comments/:id.xml
  # def show
  #   #1st you retrieve the post thanks to params[:post_id]
  #   company = Company.find(params[:company_id])
  #   #2nd you retrieve the comment thanks to params[:id]
  #   @founder = company.founders.find(params[:id])
  #
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.xml  { render :xml => @founder }
  #   end
  # end

  def new
    @company = Company.find(params[:company_id])
    @founder = @company.founders.build
  end

  # GET /posts/:post_id/comments/:id/edit
  def edit
    #1st you retrieve the post thanks to params[:post_id]
    company = Company.find(params[:company_id])
    #2nd you retrieve the comment thanks to params[:id]
    @founder = company.founders.find(params[:id])
  end

  def create
    @company = Company.find(params[:company_id])
    founder_params = params[:founder]
    @founder = @company.founders.new(
      first_name: founder_params[:first_name],
      last_name: founder_params[:last_name],
      title: founder_params[:title],
      company_id: params[:company_id])

    if @founder.save
      redirect_to company_path(@company)
    end

    #1st you retrieve the post thanks to params[:post_id]
    # @company = Company.find(params[:company_id])
    #2nd you create the comment with arguments in params[:comment]
    # @founder = @company.founders.create(params[:founder])

    # respond_to do |format|
    #   if @founder.save
    #     #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
    #     format.html { redirect_to([@founder.company, @founder], :notice => 'Comment was successfully created.') }
    #     #the key :location is associated to an array in order to build the correct route to the nested resource comment
    #     format.xml  { render :xml => @founder, :status => :created, :location => [@founder.company, @founder] }
    #   else
    #     format.html { render :action => "new" }
    #     format.xml  { render :xml => @founder.errors, :status => :unprocessable_entity }
    #   end
    # end
  end

  private

  def founder_params
    params.require(:founder).permit(:company_id).permit(:first_name, :last_name, :title)
  end

  # PUT /posts/:post_id/comments/:id
  # PUT /posts/:post_id/comments/:id.xml
  # def update
  #   #1st you retrieve the post thanks to params[:post_id]
  #   post = Post.find(params[:post_id])
  #   #2nd you retrieve the comment thanks to params[:id]
  #   @comment = post.comments.find(params[:id])
  #
  #   respond_to do |format|
  #     if @comment.update_attributes(params[:comment])
  #       #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
  #       format.html { redirect_to([@comment.post, @comment], :notice => 'Comment was successfully updated.') }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /posts/:post_id/comments/1
  # DELETE /posts/:post_id/comments/1.xml
#   def destroy
#     #1st you retrieve the post thanks to params[:post_id]
#     post = Post.find(params[:post_id])
#     #2nd you retrieve the comment thanks to params[:id]
#     @comment = post.comments.find(params[:id])
#     @comment.destroy
#
#     respond_to do |format|
#       #1st argument reference the path /posts/:post_id/comments/
#       format.html { redirect_to(post_comments_url) }
#       format.xml  { head :ok }
#     end
#   end
# end
  # def create
  #   @company = Company.find(params[:id])
  #   @founder = @company.founders.build(:founder => @founder) #can someone explain what happens in the parentheses?
  #   @founder.save
  #   redirect_to :back
  # end
  # # def create
  # #   # @company = Company.find(params[:company_id])
  # #   @founder = Founder.create(founder_params)
  # #   respond_to do |format|
  # #     if @founder.save
  # #       format.html { redirect_to action: :index, notice: 'Founder was successfully created.' }
  # #       format.json { render :show, status: :created, location: @founder }
  # #     else
  # #       format.html { render :new }
  # #       format.json { render json: @founder.errors, status: :unprocessable_entity }
  # #     end
  # #   end
  # # end
  #
  # def new
  #   @company = Company.find(params[:company_id])
  #   @founder = Founder.new
  #   # @founder = @company.founders.build(:founder => @founder) #can someone explain what happens in the parentheses?
  #   # @founder.save
  #   # redirect_to :back
  # end
  #
  # private
  #
  # def founder_params
  #   params.require(:founder).permit(:first_name, :last_name, :title, :company_id)
  # end
end
