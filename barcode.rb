require 'sinatra'
require 'barby'
require 'base64'
require 'barby/barcode/code_128'
require 'barby/outputter/png_outputter'

get '/' do
  erb :show
end

post '/' do
  @barcode = Barby::Code128.new(params[:convert])
  @raw_png_data = Base64.encode64(@barcode.to_png.to_s)
  erb :show
end
