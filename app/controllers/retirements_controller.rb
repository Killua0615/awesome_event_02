class RetirementsController < ApplicationController
  def new
  end

  def create
    if current_user.destroy
      reset_session
      redirect_to root_path, notice: "退会完了しました"
    else
      # 退会に失敗した場合の処理
      flash.now[:alert] = '退会処理に失敗しました。'
      render :new
    end
  end
end
