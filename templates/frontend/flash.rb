def install_flash
  run "touch app/views/layouts/_flash.html.haml"
  append_to_file "app/views/layouts/_flash.html.haml" do
    "- flash.each do |key, value|\n"
  end
  append_to_file "app/views/layouts/_flash.html.haml", after: "- flash.each do |key, value|\n" do
    "\s\s" + '= content_tag :div, value, class: "flash alert-#{key}"' + "\n"
  end
  append_to_file "app/views/layouts/application.html.erb", after: "<body>\n" do
    "\s\s\s\s<%= render 'layouts/flash' %>\n"
  end
end

install_flash
