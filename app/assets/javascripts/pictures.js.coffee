$ ->
  $('#pictures_form').submit (event) ->
    event.preventDefault()
    $title = $('#pic_title')
    $url = $('#url')

    picturePost = {title: $title.val(), url: $url.val()}
    post = $.ajax(url:"pictures", type: "post", data:{pic: picturePost})
    $title.val("")
    $url.val("")
    post.done (data)->

      $("#posts").prepend(
        "<div class='pic_div' data-id"+data['id']+">" +
        "<h3>"+ data['title']+ "</h3>" + "<br>" +
        "<img src='" + data["url"] + "'>" + "<br>" +
        "<form class='Picture' data-id="+data['id']+ ">" +
          "<input type='text' id='comment_text'>
          <input type='submit'>
         </form>"
        + "</div>")
  ($ 'body').delegate '.Picture','submit', (event) ->
    event.preventDefault()
    id = $(this).attr('data-id')
    type = $(this).attr('class')
    $comment = $(this).children('#comment_text')

    comment_text = {text: $comment.val(), commentable_id: id,commentable_type: type }
    comment_picture = $.ajax(url:"/pictures/"+id+"/comments", type: "post", data:{post: comment_text})

    comment_picture.done (data)->

    $(this).parent().append(
        comment_text.text+"<br>")




