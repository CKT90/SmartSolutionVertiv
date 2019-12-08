class StaticPagesController < ApplicationController

  def home
  end

  def help
  end


  def contact
    if logged_in? && current_user.admin == true
      render layout: "admin/admin"
    else
      render layout: "application"
    end
  end

  def rack1
  end

  def rack2
  end

  def rack3
  end

  def rack4
  end

  def rack5
  end

  def rack6
  end

end
