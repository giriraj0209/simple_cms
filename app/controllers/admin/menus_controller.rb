module Admin
class MenusController < ApplicationController
  before_action :find_param, only: [:update, :edit, :destroy ]
  
  def index
    
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
    10.times{@menu.menu_items.build}
  end

  def create
    @menu =Menu.new(menu_params)
    if @menu.save
      redirect_to admin_menus_path, notice: "Menu Created"
    else
      render 'new'
    end
  end

  def update
    if @menu.update_attributes(menu_params)
      redirect_to admin_menus_path, notice: "Menu Updated"
    else
      render 'edit'
    end
  end

  def edit
    10.times{@menu.menu_items.build}
  end

  def destroy
  if @menu.destroy
    redirect_to admin_menus_path, notice:"Menu Deleted"
  else
    redirect_to admin_menus_path, notice: "Menu couldnt be deleted"
  end
  end
  
  protected
  def menu_params
    params.require(:menu).permit(:name, :menu_items_attributes => [:title, :url, :id])
  end

  def find_param
    @menu =Menu.find(params[:id])
  end
end
end