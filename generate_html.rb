require 'erb'
require 'tilt'
require 'json'

#A script to generate the html page from erb files and json file

json_file = 'cv_placeholder.json'
output-filename = 'output.html'

def titleize(title)
	titleized=title.dup
	titleized[0]=titleized[0].upcase
	titleized
end

def renderTemplate(filename)
	filename='erb-templates/'+filename unless filename.match(/\//)
	result=Tilt::ERBTemplate.new(filename).render(self)
end

@cv = JSON.load(File.new(json_file))
@header = @cv["header"]
@skills = @cv["skills"]
@content = @cv["content"]

File.write(output_filename, renderTemplate('main.erb'))

system("chromium --incognito http://localhost:3000/#{output_filename}")
