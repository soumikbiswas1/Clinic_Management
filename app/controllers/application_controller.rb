class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern


  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(doctor)
      doctor_dashboard_path
    else
      super
    end
  end
end
