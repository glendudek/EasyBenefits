class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Exception, with: :handle_exception

  before_action :authenticate_user!

  REMEMBERED_URL_SESSION_KEY=:go_back

  def remember_calling_url
    session[REMEMBERED_URL_SESSION_KEY] = request.referer
  end

  def calling_url
    session[REMEMBERED_URL_SESSION_KEY] || root_path
  end

  def redirect_on_exception(path)
    @exception_redirect = path
  end

  def handle_exception(e)
    logger.error "ApplicationController: Exception #{e.class.name}: #{e.message}"
    #ExceptionNotifier.deliver_exception_notification(e, self, request)
    if e.methods.include?(:http_status)
      status = e.http_status
    else
      status = MyException::HTTP_INTERNAL_SERVER_ERROR
    end
    raise e if Rails.env.development?
    redirect_to (@exception_redirect || root_path), status: status, flash: {error: e.message}
  end
end
