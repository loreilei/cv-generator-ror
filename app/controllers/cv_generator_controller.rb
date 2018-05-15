class CvGeneratorController < ApplicationController
  def index
  end

  def display
  	i18n_file = "i18n.json"
  	i18n = JSON.load(File.new(File.join(File.dirname(__FILE__), 'cv-generator', i18n_file)))
 	
  	json_content = params[:resume_json_file].read()
  	@cv = JSON.parse(json_content)

    unless params[:portrait_image_file].nil?
      portrait_img_file_content = params[:portrait_image_file].read()
      @portrait_image_type = params[:portrait_image_file].content_type
      @portrait_image_b64 = Base64.encode64(portrait_img_file_content)
    end

    @i18n = i18n[@cv["i18n"]]

    @header = @cv["header"]
    @skills = @cv["skills"]
    @content = @cv["content"]
  end
end
