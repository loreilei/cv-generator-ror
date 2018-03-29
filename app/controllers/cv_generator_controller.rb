class CvGeneratorController < ApplicationController
  def index
  end

  def display
  	i18n_file = "i18n.json"
  	i18n = JSON.load(File.new(File.join(File.dirname(__FILE__), 'cv-generator', i18n_file)))
 	
  	json_content = params[:resume_json_file].read()
  	@cv = JSON.parse(json_content)
	@i18n = i18n[@cv["i18n"]]

	@header = @cv["header"]
	@skills = @cv["skills"]
	@content = @cv["content"]
  end
end
