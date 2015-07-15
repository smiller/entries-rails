function buildPreview(){
  $.post("/preview", { textin: $("#textin").val() },  function(data) {
    $("#textout").empty();
    $("#textout").append($.parseHTML(data.textout))
    setTimeout(buildPreview,10000);
  });
}

buildPreview();
