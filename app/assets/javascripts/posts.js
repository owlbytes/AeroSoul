$(document).ready(function() {
    $('#live_status').change(function() {
        var liveStatus = $(this).is(":checked");
        var postId = $(this).data("post-id");

        $.ajax({
          url: "/posts/"+postId,
          type: "PUT",
          data: {
            post: {
              live: liveStatus
            }
          }
        });
    });
});