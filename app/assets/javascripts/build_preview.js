function buildPreview(){
  $.post("/preview", { textin: $("#textin").val() },  function(data) {
    $("#textout").empty();
    $("#textout").append($.parseHTML(data.textout))
    setTimeout(buildPreview,10000);
  });
}

buildPreview();

function buildMarkdownPreview(){
  $.post("/markdown_preview", { md_textin: $("#md_textin").val() },  function(data) {
    $("#md_textout").empty();
    $("#md_textout").append($.parseHTML(data.md_textout))
    setTimeout(buildMarkdownPreview,10000);
  });
}

buildMarkdownPreview();
