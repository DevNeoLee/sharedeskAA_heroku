class ApplicationController < ActionController::Base
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_global_search_variable

  def set_global_search_variable
        @browse = Room.all.ransack(params[:q])
        @browse_result = @browse.result(distinct: true)
    end

    protected 
        def configure_permitted_parameters 
            devise_parameter_sanitizer.permit :sign_up, keys: [:name, :avatar] 
            devise_parameter_sanitizer.permit :account_update, keys: [:name, :avatar, :phone_number, :description, :email, :password]
        end

end
