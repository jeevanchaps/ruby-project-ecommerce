class ItemsController < ApplicationController
    before_action :authenticate_user!
    before_action :is_seller?, only: [:index]
    
    before_action :require_permission, only: [ :edit, :update, :destroy]


    def index
        items = current_user.items
        respond_to do |format|
            format.html { render:index, locals: { items:items} }
        end
    end

    def new
        item = Item.new
        respond_to do |format|
            format.html {  render:new, locals: {item:item}}
        end
    end

    def create
       
        item = current_user.items.build(params.require(:item).permit(:name, :description, :category, :price, :is_viewable,  :file))
        respond_to do |format|
            format.html do
            
                if item.save
                    flash[:success] = "Item saved successfully"
                    redirect_to items_url
                else
                    flash.now[:error] = "Error: Item could not be saved"
                    render :new, locals: { item: item }
                end
            end
        end

    end

    def edit
        item = Item.find(params[:id])
        respond_to do |format|
            format.html { render :edit, locals: { item: item } }
        end
    end

    def update
        item = Item.find(params[:id])
        respond_to do |format|
            format.html do

                if item.update(params.require(:item).permit(:name, :description, :category, :price, :is_viewable, :file))

                    flash[:success] = 'Item updated successfully'
                    redirect_to items_url
                else
                    # error message
                    flash.now[:error] = 'Error: Item could not be updated'
                    # render edit
                    render :edit, locals: { item: item }
                end
            end
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
                redirect_to items_url
            end
        end
    end


    def reported
        item=Item.find(params[:id])
        item.update_column(:is_reported,true)
        respond_to do |format|
            format.html do
                flash[:success] = 'Item reported to Admin '
                redirect_to :home
            end
        end
    end
    
    def require_permission
    
        if Item.find(params[:id]).creator != current_user
          redirect_to items_path, flash: { error: "You do not have permission to do that." }
        end
    end

    
    def is_seller?
        if(!current_user.is_seller)
            redirect_to :home, flash: { error: "You must be a seller to list items." }
        
        end
    end

    def search()
        respond_to do |format|
            query = params[:id]
            items = Item.where("(is_viewable = true and created_at > ?) and lower(name) like ? or lower(description) like ?", 30.days.ago, "%#{params[:id]}%".downcase,  "%#{params[:id]}%".downcase).to_a
            
            format.html do
                if(!items.empty?)
                    render :search_results, locals: {items: items, query: query}
                else
                    flash[:error] = "There were no results found for "+ params[:id]
                    redirect_to :home
                end
            end
        end

    end

    def search_by_category()

        respond_to do |format|
            query = params[:id]
            items = Item.where("is_viewable = true and lower(category) like ? and created_at > ? ", "%#{params[:id]}%".downcase,30.days.ago).to_a
            
            format.html do
                if(!items.empty?)
                    render :search_results, locals: {items: items, query: query}
                else
                    flash[:error] = "There were no results found for "+ params[:id]
                    redirect_to :home
                end
            end
        end

    end
end
