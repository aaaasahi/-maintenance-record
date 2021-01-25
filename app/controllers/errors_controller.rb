class ErrorsController < ApplicationController
    before_action :set_error, only:[:show, :edit, :update]
    
    def index
        @errors = Error.all
        @q = Error.ransack(params[:q])
        @errors = @q.result(distinct: true)
    end

    def show
    end
    
    def new
        @error = Error.new
    end

    def create
        @error = Error.new(error_params)
        if @error.save
            redirect_to root_path, notice: "登録完了"
        else
            flash.now[:error] = "登録失敗"
            render :new
        end
    end

    def edit
    end

    def update
        if @error.update(error_params)
            redirect_to root_path, notice: "編集完了"
        else
            flash.now[:error] = "編集失敗"
            render :edit
        end
    end

    def destroy
        error = Error.find(params[:id])
        error.destroy!
        redirect_to root_path, notice: "削除しました"
    end

    private 
    def error_params
        params.require(:error).permit(:game,:problem,:approach,:name)
    end

    def set_error
        @error = Error.find(params[:id])
    end
end