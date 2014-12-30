module Setup
  class ConnectionsController < Setup::BaseController
    before_action :find_connection, only: [:show, :update, :destroy]

    # GET /connections.json
    def index
      @connections = Setup::Connection.all
      render json: @connections
    end

    # GET /connections/1.json
    def show
      render json: @connection
    end

    # GET /connections/new.json
    def new
      @connection = Setup::Connection.new
      render json: @connection
    end

    # POST /connections.json
    def create	  
      @connection = Setup::Connection.new(permited_attributes)
      if @connection.save
        render json: @connection, status: :created, location: @connection
      else
        render json: @connection.errors, status: :unprocessable_entity
      end
    end

    # PUT /connections/1.json
    def update
      if @connection.update_attributes(params[:connection])
        head :no_content
      else
        render json: @connection.errors, status: :unprocessable_entity
      end
    end

    # DELETE /connections/1.json
    def destroy
      @connection.destroy
      head :no_content
    end
    
    protected
    def permited_attributes
      params[:connection].permit(:name, :key, :url, :connection_parameteters_attributes, :connection_roles_attributes )
    end  
    
    def find_connection
      @connection = Setup::Connection.find(params[:id])
    end  
    
  end
end
