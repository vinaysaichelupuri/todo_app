class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @todo = Todo.new

    scope = current_user.todos.order(created_at: :desc)
    
    case params[:month_filter]
    when 'this_month'
      scope = scope.where(created_at: Time.current.beginning_of_month..Time.current.end_of_month)
    when 'previous_months'
      scope = scope.where('created_at < ?', Time.current.beginning_of_month)
    end

    case params[:filter]
    when 'pending'
      @todos = scope.where(status: 'pending')
    when 'completed'
      @todos = scope.where(status: 'completed')
    else
      @todos = scope
    end

    @username = current_user.email.split('@').first.capitalize
  end
end
