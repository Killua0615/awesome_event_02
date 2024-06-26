class TicketsController < ApplicationController
  def new
    raise ActionController::RoutingError, "ログイン状態で TicketsController#new にアクセス"
  end

  def create
    event = Event.find(params[:event_id])
    @ticket = current_user.tickets.build do |t|
      t.event = event
      t.comment = params[:ticket][:comment]
    end
    if @ticket.save
      redirect_to event, notice: "このイベントに参加表明しました"
    else
      # バリデーションエラーなどの対応 任意
      redirect_to event, alert: "参加表明に失敗しました"
    end
  end
end
