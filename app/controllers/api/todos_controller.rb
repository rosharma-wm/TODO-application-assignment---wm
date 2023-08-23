class Api::TodosController < ApplicationController
  def create
    @tr = Todo.create(title: params[:title],description: params[:description],tags: params[:tags],status: params[:status]) 
    render json: @tr 
  end
  
  def update
    @tr = Todo.find_by(id: params[:id])
    
    if @tr
      @tr.update(title: params[:title],description: params[:description],tags: params[:tags],status: params[:status])
      render json: @tr 
      
    else
      render json: {
        message:"id you enter does not exist"
      }
    end
  end

  def index
    if params[:tags].present?
      @tr = Todo.where(tags: { '$in': [params[:tags]]}).order_by(created_at: :desc)
      render json: @tr
    else
      @tr = Todo.all
      render json: @tr
    end
  end

  def show
    tr = Todo.find_by(id: params[:id])
    if tr 
      render json: tr
    else
      render json: {
        error: "Not found"
        }
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy    
      render json: {
        message: "destroyed"
        }
  end
# //test comment
  def edit
    @tr
  end

  def new
  end
  def restore
   
    @tr=Todo.unscoped.find(params[:id])
    # if @tr.restore
    #   render json: {
    #     success: "restored"
    #     }
    # else
    #   render json{
    #     unsuccess:"cant restored the give value"
    #   }
    # end
  end
 

end
