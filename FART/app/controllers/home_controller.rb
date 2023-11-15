class HomeController < ApplicationController
  def index
    @selected_ai_image = select_random_image('ai_images')
    @selected_real_image = select_random_image('real_images')
  end

  def submit_response
    # Create a new response with the parameters from the form
    response = Response.new(response_params)
    response.user_id = cookies[:user_id] # Assuming you store user_id in cookies
    response.correctly_identified = (response.image_identified_as_ai == correct_ai_image)

    if response.save
      redirect_to root_path, notice: 'Response was successfully submitted.'
    else
      redirect_to root_path, alert: 'Error submitting response.'
    end
  end

  def response_params
    params.require(:response).permit(:first_image_url, :second_image_url, :image_preferred, :image_identified_as_ai)
  end

  private

  # lmao this function is deprecated tee hee
  def load_images_from_csv
    ai_images_path = Rails.root.join('lib', 'assets', 'ai_images.csv')
    real_images_path = Rails.root.join('lib', 'assets', 'real_images.csv')

    @ai_images = CSV.read(ai_images_path).flatten
    @real_images = CSV.read(real_images_path).flatten

    @ai_images = @ai_images.map { |url| url.strip.encode("UTF-8", invalid: :replace, undef: :replace, replace: "") }
    @real_images = @real_images.map { |url| url.strip.encode("UTF-8", invalid: :replace, undef: :replace, replace: "") }
  end

  private

  def correct_ai_image
    @ai_image_url
  end

  def select_random_image(folder)
    images = Dir.glob("public/#{folder}/*").map { |file| "/" + file.sub('public/', '') }
    images.sample
  end
end
