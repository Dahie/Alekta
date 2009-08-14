# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

 def page_title
    (@title ? "#{h(@title)} - " : "") + "Alekta"
  end
  
  def content_type_attrs(content_type = "text/html")
    { "http-equiv" => "Content-type", "content" => "#{content_type}; charset=utf-8" }
  end
  
  def language_attrs(language = "de")
    { "http-equiv" => "Content-language", "content" => language }
  end

  def games_for_select
    [["Please choose"]] + Game.find(:all).collect {|t| [ t.name, t.id ] }
  end

  def teams_for_select
    [["Please choose"]] + Team.find(:all).collect {|t| [ t.name, t.id ] }
  end

  def roles_for_select
    [["Please choose"], ["User", "user"], ["Modder", "modder"], ["Observer", "observer"], ["Administrator", "admin"]]
  end

end
