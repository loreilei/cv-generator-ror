require 'erb'
require 'tilt'
require 'json'

#A script to generate the html page from erb files and json file

i18n_file = "i18n.json"
json_file = ARGV[0]
json_file = 'cv_generic.json' if json_file.nil?
output_filename = 'output.html'

def titleize(title)
	titleized=title.dup
	titleized[0]=titleized[0].upcase
	titleized
end

def renderTemplate(filename)
	filename='erb-templates/'+filename unless filename.match(/\//)
	result=Tilt::ERBTemplate.new(filename).render(self)
end

@i18n_full = JSON.load(File.new(i18n_file))
@cv = JSON.load(File.new(json_file))
@header = @cv["header"]
@skills = @cv["skills"]
@content = @cv["content"]
@i18n = @i18n_full[@cv["i18n"]]

File.write(output_filename, renderTemplate('main.erb'))

system("chromium --incognito http://localhost:3000/#{output_filename}")
