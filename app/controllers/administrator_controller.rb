class AdministratorController < ApplicationController
    before_action :authenticate_user!
    before_action :is_admin?, only: [:index]
    
    before_action :require_permission, only: [:destroy]

        
    def index
        itemlist = Item.all
        respond_to do |format|
            format.html { render:index, locals: { itemlist:itemlist} }
        end
    end

    def show
        item = nil
        if(params[:id] != "search_results")
            item = Item.find(params[:id])
        end

        respond_to do |format|
            format.html do 
                if(params[:id] == "search_results")
                    flash[:error] = "You must enter a value to search."
                    redirect_back(fallback_location: root_path)
                else
                 render:show, locals: { item:item} 
                end
            end
        end
    end

    def destroy
        item = Item.find(params[:id])
        item.destroy
        respond_to do |format|
            format.html do
                flash[:success] = 'Item removed successfully'
                redirect_to admin_url
            end
        end
    end
    
    def reactivate
        user= User.find(params[:id])
        user.update_column(:is_deactivated,false)
        respond_to do |format|
            format.html do
                flash[:success] = 'User Reactivated '
                redirect_to users_url
            end
        end
      end

    def userindex
        @users = User.where.not(:id=>current_user.id,:is_deactivated=>false)
        respond_to do|format|
         format.html {render:userindex, locals: {@users=>@users}}
         end
    end

    def view
        @items = Item.where("is_reported = ?",true)
        respond_to do |format|
            format.html { render:view, locals: { @items =>@items} }
        end
    end

    def require_permission
    
        if !current_user.is_admin
          redirect_to items_path, flash: { error: "You do not have permission to do that." }
        end
    end

    
    def is_admin?
        if(!current_user.is_admin)
            redirect_to :home, flash: { error: "You must be an administrator to view all items." }
        end
    end

end
