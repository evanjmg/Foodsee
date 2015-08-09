class ErrorsController < ApplicationController
  def file_not_found
    respond_to do |format|
       format.html { render template: 'errors/file
        _not_found', layout: 'layouts/application', status: 404 }
       format.all  { render nothing: true, status: 404 }
    end
  end

  def unprocessable
    respond_to do |format|
       format.html { render template: 'errors/unprocessible', layout: 'layouts/application', status: 422 }
       format.all  { render nothing: true, status: 422 }
    end

  end

  def internal_server_error
    if session[:my_previous_url] == new_search_path
        redirect_to new_search_path, notice: "Search could not be completed. Please make sure you are allowing Geolocation."
    else
    respond_to do |format|
      format.html { render template: 'errors/internal_server_error', layout: 'layouts/error', status: 500 }
      format.all  { render nothing: true, status: 500}
    end
  end
end
end
