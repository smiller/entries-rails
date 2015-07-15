class EntriesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:preview]

  def new
  end

  def preview
    output = ""
    if params[:textin].present?
      entry = ::EntryBuilder.new(params[:textin].split("\n")).build
      output = ::HtmlFormatter.new(entry).format
    end
    render json: { textout: output.html_safe }
  end
end
