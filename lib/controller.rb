require_relative 'model'
require_relative 'view'
require_relative 'item'

class Controller

    def initialize      
      @data = Model.new
      @itemsList = Item.index
      @view = View.new(@itemsList)
    end

    def open_menu
      @view.start
      while true
        params = @view.landing_menu
        case params
        when 1
          index_items
        when 2
          create_item
        when 4
          @view.see_you_soon
          break
        else
          @view.syntax_error 
        end
      end
    end
    

    def index_items
      @view.index_all_items
      params = @view.list_menu
      if params == 1
        show_item
      elsif params == 2
        update_item
      else
        open_menu
      end
    end

    def show_item
      params = @view.search_an_item
      itemToShow = Item.show(params)
      View.show(itemToShow)
      choice = @view.show_menu
      if choice == 1
        update_item(itemToShow)
      elsif choice == 2
        destroy_item
      else
        open_menu
      end
    end

    def update_item(itemToShow)
      params = @view.update_an_item(itemToShow)
      Item.update(params)
      View.show(itemToShow)
    end 

    def destroy_item
      params = @view.destroy_confirmation
      puts params
      if params == "yes"
        Item.destroy
      end
    end
    
    def create_item
      parameters = @view.new_item
      @test = new_item_conformity(parameters)
      while @test != true
        parameters = @view.new_item
        @test = new_item_conformity(parameters)
      end
      item = Item.new(parameters.values[0],parameters.values[1],parameters.values[2],parameters.values[3],parameters.values[4])
      item.save
      @view.new_item_saved
      View.show(item)
      initialize
    end
    
    private

    def new_item_conformity(parameters)
      if (parameters.values[1] == "") || (parameters.values[2] == "") || (parameters.values[2].to_i < 0)
        error = @view.new_item_error
        return false
      else
        return true
      end
    end
    

end
