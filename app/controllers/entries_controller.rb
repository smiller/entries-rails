class EntriesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:preview, :markdown_preview]

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

  def markdown_preview
    output = ""
    if params[:md_textin].present?
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      output = markdown.render(params[:md_textin])
      puts output
    end
    render json: { md_textout: output.html_safe }
  end
end
