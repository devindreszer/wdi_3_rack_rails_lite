module PersonApp
  class ApplicationController

    LAYOUT_HTML_PRE = '<html><head></head><body>'
    LAYOUT_HTML_POST = '</body></html>'

    attr_accessor :params, :controller, :action
    def initialize()
      @params = {}
    end

    def path_to_params(path)
      id = path.split("/").last.to_i
      @params.merge!({id: id})
    end

    def controller
      # WARNING: Done by rails!
      @controller = self.class.name.split("Controller").first
      # if name of class was PersonApp::PeopleController, then you would get back PersonApp::People
      # remove the module name
      @controller = @controller.split("::").last.underscore
      # this would remove PersonApp:: and return People
    end

    def view_filename
      # WARNING: Done by rails!
      # creates paths to show.html.erb and index.html.erb
      "#{$RAILS_ROOT}/app/views/#{self.controller}/#{self.action}.html.erb"
    end

    # given an action invoke a view template
    def render()
      # WARNING: Done by rails! Do not need to understand
      self.action = calling_method = caller[0].split("`").pop.gsub("'", "")
      template = File.read(view_filename)
      eruby = Erubis::Eruby.new(template)
      eruby.result(binding())
    end
  end
end
