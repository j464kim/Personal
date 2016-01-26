class PagesController < ApplicationController
  def home
  end

  def about
  end

  def portfolio
  	pdf_filename = File.join(Rails.root, "tmp/_resume.pdf")
  	send_file(pdf_filename, :filename => "_resume.pdf", :disposition => "application/pdf")
  end

 
end
