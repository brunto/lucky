class LuckyWeb::Route
  getter :method, :action

  def initialize(@method : Symbol, @path : String, @action : LuckyWeb::Action.class)
  end

  def_equals @method, @path, @action

  def path_without_method
    @path
  end

  def path
    self.class.build_route_path(method, @path)
  end

  def self.build_route_path(method : String | Symbol, path)
    "#{method.to_s.downcase}#{path}"
  end
end
