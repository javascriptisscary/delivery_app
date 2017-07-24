module ViewHelper
  def flash_messages
    render_haml <<-HAML
      - if flash[:alert]
        .alert-danger.text-center
          = flash[:alert]
      - if flash[:notice]
        .alert-success.text-center
          = flash[:notice]
    HAML
  end
        
  def render_haml(haml, locals = {})
    Haml::Engine.new(haml.strip_heredoc, format: :html5).render(self, locals)
  end
  
        
end