class Api::TodosController < ApplicationController
  def create
    tr= Todo.create(title: params[:title],description: params[:description],tags: params[:tags]) 
    render json: tr 
  end
  
  def update
    tr = Todo.find_by(id: params[:id])
    if tr
      tr.update(title: params[:title],description: params[:description],tags: params[:tags])
      render json: tr 
    else
      render json: {
        message:"id you enter does not exist"
      }
    end
  end

  def index
    @tr = Todo.all
    render json: @tr
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
  end

  def new
  end
  private 
  def anti_params
    params.require(:todo).permit([
      :title,
      :description,
      :tags
    ])
  end
end
