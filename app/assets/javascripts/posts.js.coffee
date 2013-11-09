$ ->
  $('#post_form').submit (event) ->
    event.preventDefault()
    $title = $('#post_title')
    $body = $('#body')

    blogPost = {title: $title.val(), body: $body.val()}
    post = $.ajax(url:"/posts", type: "post", data:{post: blogPost})
    $title.val("")
    $body.val("")
    post.done (data)->
      $("#posts").prepend(
        "<div class='text_div' data-id=" +data['id']+ "><h3>"+data["title"]+"</h3><br>"+data["body"]+
        "<form class='Post' data-id=" +data['id']+ " >" +
          "<input type='text' id='comment_text'>
          <input type='submit'>
         </form>"
        "</div>")

  ($ 'body').delegate '.Post','submit', (event) ->
    event.preventDefault()
    id = $(this).attr('data-id')
    type = $(this).attr('class')
    $comment = $(this).children('#comment_text')


    comment_text = {text: $comment.val(), commentable_id: id,commentable_type: type }
    console.log (comment_text.commentable_type)


    comment_post = $.ajax(url:"/posts/"+id+"/comments", type: "post", data:{post: comment_text})

    comment_post.done (data)->

    $(this).parent().append(
         comment_text.text+"<br>")


























