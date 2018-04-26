{% if polls %}
{% for poll in polls %}
  <style>
    #poll-content {
      max-width:300px; 
      margin-bottom:15px;   
    }
    #poll-content > h2 {
      font-size:21px; 
    }
    .bar-main-container {
      margin-bottom:10px;
      -webkit-border-radius: 4px;
      -moz-border-radius: 4px;
      border-radius: 4px;
       position:relative;  
    }
    .bar-main-container h4 {
      margin:0 0 4px; letter-spacing:0.4px;
      font-size:0.95em;   
    }
    .bar-percentage {
      width:70px;
      font-size:13px; 
      position:absolute;
      top:13px; right:0; 
    }
    .bar-container {
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      height: 10px;
      background: rgba(0,0,0,0.13);
      margin: 5px 75px 12px 0;
      overflow: hidden;
      display:block; 
    }
    .bar-main-container .bar {
      height: 100%;
      -webkit-border-radius: 10px 0px 0px 10px;
      -moz-border-radius: 10px 0px 0px 10px;
      border-radius: 10px 0px 0px 10px;      
    }
    .azure .bar { background: #38B1CC; }
    .success .bar { background: #2CB299; }
    .info .bar  { background: #5c92d5; }
    .warning .bar  { background: #EFC32F; }
    .danger  .bar    { background: #E44C41; }
  </style>

  <div id="poll-content">
    <form action="/poll/vote" method="post">
      <input type="hidden" name="poll_id" value="{{poll.getId()}}">  
      <h3>{{ poll.getTitle() }}</h3>

      {% for field in poll.options %}         
        <div class="radio">
          <input type="radio" name="vote" id="vote_{{field.getId()}}" value="{{field.getVote()}}">
          <label for="vote_{{field.getId()}}">{{field.getTitle()}}</label>
        </div>                     
      {% endfor %}
      <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="{{helper.translate('Vote')}}">
      </div>
    </form>
  </div>

  <script>
  $(document).ready(function() {

    var pollLang = "poll_{{constant('LANG')}}";
    var pollId = "{{poll.getId()}}";

    function resultPoll(id){
      $.post("/poll/vote/"+id+"?lang={{constant('LANG')}}", function (response) {
        if (response.success) {
          var classes = ['success','info','warning','danger'];
          $poll_html = ['<h2>'+response.title+'</h2>'];
          response.data.forEach(function(item, index){
            var vote = Math.round((item.vote / response.total) * 100);
            $poll_html.push('<div class="bar-main-container '+classes[index]+'"><div class="wrap"><h4>'+item.title+'</h4><div class="bar-container"><div class="bar" style="width:'+vote+'%"></div></div><div class="bar-percentage">'+item.vote+' ('+vote+'%)</div></div></div>');
          });        
          $('#poll-content').html($poll_html);
        }
      });
    }
    if($.cookie(pollLang) === pollId){
      resultPoll(pollId);
    }

    var formContent = $('#poll-content'); 
    var formID = formContent.find('form'); 

    formID.submit(function() {
      $.cookie(pollLang, pollId, { expires: 365, path: '/'});
      $('.ajax-loader').show();
      $(this).ajaxSubmit({     
        success: function(res) { 
          resultPoll(res.id);  
        }
      }); 
      return false; 
    });    
    
  });
  </script>  
{% endfor %}
{% endif %}
