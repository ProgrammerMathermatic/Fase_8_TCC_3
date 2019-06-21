class Api::V2::GamesController < ApplicationController
    before_action :authenticate_with_token!
    
    def index
        games = current_user.games.ransack(params[:q]).result
        render json: games, status: 200
    end
    
    def show
        game = current_user.games.find(params[:id])
        render json: game, status: 200
    end
    
    def create
        game = current_user.games.build(game_params)
        if game.save
            render json: game, status: 201
        else
            render json: {errors: game.errors}, status: 422
        end
    end
    
    def update
        game = current_user.games.find(params[:id])
        if game.update_attributes(game_params)
            render json: game, status: 200
        else
            render json: {errors: game.errors}, status: 422
        end
    end
    
    def destroy
        game = current_user.games.find(params[:id])
        game.destroy
        head 204
    end
    
    private
    
    def game_params
        params.require(:game).permit(:name, :system, :status, :comment, :rating, :date)
    end
end
